From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Feb 2017 18:26:52 +0100
Subject: [Buildroot] [PATCH] kmscube: Add new package
In-Reply-To: <1487001271-5503-1-git-send-email-festevam@gmail.com>
References: <1487001271-5503-1-git-send-email-festevam@gmail.com>
Message-ID: <CAAMH-yvUXusU-TRdQy631L=JZR2H5DRtonLQTNW+bsBd-DFVUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Mon, Feb 13, 2017 at 4:54 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Add support for kmscube application, which is helpful for testing
> kms/drm drivers.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/kmscube/Config.in    |  5 +++++
>  package/kmscube/kmscube.hash |  2 ++
>  package/kmscube/kmscube.mk   | 14 ++++++++++++++
>  4 files changed, 22 insertions(+)
>  create mode 100644 package/kmscube/Config.in
>  create mode 100644 package/kmscube/kmscube.hash
>  create mode 100644 package/kmscube/kmscube.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index deff0fe..af52e1a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -239,6 +239,7 @@ comment "Graphic applications"
>         source "package/glmark2/Config.in"
>         source "package/gnuplot/Config.in"
>         source "package/jhead/Config.in"
> +       source "package/kmscube/Config.in"
>         source "package/mesa3d-demos/Config.in"
>         source "package/qt5cinex/Config.in"
>         source "package/rrdtool/Config.in"
> diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
> new file mode 100644
> index 0000000..b3c3c8d
> --- /dev/null
> +++ b/package/kmscube/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_KMSCUBE
> +       bool "kmscube"
> +       depends on BR2_PACKAGE_MESA3D && BR2_PACKAGE_LIBDRM
> +       help
> +         kmscube is an application to test kms/drm drivers.
> diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
> new file mode 100644
> index 0000000..a66eb5b
> --- /dev/null
> +++ b/package/kmscube/kmscube.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 d2f8e2601a2a5c3d07902019a8f39f61ddfea90fbb265720151c00a65798d3be kmscube-be60c2f26fbc79038b246dc9a3b8b5fa2fa1fe54.tar.gz
> diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
> new file mode 100644
> index 0000000..bb079f5
> --- /dev/null
> +++ b/package/kmscube/kmscube.mk
> @@ -0,0 +1,14 @@
> +KMSCUBE_VERSION = be60c2f26fbc79038b246dc9a3b8b5fa2fa1fe54
> +KMSCUBE_SITE = $(call github,austriancoder,kmscube,$(KMSCUBE_VERSION))

I believe Rob Clark's version is more up to date and has more traction:
https://github.com/robclark/kmscube

It has RPi VC4 support and someone asked for i.MX support as well:
https://github.com/robclark/kmscube/pull/7

Hopefully this latter will get merged soon.

Regards,
Gary
