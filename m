From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:12:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: add
 BR2_PACKAGE_ALSA_LIB_UCM
In-Reply-To: <20191222131817.2334170-1-fontaine.fabrice@gmail.com>
References: <20191222131817.2334170-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222231250.38a6a303@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 14:18:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ucm needs mixer since version 1.2.1 and
> https://github.com/alsa-project/alsa-lib/commit/5c88b183718ce3df11bc4753c76d95f3e9de6c7e
> 
> So add a BR2_PACKAGE_ALSA_LIB_UCM option that selects
> BR2_PACKAGE_ALSA_LIB_MIXER and selects this new option in
> BR2_PACKAGE_ALSA_UTILS_ALSAUCM to avoid a build failure
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/aaa615d4e38d100bb9001ecdf7357e755ef42a87
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, applied, with one change. See below.

> +config BR2_PACKAGE_ALSA_LIB_UCM
> +	bool "ucm"
> +	select BR2_PACKAGE_ALSA_LIB_MIXER
> +	default y

The correct order is to have the "default" line before the "select".
This is reported by "make check-package". Of course, this is not a
kconfig rule, just a Buildroot best practice to keep things consistent
between packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
