From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Jun 2019 08:52:59 +0200
Subject: [Buildroot] [git commit] package/brotli: work around gcc bug
 68485
In-Reply-To: <b01b61c5-4105-efb8-37db-bb5f0479b568@micronovasrl.com> (Giulio
 Benetti's message of "Fri, 7 Jun 2019 08:40:27 +0200")
References: <20190527220327.636798E6D4@busybox.osuosl.org>
 <87y32ehh34.fsf@dell.be.48ers.dk>
 <b01b61c5-4105-efb8-37db-bb5f0479b568@micronovasrl.com>
Message-ID: <87imthdgz8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

Hi,

 >> > +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 >> > +BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="-O0"
 >> 
 >> Hmm, why is this not "$(TARGET_C_FLAGS) -O0" like for the other
 >> packages?

 > Because CFLAGS were needed only once in that package.

Yes, but we should still pass TARGET_CFLAGS as well.

 > Anyway, if you say, I can modify it and use a BROTLI_CFLAGS
 > intermediate variable.

That is less important, but we shouldn't drop TARGET_CFLAGS.

-- 
Bye, Peter Korsgaard
