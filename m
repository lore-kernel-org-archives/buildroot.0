From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 6 Jan 2013 23:15:54 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-firmware: New package
In-Reply-To: <87623ac661.fsf@dell.be.48ers.dk>
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <5460810c1bece1a398cf9a97e7ee521d75cf05f2.1357505417.git.maxime.hadjinlian@gmail.com>
 <87623ac661.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivwP4kpURtrG41pCpsZTS8t4vE_Fe37LkYSKQHJjMhw4RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 6, 2013 at 11:12 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>  Maxime> Introducing a package to install pre-built binaries for the bootloader and the
>  Maxime> GPU firmware for the RaspberryPi board.
>
>  Maxime> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>  Maxime> ---
>  Maxime>  package/Config.in                    |    1 +
>  Maxime>  package/rpi-firmware/Config.in       |    9 +++++++++
>  Maxime>  package/rpi-firmware/config.txt      |   13 +++++++++++++
>  Maxime>  package/rpi-firmware/rpi-firmware.mk |   21 +++++++++++++++++++++
>  Maxime>  4 files changed, 44 insertions(+)
>  Maxime>  create mode 100644 package/rpi-firmware/Config.in
>  Maxime>  create mode 100644 package/rpi-firmware/config.txt
>  Maxime>  create mode 100644 package/rpi-firmware/rpi-firmware.mk
>
>  Maxime> diff --git a/package/Config.in b/package/Config.in
>  Maxime> index 17205fe..30c39ac 100644
>  Maxime> --- a/package/Config.in
>  Maxime> +++ b/package/Config.in
>  Maxime> @@ -202,6 +202,7 @@ menu "Hardware handling"
>  Maxime>  menu "Misc devices firmwares"
>  Maxime>  source "package/b43-firmware/Config.in"
>  Maxime>  source "package/linux-firmware/Config.in"
>  Maxime> +source "package/rpi-firmware/Config.in"
>  Maxime>  source "package/ux500-firmware/Config.in"
>  Maxime>  source "package/zd1211-firmware/Config.in"
>  Maxime>  endmenu
>  Maxime> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
>  Maxime> new file mode 100644
>  Maxime> index 0000000..5723dea
>  Maxime> --- /dev/null
>  Maxime> +++ b/package/rpi-firmware/Config.in
>  Maxime> @@ -0,0 +1,9 @@
>  Maxime> +config BR2_PACKAGE_RPI_FIRMWARE
>  Maxime> +      bool "RaspberryPi Firmware"
>
> Same as for userland, I've renamed this to 'rpi-firmware'
>
>  Maxime> +++ b/package/rpi-firmware/config.txt
>  Maxime> @@ -0,0 +1,13 @@
>  Maxime> +# Please note that this is only a sample, we recommend you to change it to fit
>  Maxime> +# your needs.
>  Maxime> +# You should override this file using a post-build script.
>  Maxime> +# See http://buildroot.uclibc.org/downloads/manual/manual.html#rootfs-custom
>
> Trailing spaces. I've changed it to buildroot.org to have a bit shorter
> URL and added a comment explaining that the config.txt format is
> described at http://elinux.org/RPiconfig
>
> Committed with those changes, thanks.
>
> It would be good to see a rpi_defconfig as well.
Yes, I'll send one tomorrow.
>
> --
> Bye, Peter Korsgaard
