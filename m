From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 15:11:08 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: add optional libmpdclient
 dependency
In-Reply-To: <20180402111134.23776-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 2 Apr 2018 13:11:34 +0200")
References: <20180402111134.23776-1-fontaine.fabrice@gmail.com>
Message-ID: <874lktois3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/mpd/mpd.mk | 7 +++++++
 >  1 file changed, 7 insertions(+)

 > diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
 > index f50e3d90c7..e1569b64cf 100644
 > --- a/package/mpd/mpd.mk
 > +++ b/package/mpd/mpd.mk
 > @@ -31,6 +31,13 @@ else
 >  MPD_CONF_OPTS += --disable-icu
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_LIBMPDCLIENT),y)
 > +MPD_DEPENDENCIES += libmpdclient

All other optional dependencies are handled by a BR2_PACKAGE_MPD_<foo>
suboption. Any specific reason why you are not doing that here?

-- 
Bye, Peter Korsgaard
