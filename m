From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Feb 2009 20:39:10 +0100
Subject: [Buildroot] [patch] mplayer: bump to v1.0rc2
In-Reply-To: <20090205171034.341e8a1c@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Thu\, 5 Feb 2009 17\:10\:34 +0100")
References: <20090205171034.341e8a1c@hcegtvedt>
Message-ID: <87tz6ydt41.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 Hans-Christian> Hi

 Hans-Christian> The attached patch bumps mplayer to v1.0rc2. I am
 Hans-Christian> unsure if any of the following patches needs to be
 Hans-Christian> converted as well:

Thanks.

 Hans-Christian> mplayer-1.0rc1-largefile.patch
 Hans-Christian> mplayer-1.0rc1-ppc-configure.patch
 Hans-Christian> mplayer-1.0rc1-remove-sys-timeb.patch

If they still applies then the problem most likely isn't solved yet,
so yes.

 Hans-Christian> The other patches in SVN are not needed for
 Hans-Christian> v1.0rc2. This patch also contains the Atmel vendor
 Hans-Christian> patch to give a boost on AVR32 devices.

What's the upstream status of that?

 Hans-Christian>  		--enable-cross-compile \
 Hans-Christian> -		--disable-mpdvdkit \

Did that option go away?

 Hans-Christian> +++ b/package/multimedia/mplayer/mplayer-1.0rc2-100-atmel.1.patch	2009-02-05 17:01:13.000000000 +0100

 Hans-Christian> ++++ b/version.sh
 Hans-Christian> +@@ -1,3 +1,3 @@
 Hans-Christian> + #!/bin/sh
 Hans-Christian> +-echo "#define VERSION \"1.0rc2-$1\"" > version.h
 Hans-Christian> +-echo "#define MP_TITLE \"MPlayer 1.0rc2-$1 (C) 2000-2007 MPlayer Team\"" >> version.h
 Hans-Christian> ++echo "#define VERSION \"1.0rc2.atmel.1-$1\"" > version.h
 Hans-Christian> ++echo "#define MP_TITLE \"MPlayer 1.0rc2.atmel.1-$1 (C) 2000-2007 MPlayer Team\"" >> version.h

NACK. Either we rename the patch to .patch.avr32 so it only gets
applied to avr32, or we get rid of that hunk.

-- 
Bye, Peter Korsgaard
