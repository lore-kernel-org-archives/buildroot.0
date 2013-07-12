From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jul 2013 18:19:07 +0200
Subject: [Buildroot] [PATCH v5 1/3] powervr: add powervr virtual package
In-Reply-To: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
References: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130712181907.1d514e82@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri, 12 Jul 2013 09:34:36 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Sundareson, Prabindh <prabu@ti.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Sinan Akpolat <sinan@linkas.com.tr>
> ---
> v5:
>  - Fixed build issues on hard float (and non-CS toolchains)
>  - added powervr virtual package
> v4:
>  - Fix header issue with qt.
>  - Add eglimage version installation.
> v3:
>  - integrate reviews from thomas.
>  - Add qt patch
> v2:
>  - Take into account reviews.
>  - Simplfy init script.
>  - Fix header installation.
> v1:
>  - Added .pc files
>  - all review issues addressed
> RFC v3:
>  - all reviews addressed
>  - added demos
>  - added hard float (not runtime tested)
>  - added init script
>  - added SGX detection script (untested)
>  - tested on beaglexm using demos
> RFC v2:
>  - basic working with minor issues during tests
> RFC v1:
>  - inital revision

Not need to resend your patch set for this, but when a patch set has
multiple patches and the changelog covers all the patches, the
changelog is expected to be in a cover letter separated from the
patches themselves.

For this patch:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> +ifeq ($(BR2_PACKAGE_TI_GFX),y)
> +POWERVR_DEPENDENCIES += ti-gfx
> +endif

Technically, this part should have been in the next patch, because when
only 1/3 is applied, the ti-gfx package isn't there yet. But ok, we
don't care too much.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
