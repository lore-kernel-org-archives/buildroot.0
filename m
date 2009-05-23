From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 23 May 2009 06:53:47 +0000 (UTC)
Subject: [Buildroot] [Bug 345] libcurl package needs a urandom fix
In-Reply-To: <bug-345-163@https.bugs.busybox.net/>
References: <bug-345-163@https.bugs.busybox.net/>
Message-ID: <20090523065347.D11E97784F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=345





--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2009-05-23 06:53:47 UTC ---
No, we're not autoreconfing, but configure is generated from configure.ac
upstream, so the logic you see in configure.ac will be present in configure as
well.

I just did a test build and I still cannot reproduce it:

BR2_arm=y
BR2_arm922t=y
BR2_ARM_TYPE="ARM922T"
BR2_ARM_OABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm922t"
BR2_GCC_TARGET_ARCH="armv4t"
BR2_GCC_TARGET_ABI="apcs-gnu"
BR2_BINUTILS_VERSION_2_19_1=y
BR2_BINUTILS_VERSION="2.19.1"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
BR2_GCC_VERSION_4_3_3=y
BR2_GCC_SUPPORTS_SYSROOT=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.3.3"
BR2_TOOLCHAIN_SYSROOT=y
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_SHARED_LIBGCC=y
BR2_PTHREADS_OLD=y
BR2_PACKAGE_LIBCURL=y

grep urandom build_arm/libcurl-7.19.2/config.log

Are you sure configure doesn't think you have openssl installed? (On my system
I do have libssl-dev installed on the host, but configure doesn't pick it up)

Now, you could argue for adding --without-ssl to configure when we compile
without openssl support instead of relying on the autodection to not find
anything.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
