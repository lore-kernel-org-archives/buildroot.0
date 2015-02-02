From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 2 Feb 2015 20:59:56 +0100
Subject: [Buildroot] [PATCH v2 2/2] luacrypto: remove duplicate
 dependency on luainterpreter
In-Reply-To: <1422891336-14461-2-git-send-email-patrickdepinguin@gmail.com>
References: <1422891336-14461-1-git-send-email-patrickdepinguin@gmail.com>
 <1422891336-14461-2-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAB0FRsu-CSKGUWtKPjAqVDp7aZVi2W0y1O-Rs5v3a75X-cyC2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-02-02 16:35 GMT+01:00 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> The luarocks package infrastructure already adds a dependency on
> luainterpreter, so it is not necessary to add it in luacrypto.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>

> ---
>  package/luacrypto/luacrypto.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
> index 42e20af..b0e972c 100644
> --- a/package/luacrypto/luacrypto.mk
> +++ b/package/luacrypto/luacrypto.mk
> @@ -9,6 +9,6 @@ LUACRYPTO_VERSION = $(LUACRYPTO_VERSION_UPSTREAM)-1
>  LUACRYPTO_SUBDIR = luacrypto-$(LUACRYPTO_VERSION_UPSTREAM)
>  LUACRYPTO_LICENSE = MIT
>  LUACRYPTO_LICENSE_FILES = $(LUACRYPTO_SUBDIR)/COPYING
> -LUACRYPTO_DEPENDENCIES = luainterpreter openssl
> +LUACRYPTO_DEPENDENCIES = openssl
>
>  $(eval $(luarocks-package))
> --
> 1.8.5.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
