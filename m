From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 16:12:49 +0200
Subject: [Buildroot] [PATCH 02/16 v3] core: commonalise the bundled and
 br2-external %_defconfig rules
In-Reply-To: <e302f10d06b7406978bbc888b903cb917cb0e754.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e302f10d06b7406978bbc888b903cb917cb0e754.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827161249.26d4c72e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:22 +0200, Yann E. MORIN wrote:

> +define percent_defconfig
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
> +	# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig

This comment in here was a bit annoying, because it appears on stdout
when you run "make <foo>_defconfig". So I've moved it outside of the
target definition instead, in order to preserve the existing behavior
in terms of what appears on stdout when loading a defconfig.

Applied to next with this change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
