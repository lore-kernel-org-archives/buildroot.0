From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 31 Dec 2016 12:55:43 -0200
Subject: [Buildroot] Module autoloading based on info from device tree
In-Reply-To: <CAPyvrJc8zPehaFLBxf9jZ9KKmHDuERbouQQ8VG8KQAMZqoBswg@mail.gmail.com>
References: <CAPyvrJc8zPehaFLBxf9jZ9KKmHDuERbouQQ8VG8KQAMZqoBswg@mail.gmail.com>
Message-ID: <CAOMZO5CFdm6Ez6W6vw7rf85iDZXuHNeH=Fs0LkKvj=HT5VLKWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 30, 2016 at 12:33 PM, Artem Synytsyn <a.synytsyn@gmail.com> wrote:
> Hello everyone! What is going on with autoloading modules for platform
> devices from device tree? I've build image for raspberry pi, added device
> tree overlay for enc28j60. I've checked: device tree node with this device
> exists in /proc/device-tree/soc/spi at 7e204000. But lsmod does not shows that
> enc28j60.ko is not loaded. In contrast of, raspbian distro successfully
> managed with this - module loaded successfully.
> Also, I've read this thread:
> http://lists.busybox.net/pipermail/buildroot/2016-December/178779.html. As I
> understand, command
>
> find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0
> modprobe -abq
>
> does not work...

kernel module autoloading is working for me if I select
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y in the defconfig.

Try to select this option and give it a try.

Regards,

Fabio Estevam
