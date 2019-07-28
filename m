From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 13:51:44 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/libgcrypt: replace
 reconfigure patch with upstream patch
In-Reply-To: <20190728061023.5283-2-joerg.krause@embedded.rocks>
References: <20190728061023.5283-1-joerg.krause@embedded.rocks>
 <20190728061023.5283-2-joerg.krause@embedded.rocks>
Message-ID: <20190728135144.7e3f25de@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg,

On Sun, 28 Jul 2019 08:10:21 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> The `ac_cv_sys_symbol_underscore` reconfigure patch was added to
> Buildroot back in 2007 [1], but was not reported to upstream back then.
> 
> Meanwhile, the issue has been fixed upstream [2] after the version bump to
> version 1.8.4.
> 
> In order to add another upstream patch, which will add a pkg-config file
> for libgrypt and therefore requires autoreconfiguration as well, replace the
> current patch with the upstream patch.
> 
> [1] https://git.buildroot.net/buildroot/commit/package/libgcrypt?id=f1bcdf518fa7868b7819b0248f4b8da02a954dde
> [2] https://github.com/gpg/libgcrypt/commit/0f4545b441b6fbdd6e9c4e95f5f2a367483e78ad
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

I've applied the series to master, thanks.

On the mpd bump patch, you forgot to propagate:

	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS

which comes from selecting BR2_PACKAGE_LIBGCRYPT. So I've added that
and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
