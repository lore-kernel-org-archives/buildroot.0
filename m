From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 15:04:32 +0200
Subject: [Buildroot] [PATCH] uboot-tools: add missing !BR2_STATIC_LIBS
 dependency for FIT signature
In-Reply-To: <1470867125-2537-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470867125-2537-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160811150432.17922405@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Aug 2016 00:12:05 +0200, Thomas Petazzoni wrote:
> BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT selects BR2_PACKAGE_DTC, but forgets
> to depends on !BR2_STATIC_LIBS like BR2_PACKAGE_DTC does.
> 
> Fixes the following kconfig warning:
> 
>   arning: (BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT && BR2_PACKAGE_KVMTOOL && BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) selects BR2_PACKAGE_DTC which has unmet direct dependencies (!BR2_STATIC_LIBS)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/uboot-tools/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
