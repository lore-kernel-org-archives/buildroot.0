From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 8 Oct 2014 21:45:33 +0200
Subject: [Buildroot] [PATCH 1/7 v2] pacakge/freerdp: disable building
	the manpages
In-Reply-To: <254a7536ac9a2da6b3b7d2ce7242bbcdcbcd5420.1412634775.git.yann.morin.1998@free.fr>
References: <cover.1412634775.git.yann.morin.1998@free.fr>
 <254a7536ac9a2da6b3b7d2ce7242bbcdcbcd5420.1412634775.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMLqFTdheLXjirwP5v0R7PWAm7CXYnaHYEpKYG-a1eydQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 7, 2014 at 12:35 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Building the manpages requires xsltproc, which might not be available.
> Also, who needs the manpages on the target anyway? ;-)
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Samuel Martin <s.martin49@gmail.com>

> ---
>  package/freerdp/freerdp.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 84c2d81..e272165 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -12,6 +12,8 @@ FREERDP_DEPENDENCIES = openssl zlib \
>  FREERDP_LICENSE = Apache-2.0
>  FREERDP_LICENSE_FILES = LICENSE
>
> +FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
> +
>  ifeq ($(BR2_PACKAGE_CUPS),y)
>  FREERDP_CONF_OPTS += -DWITH_CUPS=ON
>  FREERDP_DEPENDENCIES += cups
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Samuel
