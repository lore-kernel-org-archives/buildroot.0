From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:20:08 +0200
Subject: [Buildroot] [PATCH v2 07/17] uclibc: disable DOPIC on ARM FLAT
In-Reply-To: <56ED7A4E.8020406@mind.be>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <56ED7A4E.8020406@mind.be>
Message-ID: <20160330002008.5e05acab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 17:11:58 +0100, Arnout Vandecappelle wrote:

>   Though I wonder: shouldn't uClibc detect this by itself? Similar to the BX 
> handling that you removed. Adding Waldemar in Cc to think about this.

I don't yet fully understand the different modes of elf2flt, and why
DOPIC affects what elf2flt is capable of doing/not doing.

However, if as Waldemar told me, a uClibc built with DOPIC=y will not
work with elf2flt on ARM, then I could indeed send a patch to uClibc to
disable DOPIC on ARM/noMMU.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
