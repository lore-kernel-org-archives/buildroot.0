From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 00:09:58 +0200
Subject: [Buildroot] [PATCH v2] chrony: new package
In-Reply-To: <1367866876-5339-1-git-send-email-ntl@pobox.com> (Nathan Lynch's
 message of "Mon, 6 May 2013 14:01:16 -0500")
References: <1367866876-5339-1-git-send-email-ntl@pobox.com>
Message-ID: <87wqrb4v61.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathan" == Nathan Lynch <ntl@pobox.com> writes:

 Nathan> Signed-off-by: Nathan Lynch <ntl@pobox.com>
 Nathan> ---

 Nathan>  v2: Add upstream URL to help text
 Nathan>      Add dependency on BR2_USE_MMU (fork)
 Nathan>      Add header to chrony.mk
 Nathan>      Checked build with br-arm-basic, br-arm-full-nothread; no changes needed

Thanks, but:

Unrecognized option :  --target=arm-buildroot-linux-uclibcgnueabi
Unrecognized option :  --host=arm-buildroot-linux-uclibcgnueabi
Unrecognized option :  --build=x86_64-unknown-linux-gnu
Unrecognized option :  --program-prefix=
Unrecognized option :  --disable-gtk-doc
Unrecognized option :  --disable-doc
Unrecognized option :  --disable-docs
Unrecognized option :  --disable-documentation
Unrecognized option :  --with-xmlto=no
Unrecognized option :  --with-fop=no
Unrecognized option :  --enable-ipv6
Unrecognized option :  --enable-static
Unrecognized option :  --enable-shared
Configuring for  Linux-x86_64
Checking for math : No
Checking for math in -lm : Yes
Checking for <stdint.h> : Yes
Checking for <inttypes.h> : Yes
Checking for IPv6 support : Yes
Checking for in6_pktinfo : No
Checking for in6_pktinfo with _GNU_SOURCE : Yes
Checking for <sys/timepps.h> : No
Checking for <timepps.h> : No
Checking for linuxcaps : No
Checking for <linux/rtc.h> : Yes
Checking for sched_setscheduler() : Yes
Checking for mlockall() : Yes
Checking for editline : No
Checking for readline : No
Package nss was not found in the pkg-config search path.
Perhaps you should add the directory containing `nss.pc'
to the PKG_CONFIG_PATH environment variable
No package 'nss' found
Package nss was not found in the pkg-config search path.
Perhaps you should add the directory containing `nss.pc'
to the PKG_CONFIG_PATH environment variable
No package 'nss' found
Checking for NSS : No
Checking for tomcrypt : No


So apparently it isn't using autotools, but a handwritten
configure. This could make it troublesome to use the autotools-package
support (I haven't looked in detail to see if it's a problem though).

The 'Configuring for  Linux-x86_64' is a bit worrysome as I'm building
for ARM.

The PKG_CONFIG_PATH warnings is an indication that you should depend on
host-pkgconf. We also have a libnss package so you could add optional
support for it.

-- 
Bye, Peter Korsgaard
