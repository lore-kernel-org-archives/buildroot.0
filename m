From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Apr 2019 10:33:43 +0200
Subject: [Buildroot] [PATCH 02/10] infra/pkg-download: make the URI list
 a callable macro
In-Reply-To: <63416c278b970c4be6abe15af836fa39d9de91f9.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <63416c278b970c4be6abe15af836fa39d9de91f9.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUN=yR-RzRb0LvFSzs50Okih5C=g0UjOkn56L1=58yH2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El dom., 7 abr. 2019 a las 13:51, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Currently, that variable is context-dependent, as it expects the PKG
> variable to exist and be defined to the current package.
>
> This is not so clean, so change the variable to a callable macro.
>
> Adapt the caller accordingly.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/pkg-download.mk | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index f9411213b6..611df5f982 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -71,11 +71,17 @@ export BR_NO_CHECK_HASH_FOR =
>  #
>  # Argument 1 is the source location
>  #
> +#
> +# DOWNLOAD_URIS - List the candidates URIs where to get the package from:
> +#
> +# Argument 1 is the source location
> +# Argument 2 is the upper-case package name
> +#
>  ################################################################################

Here I think it makes sense to split the comment. The part about
'DOWNLOAD' can move below to just above the 'DOWNLOAD' macro, and
DOWNLOAD_URIS remains here. The text listing the three types of
download locations could perhaps move to the DOWNLOAD_URIS part.
