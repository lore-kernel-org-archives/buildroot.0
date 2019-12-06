From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 22:19:18 +0100
Subject: [Buildroot] [PATCH 2/3] binutils/ARC: move ARC specific code
 together
In-Reply-To: <20191206193924.18777-3-vgupta@synopsys.com>
References: <20191206193924.18777-1-vgupta@synopsys.com>
 <20191206193924.18777-3-vgupta@synopsys.com>
Message-ID: <20191206221918.1c05e316@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 11:39:23 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> That way ARC specific version update needs to be done in 1 place only
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  package/binutils/binutils.mk | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index a19d6940f7c1..ecc78b81e59f 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -8,14 +8,11 @@
>  # If not, we do like other packages
>  BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
>  ifeq ($(BINUTILS_VERSION),)
> -ifeq ($(BR2_arc),y)
> -BINUTILS_VERSION = arc-2019.09-rc1
> -else
>  BINUTILS_VERSION = 2.32
>  endif
> -endif # BINUTILS_VERSION
>  
> -ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
> +ifeq ($(BR2_arc),y)

This is not going to work well with your PATCH 3/3 (on which I have
comments). Indeed, BR2_arc=y does not necessarily imply that we want to
use the ARC-specific binutils version.

You can however use ifeq ($(BR2_BINUTILS_VERSION_ARC),y) instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
