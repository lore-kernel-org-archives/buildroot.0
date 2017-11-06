From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 Nov 2017 12:02:53 -0600
Subject: [Buildroot] [PATCH] orange-pi-one: bump kernel and uboot
 versions
In-Reply-To: <20171106092602.24565-1-geomatsi@gmail.com>
References: <20171106092602.24565-1-geomatsi@gmail.com>
Message-ID: <CANQCQpaFx=wEYOo3mzRLzfbEwxdSLN-rHkdjiaRkXwO+6Gp33w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey,

On Mon, Nov 6, 2017 at 3:26 AM, Sergey Matyukevich <geomatsi@gmail.com> wrote:
> Bump kernel to 4.13.11 and U-Boot to 2017.09.
>

<snip>

> @@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.03"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"

This bump requires BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y .  You can't see
the failure if your host machine has swig.

Similar to what was observed with uboot-tools:
https://git.busybox.net/buildroot/commit/?id=0bcd09ffcabbcce74ed00bc38620f71a34a59b45

Matt
