From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 1 Apr 2019 00:19:58 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: host and target
 legal-info are different
In-Reply-To: <20190331214035.14080-1-yann.morin.1998@free.fr>
References: <20190331214035.14080-1-yann.morin.1998@free.fr>
Message-ID: <13f5e440-d98b-ff48-c56a-a5efea24b8c6@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 31/03/2019 23:40, Yann E. MORIN ha scritto:
> For the target, we only ever use the gettext-tiny dorce, while for the
> host we also use that of gettext-gnu.
> 
> Fixes:
>      http://autobuild.buildroot.org/results/572/5724b246cf411d95702fcff6dbf2b809b899108c/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Giulio Benetti" <giulio.benetti@micronovasrl.com>

> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   package/gettext-tiny/gettext-tiny.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
> index c9052d0d7c..881edc6f35 100644
> --- a/package/gettext-tiny/gettext-tiny.mk
> +++ b/package/gettext-tiny/gettext-tiny.mk
> @@ -8,7 +8,8 @@ GETTEXT_TINY_VERSION = v0.3.1
>   GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
>   GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
>   GETTEXT_TINY_INSTALL_STAGING = YES
> -GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
> +GETTEXT_TINY_LICENSE_FILES = LICENSE
> +HOST_GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
>   
>   GETTEXT_TINY_PROVIDES = gettext
>   
> 

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
