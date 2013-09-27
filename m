From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Sep 2013 09:31:55 +0200
Subject: [Buildroot] libgcc erroneously built as armv5 for
 arm920t(armv4t)
In-Reply-To: <20130926175221.GC3418@free.fr>
References: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
 <20130926175405.67336473@skate> <20130926175221.GC3418@free.fr>
Message-ID: <20130927093155.57432f09@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 26 Sep 2013 19:52:21 +0200, Yann E. MORIN wrote:

> In crosstool-Ng, we have this:
>     http://crosstool-ng.org/hg/crosstool-ng/annotate/98b7806295cc/patches/gcc/4.4.5/210-arm-unbreak-armv4t.patch#l1
> 
> For gcc, if --with-cpu is not specified, then it defaults to
> TARGET_CPU_arm10tdmi which is an armv5 (as far as I understand it).

So even when --with-arch=armv7a, gcc will use --with-cpu=arm10tdmi? I'm
not sure to understand what will be the effect of having
--with-arch=armv7a and --with-cpu=arm10tdmi.

> The patch above downgrades the default CPU to an armv4t. Maybe worth a
> try. That, or passing --with-cpu=... as suggested by Adam.

Ok.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
