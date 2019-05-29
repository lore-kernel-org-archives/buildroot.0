From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 May 2019 15:59:36 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_63261
In-Reply-To: <20190529135341.23842-2-giulio.benetti@micronovasrl.com>
References: <20190529135341.23842-1-giulio.benetti@micronovasrl.com>
 <20190529135341.23842-2-giulio.benetti@micronovasrl.com>
Message-ID: <20190529155936.6b61692f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

Thanks for all this work on Microblaze toolchain bugs!

On Wed, 29 May 2019 15:53:39 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
> +# longer exists in gcc 8.x.
> +config BR2_TOOLCHAIN_HAS_GCC_BUG_63261
> +	bool
> +	default y if BR2_microblaze
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8

If I understand correctly, this bug only triggers when
BR2_ENABLE_DEBUG=y, so this option should have a:

	depends on BR2_ENABLE_DEBUG

perhaps ?

Semantically, the toolchain is indeed always affected by bug 63261, but
it only manifests itself when BR2_ENABLE_DEBUG=y, and it's easier to
have this information in one place (where
BR2_TOOLCHAIN_HAS_GCC_BUG_63261) rather than in each package.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
