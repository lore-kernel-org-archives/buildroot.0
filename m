From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 21:40:10 +0200
Subject: [Buildroot] [PATCH v4 05/15] package/gcc: add support for gcc
 9.1
In-Reply-To: <20190620100725.105587-6-giulio.benetti@micronovasrl.com>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-6-giulio.benetti@micronovasrl.com>
Message-ID: <20190622214010.26580083@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 12:07:15 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> +config BR2_GCC_VERSION_9_X
> +	bool "gcc 9.x"
> +	# Broken or unsupported architectures
> +	depends on !BR2_or1k

gcc 8.x also had a depends on !BR2_csky, but I see that C-SKY support
has been merged in gcc 9.x, so I guess this one is not needed.

However, the depends !BR2_powerpc_spe that gcc 8.x has seemed
necessary, so I've added it for gcc 9.x as well.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
