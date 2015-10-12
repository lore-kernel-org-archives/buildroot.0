From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:59:35 +0200
Subject: [Buildroot] [PATCH 1/4] configs/raspberrypi: use EABIhf
In-Reply-To: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
References: <20150820143005.GA6441@ketchup.mtl.sfl>
 <1440273688-92868-1-git-send-email-benoit@wsystem.com>
Message-ID: <20151012235935.6a195741@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Sat, 22 Aug 2015 22:01:25 +0200, Beno?t Th?baudeau wrote:
> The SoC of the Raspberry Pi 1 is an ARM1176JZF-S, which features a VFPv2
> FPU, so use the EABIhf target ABI, which is more efficient than EABI.
> This is also the default on Raspbian.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> ---
>  configs/raspberrypi_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks. I actually believe we should be doing the same for all
ARMv6/ARMv7 platforms, except if there is a specific issue with using
EABIhf (such as existing pre-built binaries that are EABI only).

Maybe we should even use EABIhf by default on ARMv6+.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
