From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Aug 2014 09:08:00 +0200
Subject: [Buildroot] [git commit] package/fbv: Fix static linking
	against libpng
In-Reply-To: <CANxTyt5JN2JSp23zc=2XvNZastVtnBsG0KM-u-XTfsUi88xgfA@mail.gmail.com>
 (Danomi Manchego's message of "Mon, 11 Aug 2014 18:03:16 -0400")
References: <20140811213123.B361B9D41E@busybox.osuosl.org>
 <CANxTyt5JN2JSp23zc=2XvNZastVtnBsG0KM-u-XTfsUi88xgfA@mail.gmail.com>
Message-ID: <87lhqu5gof.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

Hi,

 >> --- a/package/fbv/fbv.mk
 >> +++ b/package/fbv/fbv.mk
 >> @@ -15,6 +15,12 @@ FBV_DEPENDENCIES = # empty
 >> FBV_CONFIGURE_OPTS = # empty
 >> ifeq ($(BR2_PACKAGE_FBV_PNG),y)
 >> FBV_DEPENDENCIES += libpng
 >> +
 >> +# libpng in turn depends on other libraries
 >> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
 >> +FBV_CONFIGURE_OPTS += "--libs=$(shell $(PKGg_CONFIG_HOST_BINARY) --libs libpng --static)"

 > Er, extra "g" in "PKGg_CONFIG_HOST_BINARY" ?

Crap. I saw it myself, fixed it - But forgot to ammend the commit :/

Thanks - Will fix.

-- 
Venlig hilsen,
Peter Korsgaard 
