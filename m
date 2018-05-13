From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 13 May 2018 10:07:26 -0700
Subject: [Buildroot] [PATCH] package/xen: force location of init scripts
In-Reply-To: <20180513165923.31057-1-yann.morin.1998@free.fr>
References: <20180513165923.31057-1-yann.morin.1998@free.fr>
Message-ID: <CAKmqyKOeG4F=tUW3RF+e+gUS-Mxt7xLPrKsidPvEucftd4PTpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 13, 2018 at 9:59 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> The Xen configure scripts looks at the build host to decide where to
> install the Sys-V startup scripts, and that location differs between
> various distros.
>
> Force the location.
>
> Fixes:
>     http://autobuild.buildroot.org/results/869/869829ab086e824d164c5c5ec7f087ed83993be6/
>     http://autobuild.buildroot.org/results/336/3360e5a9e3d007b4ed77345b5fe93b2dacb6ad49/
>     http://autobuild.buildroot.org/results/29e/29e308ce3cc9c83497ba1c1f98fcda3f48fd03c4/
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Alistair Francis <alistair@alistair23.me>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
>  package/xen/xen.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 8ba2b9d5c2..1b741a90f6 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -17,7 +17,9 @@ else ifeq ($(ARCH),arm)
>  XEN_ARCH = arm32
>  endif
>
> -XEN_CONF_OPTS = --disable-ocamltools
> +XEN_CONF_OPTS = \
> +       --disable-ocamltools \
> +       --with-initddir=/etc/init.d
>
>  XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python2
>  XEN_MAKE_ENV = \
> --
> 2.14.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
