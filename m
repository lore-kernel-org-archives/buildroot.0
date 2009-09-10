From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Sep 2009 08:30:10 +0200
Subject: [Buildroot] [PATCH 4/5] Remove BR2_TOPDIR_PREFIX and
 BR2_TOPDIR_SUFFIX
In-Reply-To: <20090909173535.GA17081@mx.loc>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<2f7f4e844f89b99bde1ab32524d43ee7a82825a5.1252361088.git.thomas.petazzoni@free-electrons.com>
	<20090909173535.GA17081@mx.loc>
Message-ID: <20090910083010.116ab844@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernhard,

Thanks for your comments!

Le Wed, 9 Sep 2009 19:35:35 +0200,
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :

Le Wed, 9 Sep 2009 19:35:35 +0200,
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :

> 1) COND_ARCH_FPU_SUFFIX is _completely_ useless, to say the least.

This one is removed by PATCH 5/5.

> 2) TOPDIR_PREFIX and TOPDIR_SUFFIX don't hurt and are convenient for
> some corner-cases. I'd keep them.

As they don't provide any additional value over O=, I'd prefer to keep
O=. One of the reason for which Buildroot is too complicated today is
because there are multiple ways of achieving the same thing. This
multitude of options is confusing for newcomers.

> 3) I'd much prefer if we could
> rather settle on
> TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)$(ARCH)$(ARCH_FPU_SUFFIX)$(ARCH_MMU_SUFFIX)$(TOPDIR_SUFFIX)_toolchain
> BUILD_DIR
> =$(BASE_DIR)/$(TOPDIR_PREFIX)$(ARCH)$(ARCH_FPU_SUFFIX)$(ARCH_MMU_SUFFIX)$(TOPDIR_SUFFIX)_build
> 
> so you can conveniently rm -rf powerpc_nofpu_* (for example)

See PATCH 5/5, these are completely changed to something else.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
