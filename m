From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 29 Nov 2017 09:45:14 +0300
Subject: [Buildroot] [PATCH v5 1/3] board: Add Vyasa RK3288 board support
In-Reply-To: <1511893761-8292-1-git-send-email-jagan@amarulasolutions.com>
References: <1511893761-8292-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171129064514.mc4iobd4roajjdtj@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


> Add Vyasa board, from rk3288 family SOC.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v5:
> - Add host-uboot-tools
> - Fix commit message
> - Drop Qt5 configs
> Changes for v4:
> - Use liux-next
> - Add linux_gmac.fragment, rockchip gmac as module
> - Add evetest command
> - enable BR2_LINUX_KERNEL_INSTALL_TARGET
> Changes for v3:
> - Fix ascending order in DEVELOPERS
> - Fix u-boot-dtb.img offset
> - Fix extlinux.conf label
> Changes for v2:
> - Bump to U-Boot v2017.11
> - Bump to linux-next

...

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="87f89ace81d0978a1049a92c6a9921de5aa0a9e3"

As Thomas mentioned in his review for v4, no way to use linux-next git tree.
It is being rebased all the time. So changing commit ID is not going to help:
it will be changed over and over again.

If you want to add this board to Buildroot before it shows up in mainline, why
don't you use latest stable kernel release and add several patches into the
board directory? You may take a look at nanopi-m1-plus which adds its full
dts as a patch.

Regards,
Sergey
