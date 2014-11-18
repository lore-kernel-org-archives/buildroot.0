From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 14:51:59 +0100
Subject: [Buildroot] Unable to boot Arm926t with big endian support
In-Reply-To: <B28B6A721CC23347BBD5566C377D30416461F23B@se-got-mb01.semcon.se>
 (Peder Alm's message of "Tue, 18 Nov 2014 13:43:46 +0000")
References: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
 <87389gr6pi.fsf@dell.be.48ers.dk>
 <B28B6A721CC23347BBD5566C377D30416461F23B@se-got-mb01.semcon.se>
Message-ID: <87y4r8pqf4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peder" == Peder Alm <peder.alm@semcon.com> writes:

 > Dear Peter
 >> -8 is ENOEXEC, E.G. most likely invalid ELF variant.
 >> 
 >> Your kernel is running in big endian mode, right?

 > How do I know if my kernel is running in BE mode? I have just changed
 > the settings in Buildroot configuration. I found no settings for BE
 > mode in the Linux kernel configuration when I added support for NFS.

For ARM the config option is CPU_BIG_ENDIAN:

git grep -A2 BIG_ENDIAN arch/arm/mm/Kconfig | head -n 3
arch/arm/mm/Kconfig:config CPU_BIG_ENDIAN
arch/arm/mm/Kconfig-    bool "Build big-endian kernel"
arch/arm/mm/Kconfig:    depends on ARCH_SUPPORTS_BIG_ENDIAN

-- 
Bye, Peter Korsgaard 
