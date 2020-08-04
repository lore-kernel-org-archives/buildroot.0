From: Alexander Dahl <post@lespocky.de>
Date: Tue, 4 Aug 2020 10:38:12 +0200
Subject: [Buildroot] [PATCH v2] boot/at91bootstrap3: add dependency to
 host python3
In-Reply-To: <20200804082906.118090-1-eugen.hristev@microchip.com>
References: <20200804082906.118090-1-eugen.hristev@microchip.com>
Message-ID: <20200804083811.hutiunw3gu5ryz7x@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Aug 04, 2020 at 11:29:06AM +0300, Eugen Hristev wrote:
> Starting with version 3.9.3, AT91Bootstrap adds dependency for host
> python3.
> Python2 was deprecated so moving to Python3.
> AT91Bootstrap only requires Python3 at build time, for some scripts that
> generate specific metadata.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v2:
> - fix typo s/boot/build

Acked-by: Alexander Dahl <post@lespocky.de>

Greets
Alex

> 
>  boot/at91bootstrap3/at91bootstrap3.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index 5cf865c681..a601f35a4b 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -6,6 +6,8 @@
>  
>  AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
>  
> +AT91BOOTSTRAP3_DEPENDENCIES += host-python3
> +
>  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)
>  AT91BOOTSTRAP3_TARBALL = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION))
>  AT91BOOTSTRAP3_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP3_TARBALL)))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200804/1e5d4d37/attachment.asc>
