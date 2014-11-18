From: Peder Alm <peder.alm@semcon.com>
Date: Tue, 18 Nov 2014 14:48:07 +0000
Subject: [Buildroot] Unable to boot Arm926t with big endian support
In-Reply-To: <87y4r8pqf4.fsf@dell.be.48ers.dk>
References: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
 <87389gr6pi.fsf@dell.be.48ers.dk>
 <B28B6A721CC23347BBD5566C377D30416461F23B@se-got-mb01.semcon.se>,
 <87y4r8pqf4.fsf@dell.be.48ers.dk>
Message-ID: <B28B6A721CC23347BBD5566C377D30416461F269@se-got-mb01.semcon.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Dear Peter
>>> -8 is ENOEXEC, E.G. most likely invalid ELF variant.
>>>
>>> Your kernel is running in big endian mode, right?

>> How do I know if my kernel is running in BE mode? I have just changed
>> the settings in Buildroot configuration. I found no settings for BE
>> mode in the Linux kernel configuration when I added support for NFS.

> For ARM the config option is CPU_BIG_ENDIAN:
> git grep -A2 BIG_ENDIAN arch/arm/mm/Kconfig | head -n 3
> arch/arm/mm/Kconfig:config CPU_BIG_ENDIAN
> arch/arm/mm/Kconfig-    bool "Build big-endian kernel"
> arch/arm/mm/Kconfig:    depends on ARCH_SUPPORTS_BIG_ENDIAN

Running make linux-menuconfig and searching for CPU_BIG_ENDIAN I find that it is set to 'n' and I have no possibility to change this. It looks like Buildroot never enables big endian for the kernel despite of the ARM (big endian) selection in Buildroot configuration.
