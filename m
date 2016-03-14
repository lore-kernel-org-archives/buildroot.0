From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 21:43:34 +0100
Subject: [Buildroot] tar failing to build with latest buildroot
In-Reply-To: <1457982423.1938.1.camel@rovoreed.com> (Mike Davies's message of
 "Mon, 14 Mar 2016 19:07:03 +0000")
References: <1457951104.2051.1.camel@rovoreed.com>
 <874mc9dygn.fsf@dell.be.48ers.dk>
 <1457982423.1938.1.camel@rovoreed.com>
Message-ID: <87fuvsdc3t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Davies <busybox_mail@rovoreed.com> writes:

Hi,

 > Thanks for the reply. I tried a full rebuild with a 'make clean all'
 > and it fails exactly the same again.

 > Here is my defconfig. You'll see I have my own config file for uClibc.
 > That follows the defconfig, and you'll see that WCHAR is enabled.

 > BR2_arm=y
 > BR2_cortex_a7=y
 > BR2_ARM_FPU_NEON_VFPV4=y
 > BR2_KERNEL_HEADERS_4_1=y
 > BR2_UCLIBC_CONFIG="uClibc_armv7.config"

Why are you using a custom uClibc configuration? Judging from the
hostname and packages enabled, it doesn't seem like you need to squeeze
the last few bytes out of the system.

 > uClibc_armv7.config ...

Diffing this with our default uclibc config, I see:

 > # UCLIBC_HAS_OBSTACK is not set

Whereas our config has it enabled. Judging from the error message this
is most likely the reason it fails for you.

Can you please retry with our default uclibc config?

-- 
Venlig hilsen,
Peter Korsgaard 
