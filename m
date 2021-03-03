From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 3 Mar 2021 18:54:32 +0100
Subject: [Buildroot] [PATCH 2/2] package/sconeserver: pcre is optional,
 not mandatory
In-Reply-To: <20210303172019.931457-2-fontaine.fabrice@gmail.com>
References: <20210303172019.931457-1-fontaine.fabrice@gmail.com>
 <20210303172019.931457-2-fontaine.fabrice@gmail.com>
Message-ID: <20210303185432.5064244e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed,  3 Mar 2021 18:20:19 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pcre is optional not mandatory since
> https://github.com/sconemad/sconeserver/commit/98ec61436c9ea68ffe2d70a818c1175dcafa2a79
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sconeserver/sconeserver.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
> index b81134002e..62cc128d77 100644
> --- a/package/sconeserver/sconeserver.mk
> +++ b/package/sconeserver/sconeserver.mk
> @@ -10,7 +10,10 @@ SCONESERVER_LICENSE = GPL-2.0+
>  SCONESERVER_LICENSE_FILES = COPYING
>  # fetching from Git, we need to generate the configure script
>  SCONESERVER_AUTORECONF = YES
> -SCONESERVER_DEPENDENCIES = host-pkgconf pcre zlib
> +SCONESERVER_DEPENDENCIES = \
> +	host-pkgconf \
> +	$(if $(BR2_PACKAGE_PCRE),pcre) \

Remove of 'select BR2_PACKAGE_PCRE' from Config.in missing?

Regards,
Peter

> +	zlib
>  # disable markdown module because its git submodule cmark
>  # https://github.com/sconemad/sconeserver/tree/master/markdown
>  # has no cross-compile support provided by the sconeserver build system
