From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 May 2020 19:29:43 -0500
Subject: [Buildroot] [PATCH 1/3 v2] package/kmod: explicitly disable
 compression when not enabled
In-Reply-To: <7067f36377f52c1a5022a9988be2ee7e70ce48ac.1588511382.git.yann.morin.1998@free.fr>
References: <cover.1588511382.git.yann.morin.1998@free.fr>
 <7067f36377f52c1a5022a9988be2ee7e70ce48ac.1588511382.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpZ-qfOouxTcO3YB+_Y_tKoRE4c1DWbv7+C1Sgcx2SGcTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, May 3, 2020 at 8:12 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Tested support for a compressed and signed modules (found [1] was
needed to allow modinfo to display signed module details)

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_XZ=y
BR2_PACKAGE_LIBZIP=y
BR2_PACKAGE_OPENSSL=y      # modinfo requires so it can display signature info
BR2_PACKAGE_KMOD=y
BR2_PACKAGE_KMOD_TOOLS=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_KMOD_GZ=y
BR2_PACKAGE_HOST_KMOD_XZ=y

Linux Kernel options enabled
       CONFIG_MODULES=y
       CONFIG_MODULE_UNLOAD=y
       CONFIG_MODVERSIONS=y
       CONFIG_MODULE_SRCVERSION_ALL=y
       CONFIG_MODULE_SIG=y
       CONFIG_MODULE_SIG_FORCE=y
       CONFIG_MODULE_SIG_SHA256=y
       CONFIG_MODULE_COMPRESS=y
       CONFIG_MODULE_COMPRESS_XZ=y

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20200514182806.56592-1-matthew.weber at rockwellcollins.com/
