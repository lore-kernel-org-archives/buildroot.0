From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:16:16 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
In-Reply-To: <20151010150457.GD3640@free.fr>
References: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
 <20151010150457.GD3640@free.fr>
Message-ID: <20151012231616.3fd41b57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 10 Oct 2015 17:04:57 +0200, Yann E. MORIN wrote:

> > +IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) KSRC=$(LINUX_DIR) CC=$(TARGET_CC)
> 
> Are you sure CC is needed? The kernel buildsystem should already set it, no?

Yes, it is really needed. The kernel buildsystem indeed defines CC, but
it gets re-defined by the iqvlinux Makefile, which gets included by the
kernel buildsystem since we do M=/path/to/iqvlinux to build the
iqvlinux module.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
