From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 10:01:15 +0200
Subject: [Buildroot] [PATCH 5/5 v4] busybox: convert to kconfig-package
 infrastructure
In-Reply-To: <437a2f63b7dd1357bf859133053f4b877bc2a0e9.1407079864.git.yann.morin.1998@free.fr>
References: <cover.1407079864.git.yann.morin.1998@free.fr>
 <437a2f63b7dd1357bf859133053f4b877bc2a0e9.1407079864.git.yann.morin.1998@free.fr>
Message-ID: <20140804100115.6739393e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas,

On Sun,  3 Aug 2014 17:32:43 +0200, Yann E. MORIN wrote:

> +BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
> +BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
> +BUSYBOX_KCONFIG_OPT = $(BUSYBOX_MAKE_OPTS)

At some point, maybe we'll want to refactor this a bit. It seems silly
to define BUSYBOX_CONFIG_FILE and BUSYBOX_MAKE_OPTS to then have to
"rename" them just for the sake of the kconfig-package infra usage. Why
not giving them the right name for the beginning?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
