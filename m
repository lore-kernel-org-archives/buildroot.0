From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Apr 2019 23:43:50 +0200
Subject: [Buildroot] [git commit] package/gettext: turn into virtual
 package
In-Reply-To: <20190331121707.C1C2D86602@busybox.osuosl.org>
References: <20190331121707.C1C2D86602@busybox.osuosl.org>
Message-ID: <88c125ee-6c2b-9f99-87cb-b4b1ba075ec3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, All

Le 31/03/2019 ? 14:04, Thomas Petazzoni a ?crit?:
> commit: https://git.buildroot.net/buildroot/commit/?id=ea1e7ee6068265d3f8ade97a387d77c77335b38e
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Re-work gettext to be a virtual package which may allow to use
> different gettext's providers, and rename the original one into
> gettext-gnu package.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---

> +ifeq ($(BR2_PACKAGE_GETTEXT_GNU),y)
>  GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
> +endif

Why adding a if BR2_PACKAGE_GETTEXT_GNU here ?
We need to define GETTEXTIZE for gettextized packages (like host-flex).

Currently the build is broken with:

>>> host-flex 2.6.4 Gettextizing
cd [...]/build/host-flex-2.6.4/ &&
/bin/sh: -c: ligne 1: erreur de syntaxe : fin de fichier pr?matur?e
make[1]: *** [package/pkg-generic.mk:230:
[...]/build/host-flex-2.6.4/.stamp_configured] Error 1

Best regards,
Romain
