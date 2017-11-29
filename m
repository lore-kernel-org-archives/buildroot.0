From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 29 Nov 2017 09:59:50 +0300
Subject: [Buildroot] [PATCH v5 1/3] board: Add Vyasa RK3288 board support
In-Reply-To: <CAMty3ZCb0upojszgdTBXtMHSG++z4bJDXvFvNFVzBorChNSoKQ@mail.gmail.com>
References: <1511893761-8292-1-git-send-email-jagan@amarulasolutions.com>
 <20171129064514.mc4iobd4roajjdtj@speedy.hunter>
 <CAMty3ZCb0upojszgdTBXtMHSG++z4bJDXvFvNFVzBorChNSoKQ@mail.gmail.com>
Message-ID: <20171129065950.hdmba5xdjloovtdb@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >> Add Vyasa board, from rk3288 family SOC.
> >>
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> ---
> >> Changes for v5:
> >> - Add host-uboot-tools
> >> - Fix commit message
> >> - Drop Qt5 configs
> >> Changes for v4:
> >> - Use liux-next
> >> - Add linux_gmac.fragment, rockchip gmac as module
> >> - Add evetest command
> >> - enable BR2_LINUX_KERNEL_INSTALL_TARGET
> >> Changes for v3:
> >> - Fix ascending order in DEVELOPERS
> >> - Fix u-boot-dtb.img offset
> >> - Fix extlinux.conf label
> >> Changes for v2:
> >> - Bump to U-Boot v2017.11
> >> - Bump to linux-next
> >
> > ...
> >
> >> +# Kernel
> >> +BR2_LINUX_KERNEL=y
> >> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> >> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
> >> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="87f89ace81d0978a1049a92c6a9921de5aa0a9e3"
> >
> > As Thomas mentioned in his review for v4, no way to use linux-next git tree.
> > It is being rebased all the time. So changing commit ID is not going to help:
> > it will be changed over and over again.
> 
> Thomas never said to use the linux-next, but instead he mentioned to
> not use the last sha1 which always changed during rebase. So the sha1
> I have used here specific to this board which shouldn't change even
> linux-next rebased.

Yeah, the main point was _not_ to use linux-next at all.
I suggest you to check the review comments for v4 once again.

Regards,
Sergey
