From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Sep 2020 09:04:05 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain/buildroot: allow uclibc-ng
 for riscv
In-Reply-To: <20200908050744.425303-2-damien.lemoal@wdc.com>
References: <20200908050744.425303-1-damien.lemoal@wdc.com>
 <20200908050744.425303-2-damien.lemoal@wdc.com>
Message-ID: <20200908090405.4e7a2bcc@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Damien,

On Tue,  8 Sep 2020 14:07:40 +0900
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> uclibcb supports RISC-V architecture since version 1.0.31. Allow its
> selection for that architecture.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

In fact, we had already enabled support for uClibc-ng for RISC-V 64 in
commit bd9810e176273914eca1208bcba23f0de9e446b3, but we had to revert
in e7d631c0df1698b4edc94f148e7247869430e108 because uClibc-ng does not
implement the __riscv_flush_icache() function, which is needed, as some
GCC builtins emit calls to that function.

I have reported this issue to upstream uClibc-ng:

  https://mailman.uclibc-ng.org/pipermail/devel/2020-August/002022.html

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
