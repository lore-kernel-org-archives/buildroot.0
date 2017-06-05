From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 05 Jun 2017 20:44:45 +0200
Subject: [Buildroot] [PATCH 2/9] package/darktable: new package
References: <20170305151004.2815-1-romain.naour@gmail.com>
 <20170305151004.2815-2-romain.naour@gmail.com>
 <20170305164433.d4qztfsrop5agq3a@tarshish>
Message-ID: <tdlg0ex6ur.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 05 Mar 2017 18:44:33 +0200 schrieb Baruch Siach:

>> +# Darktable is only available for x86_64 or aarch64 little endian 
system only.
>> +# Experimental support for i386 (not recommended).
>> +# Building without SSE2 on x86_64 is highly experimental.
>> +# See src/is_supported_platform.h
>> +config BR2_PACKAGE_DARKTABLE_ARCH_SUPPORTS
>> +	bool
>> +	default y if (BR2_x86_64 && BR2_X86_CPU_HAS_SSE && 
BR2_X86_CPU_HAS_SSE2) || \
>> +		BR2_aarch64
> 
> BR2_X86_CPU_HAS_SSE2=y implies BR2_X86_CPU_HAS_SSE=y. So this is 
equivalent to 
> (BR2_x86_64 && BR2_X86_CPU_HAS_SSE2) || BR2_aarch64.

Hi,

maybe even simplier?

	default y if BR2_aarch64 || BR2_x86_64

All x86_64 CPUs have sse2 support, it started with the Pentium4.

Do we need the BR2_PACKAGE_DARKTABLE_ARCH_SUPPORTS option at all after 
this simplification?

	depends on !BR2_TOOLCHAIN_USES_MUSL

needs to be added as well since
https://git.buildroot.net/buildroot/commit/?
id=d887fde42540bb6079c66f72e1462bfcda402006

The patch also needs a rebase, it does not apply cleanly against
package/Config.in anymore.

Regards, Bernd
