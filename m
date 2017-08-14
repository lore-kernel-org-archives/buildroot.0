From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:39:37 +0200
Subject: [Buildroot] [PATCH] ci20: update kernel and u-boot
In-Reply-To: <20170813171039.GA7676@waldemar-brodkorb.de>
References: <20170813171039.GA7676@waldemar-brodkorb.de>
Message-ID: <20170814223937.3f2c7d26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Aug 2017 19:10:39 +0200, Waldemar Brodkorb wrote:
> Unbreak failing defconfig.
> Resulting kernel and rootfs booted on ci20 device.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I've applied to master, after doing an additional tweak...

> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
> -BR2_TARGET_UBOOT_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa"
> +BR2_TARGET_UBOOT_VERSION="dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa"

I've dropped the BR2_TARGET_UBOOT_VERSION line, which was useless,
because BR2_TARGET_UBOOT_VERSION is a hidden variable, and therefore
has no business being present in a defconfig.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
