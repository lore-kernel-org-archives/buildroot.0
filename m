From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 17:18:33 +0100
Subject: [Buildroot] [PATCH 07/51] core: add a global variable with
 already-unquoted global patch dir
In-Reply-To: <6fdfa014a8ab2bd00ae19074e82a6c91fdeb71de.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <6fdfa014a8ab2bd00ae19074e82a6c91fdeb71de.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <20151123171833.089fc12a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 23 Nov 2015 15:47:37 +0100, Yann E. MORIN wrote:

>  		package/gcc/$(GCC_VERSION)/*.patch \
> -		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
> -		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
> +		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(BR2_GLOBAL_PATCH_DIR)) \
> +		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(BR2_GLOBAL_PATCH_DIR))))

Should be BR_GLOBAL_PATCH_DIR, not BR2_GLOBAL_PATCH_DIR.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
