From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 16:39:06 +0100
Subject: [Buildroot] libgcc erroneously built as armv5 for
 arm920t(armv4t)
In-Reply-To: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
References: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
Message-ID: <20131102163906.0b558177@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear adam hussein\(!\),

On Thu, 26 Sep 2013 08:34:53 -0700 (PDT), adam hussein\(!\) wrote:

> I've been building the at91rm9200ek configuration of buildroot to get a toolchain I can use to build u-boot with some board specific configuration.
> 
> This is an ARM920T core chip with ARMv4T architecture??- later ARM9 series have ARMv5TE architecture (http://en.wikipedia.org/wiki/ARM9)
> 
> When gcc is built, or perhaps specifically libgcc only, it seems the selection of 920t/v4 architecture gets lost and v5 is used instead.
> This means that when I use it to build u-boot, I find it has the __udivsi3 function using the illegal (to v4) instruction CLZ (count leading zeros).
> 
> The easiest workaround for me is to specify arm7tdmi and be done with it, but I'd like to try contributing a proper fix if possible.

Can you try the attached patch? Ideally, it would be nice if you could
try it with two configurations:

 * With the internal toolchain backend
 * With the Sourcery CodeBench 2013.05 external toolchain

and run it on real hardware.

Thanks a lot for your testing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-arch-use-BR2_GCC_TARGET_CPU-on-ARM.patch
Type: text/x-patch
Size: 1391 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131102/3a0545f1/attachment.bin>
