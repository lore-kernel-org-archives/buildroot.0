From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 15 May 2020 06:41:13 -0500
Subject: [Buildroot] [PATCH 3/3 v2] package/lmod: add compression
 support for the host variant
In-Reply-To: <d66d07fe82ae1c515eb9a010f1df2cbcc10f1a87.1588511382.git.yann.morin.1998@free.fr>
References: <cover.1588511382.git.yann.morin.1998@free.fr>
 <d66d07fe82ae1c515eb9a010f1df2cbcc10f1a87.1588511382.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpYbG=+Z6EGVSK0PuUoZ5iQ1PUZf1kvVx7G5FNNxbANAbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, May 3, 2020 at 8:14 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> The kernel may install compressed modules. At the end of the buid, we
buid -> build
> then run depmod, to generate modules.dep and a few assorted files, so
> that loadign modules works properly on the target (loading by alias,
loading -> loading

> loading dependencies...)
>
> However, depmod needs support for compressed modules, or it would
> generate empty modules.dep et al.
>
> Systematically adding support for gz and xz, and the required deps, was
> deemed too much of a burden [0], so we add too options to enable either
> or both compression.
>
> [0] http://lists.busybox.net/pipermail/buildroot/2018-April/218410.html
>
> Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Lucian Buga <lucianbuga@gmail.com>
>
> ---
> Changes v1 -> v2:
>   - make compression support optional  (Thomas)
> ---
>  package/kmod/Config.in.host | 10 ++++++++++
>  package/kmod/kmod.mk        | 14 ++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/package/kmod/Config.in.host b/package/kmod/Config.in.host
> index ea99a790f6..810fac3156 100644
> --- a/package/kmod/Config.in.host
> +++ b/package/kmod/Config.in.host
> @@ -4,3 +4,13 @@ config BR2_PACKAGE_HOST_KMOD
>           kmod is a set of tools to handle common tasks with Linux
>           kernel modules like insert, remove, list, check properties,
>           resolve dependencies and aliases.
> +
> +if BR2_PACKAGE_HOST_KMOD
> +
> +config BR2_PACKAGE_HOST_KMOD_GZ
> +       bool "support gzip-compresed modules"

gzip-compresed ->  gzip-compressed

> +
> +config BR2_PACKAGE_HOST_KMOD_XZ
> +       bool "support xz-compresed modules"

xz-compresed -> xz-compressed

-Matt
