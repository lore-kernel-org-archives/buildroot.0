From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:21:36 +0200
Subject: [Buildroot] [PATCH v2 2/2] fmlib: add powerpc e6500 support
In-Reply-To: <1463578886-43470-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463578886-43470-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1463578886-43470-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160612222136.4403ea28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 08:41:26 -0500, Matt Weber wrote:
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>

Why is this patch 2/2, when it is in fact a dependency of patch 1/2 ?
Patch 1/2 uses FMLIB_PLATFORM, which doesn't exist until patch 2/2 is
merged.


> +if BR2_PACKAGE_FMLIB
> +choice
> +	prompt "QORIQ Target Family"

The correct spelling is QorIQ according to Freescale's website.


> diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
> index 978810b..5655608 100644
> --- a/package/fmlib/fmlib.mk
> +++ b/package/fmlib/fmlib.mk
> @@ -25,11 +25,17 @@ ifeq ($(BR2_powerpc_e500mc),y)
>  FMLIB_ARCHTYPE = ppce500mc

So you're keeping the old definition of FMLIB_ARCHTYPE...

>  endif
>  
> +FMLIB_ARCHTYPE = $(call qstrip,$(BR2_PACKAGE_FMLIB_ARCHTYPE))

... and defining it again.

I've merged, after fixing those issues.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
