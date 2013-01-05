From: Alex Bradbury <asb@asbradbury.org>
Date: Sat, 5 Jan 2013 15:41:52 +0000
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <0e55a309b9f4a9b8ee175d301d40e7574e9227b0.1357394983.git.maxime.hadjinlian@gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0e55a309b9f4a9b8ee175d301d40e7574e9227b0.1357394983.git.maxime.hadjinlian@gmail.com>
Message-ID: <CA+wH297Tm9-wx0ezB8Jvfc5ChCbDi2ivpfXLg6QbC0cP5H8cVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 January 2013 14:10, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:
> Introducing a package to build the userland part of the Raspberry,
> needed by anyone who would want to build a rootfs for a RaspberryPi.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/Config.in                    |    1 +
>  package/rpi-userland/Config.in       |   12 ++++++++++++
>  package/rpi-userland/rpi-userland.mk |   25 +++++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
>  create mode 100644 package/rpi-userland/Config.in
>  create mode 100644 package/rpi-userland/rpi-userland.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index a3530d7..604ed1b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -579,6 +579,7 @@ source "package/collectd/Config.in"
>  source "package/empty/Config.in"
>  source "package/googlefontdirectory/Config.in"
>  source "package/mobile-broadband-provider-info/Config.in"
> +source "package/rpi-userland/Config.in"
>  source "package/shared-mime-info/Config.in"
>  source "package/snowball-init/Config.in"
>  source "package/sound-theme-borealis/Config.in"
> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
> new file mode 100644
> index 0000000..3d4585f
> --- /dev/null
> +++ b/package/rpi-userland/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_RPI_USERLAND
> +       bool "rpi-userland"
> +       select BR2_PACKAGE_LIBCOFI

Libcofi is not required, and honestly using it via LD_PRELOAD is too
ugly to pull in to buildroot I would think. It would be better
integrated as a glibc patch, which is how it should eventually be
included in Raspbian.

> +#
> +#############################################################
> +RPI_USERLAND_VERSION = 9852ce28826889e50c4d6786b942f51bccccac54
> +RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
> +RPI_USERLAND_LICENSE = FOSS
> +RPI_USERLAND_LICENSE_FILE = LICENCE

The license is standard 3-clause BSD.

Alex
