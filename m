From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:56:32 +0200
Subject: [Buildroot] [PATCH v3] boot/uboot: Call 'make all'
 unconditionally
In-Reply-To: <1475865034-28332-1-git-send-email-fabio.estevam@nxp.com>
References: <1475865034-28332-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20161007225632.0874df73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Oct 2016 15:30:34 -0300, Fabio Estevam wrote:
> Since commit fad58cefa4a392b ("boot/uboot: allow to build multiple U-Boot
> images") the installation of SPL binary fails.
> 
> For example, when building the mx6cubox_defconfig target we see:
> 
>   LD      u-boot
>   OBJCOPY u-boot-nodtb.bin
>   COPY    u-boot.bin
>   MKIMAGE u-boot.img
> >>> uboot 2016.09.01 Installing to target
> >>> uboot 2016.09.01 Installing to images directory  
> cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.bin /home/fabio/buildroot/output/images/
> cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.img /home/fabio/buildroot/output/images/
> cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/SPL /home/fabio/buildroot/output/images/
> cp: cannot stat '/home/fabio/buildroot/output/build/uboot-2016.09.01/SPL': No such file or directory
> 
> Instead of calling 'make all' only for the BR2_TARGET_UBOOT_FORMAT_DTB_IMG
> case, call 'make all' unconditionally so that the SPL target can also
> be installed.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v2:
> - Call 'make all' unconditionally
>  
>  boot/uboot/uboot.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
