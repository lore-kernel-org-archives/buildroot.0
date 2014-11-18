From: Peder Alm <peder.alm@semcon.com>
Date: Tue, 18 Nov 2014 15:45:45 +0000
Subject: [Buildroot] Unable to boot Arm926t with big endian support
In-Reply-To: <87tx1wpnii.fsf@dell.be.48ers.dk>
References: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
 <87389gr6pi.fsf@dell.be.48ers.dk>
 <B28B6A721CC23347BBD5566C377D30416461F23B@se-got-mb01.semcon.se>
 <87y4r8pqf4.fsf@dell.be.48ers.dk>
 <B28B6A721CC23347BBD5566C377D30416461F269@se-got-mb01.semcon.se>,
 <87tx1wpnii.fsf@dell.be.48ers.dk>
Message-ID: <B28B6A721CC23347BBD5566C377D30416461F28F@se-got-mb01.semcon.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> So that means that your ARM variant doesn't have any big endian support.

> git grep ARCH_SUPPORTS_BIG_ENDIAN                                     ~/source/linux-2.6/arch/arm
> Kconfig:        select ARCH_SUPPORTS_BIG_ENDIAN
> mach-highbank/Kconfig:  select ARCH_SUPPORTS_BIG_ENDIAN
> mach-keystone/Kconfig:  select ARCH_SUPPORTS_BIG_ENDIAN
> mach-mvebu/Kconfig:     select ARCH_SUPPORTS_BIG_ENDIAN
> mach-vexpress/Kconfig:  select ARCH_SUPPORTS_BIG_ENDIAN
> mach-zynq/Kconfig:      select ARCH_SUPPORTS_BIG_ENDIAN

> So big endian is only supported for ixp4xx, highbank, keystone, mvebu, vexpress and zynq.

As I read the Atmel documenation for my CPU it tells me that it does support both little and big endian. Found this on at.com:
--------------------------------------------------------------------------------------------
Look at the bottom of page 40 in the doc6221.pdf doc,it says
"For more details, see Chapter 2 in ARM926EJ-S TRM, ref. DDI0198B."

Looking in the "ARM926EJ-S Technical Reference Manual" on page 2-13,
located at:
http://www.atmel.com/dyn/resources/prod_documents/arm_926ejs_trm.pdf

we find:
Table 2-11 Control bit functions register c1 (continued)
[7] B bit Endianness: 0 = Little-endian operation 1 = Big-endian operation. Set to
the value of BIGENDINIT on reset.
--------------------------------------------------------------------------------------------

/Peder
