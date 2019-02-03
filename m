From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Feb 2019 22:22:27 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/brcm-patchram-plus: Add new
 package
In-Reply-To: <20181224172847.8343-1-vadim4j@gmail.com>
References: <20181224172847.8343-1-vadim4j@gmail.com>
Message-ID: <58d451e0-2479-7e35-0480-af464761673c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/12/2018 18:28, Vadim Kochan wrote:
[snip]
> +++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256  7d63f3a0c79cb5d187a0f2647734601f9c97d4eb8e545ce9ace7653c1f3f9a58  brcm-patchram-plus-94fb127e614b19a9a95561b8c1a0716e2e1e6293.tar.gz

 Normally, we also require a hash for the license file. However, in this case,
it's pretty likely that the main.c file (and thus the hash) will change with
every version bump... So maybe a license file hash is inappropriate here?

 Regards,
 Arnout

> diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
> new file mode 100644
> index 0000000000..511ec991bc
> --- /dev/null
> +++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# brcm-patchram-plus
> +#
> +################################################################################
> +
> +BRCM_PATCHRAM_PLUS_VERSION = 94fb127e614b19a9a95561b8c1a0716e2e1e6293
> +BRCM_PATCHRAM_PLUS_SITE = $(call github,AsteroidOS,brcm-patchram-plus,$(BRCM_PATCHRAM_PLUS_VERSION))
> +BRCM_PATCHRAM_PLUS_LICENSE = Apache-2.0
> +BRCM_PATCHRAM_PLUS_LICENSE_FILES = src/main.c
> +BRCM_PATCHRAM_PLUS_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
> 
