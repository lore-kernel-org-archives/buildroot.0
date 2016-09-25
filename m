From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:30:29 +0200
Subject: [Buildroot] [PATCH] u-boot: Fix building for ARC700
In-Reply-To: <1474632473-30670-1-git-send-email-abrodkin@synopsys.com>
References: <1474632473-30670-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20160925233029.699292db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 15:07:53 +0300, Alexey Brodkin wrote:
> With newer ARC toolchain obsolete -marcXXX were finally deperecated
> and so compiler throws errors now about unknown option.
> 
> Solution is as simple as switching to more generic -mcu-XXX
> options. Which we do. Unfortunately that change in upstream U-Boot [1]
> happened right after v2016.09 was released an so we need to have that fix
> for v2016.07 which is mentioned in axs10x defconfigs and for the latest
> U-Boot release v2016.09 (which is selected by default if no defconfig is
> used).
> 
> Once we deprecate either U-Boot version in U-Boot corresponding patch
> should be removed essentially.
> 
> [1] http://git.denx.de/?p=u-boot.git;a=commit;h=7c8d81605302e7d7fdd3e7d8eb69302bddc64a2c
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch | 39 ++++++++++++++++++++++
>  ...-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch | 39 ++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 boot/uboot/2016.07/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
>  create mode 100644 boot/uboot/2016.09/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch

Applied to master. I've fixed the patch so that it works fine after the
U-Boot bump to 2016.09.01.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
