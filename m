From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 22:56:11 +0100
Subject: [Buildroot] [PATCH v6 06/28] package/qwt: Add missing qt5svg
 dependency
In-Reply-To: <20200217212350.29750-7-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-7-anaumann@ultratronik.de>
Message-ID: <20200217225611.571c3eec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:28 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/qwt/qwt.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index 1fec17b19a..50df7e2642 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -19,6 +19,7 @@ QWT_CONFIG += -e 's%/features%/mkspecs/features%'
>  
>  ifeq ($(BR2_PACKAGE_QWT_SVG),y)
>  QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
> +QWT_DEPENDENCIES += qt5svg
>  else
>  QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
>  endif

This looks like a fix we should apply today. Why doesn't this trigger
any autobuilder failure?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
