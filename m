From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Feb 2018 09:13:52 +0100
Subject: [Buildroot] [PATCH v9 1/3] board: Add Vyasa RK3288 board support
In-Reply-To: <1517313835-21973-1-git-send-email-jagan@amarulasolutions.com>
 (Jagan Teki's message of "Tue, 30 Jan 2018 13:03:53 +0100")
References: <1517313835-21973-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <87tvuutu0v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jagan" == Jagan Teki <jagannadh.teki@gmail.com> writes:

 > Add Vyasa board, from rk3288 family SOC.
 > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

 > +++ b/board/amarula/vyasa/linux_gmac.fragment
 > @@ -0,0 +1,3 @@
 > +# Currently kernel mainline exhibits issues when running rockchip gmac
 > +# on the board, so enable it as loadable module and insert it later
 > +CONFIG_DWMAC_ROCKCHIP=m

Here you talk about mainline, but:

 > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/openedev/linux-openedev"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d127129e85a020879f334154300ddd3f7ec21c1e"
 > +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 > +BR2_LINUX_KERNEL_UIMAGE=y
 > +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-vyasa"
 > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
 > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/amarula/vyasa/linux_gmac.fragment"

It isn't using mainline.

But OK - Committed to next, thanks.

-- 
Bye, Peter Korsgaard
