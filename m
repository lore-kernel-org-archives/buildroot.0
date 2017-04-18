From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Tue, 18 Apr 2017 16:24:08 +0000
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.10.8 in vdk
 defconfig
In-Reply-To: <019deebb-fe10-91e9-19c6-ad59edb7a895@mind.be>
References: <1491495579-26960-1-git-send-email-vzakhar@synopsys.com>
 <019deebb-fe10-91e9-19c6-ad59edb7a895@mind.be>
Message-ID: <1492532646.18176.3.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,


On Tue, 2017-04-18 at 13:04 +0200, Arnout Vandecappelle wrote:
> 
> On 06-04-17 18:19, Vlad Zakharov wrote:
> > 
> > With this commit we update snps_archs38_vdk_defconfig with the
> > following:
> > ? - bump linux kernel version to 4.10.8
> > ? - set up host linux headers to 4.10
> 
> ?This fails to build because the vdk patches in
> board/synopsys/vdk/patches/linux no longer apply to the 4.10 kernel. Have you
> even tested this?
> 
> ?See also https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_buildroot.org_buildroot_builds_14419270&d=Dw
> IC-
> g&c=DPL6_X_6JkXFx7AXWqB0tg&r=TGSQU5OmhW2MMpwoOAMzisELo4MA911p_P_3e_q7vKU&m=PazJSGNZnE8cjzzr2QxFybVp2hIQndnr3F3jSYsBi-
> Y&s=5vY0OAd_XO-dDxuWgnT39_j_e4xghg2S4h4a7XXyutk&e=?
> 
> ?Regards,
> ?Arnout


Thank you for pointing out these issues.
I've sent patches that fixes this brown paper bag bugs.

-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>

> 
> > 
> > 
> > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> > ---
> > ?configs/snps_archs38_vdk_defconfig | 6 +++---
> > ?1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
> > index 7cbd68c..2cca0b8 100644
> > --- a/configs/snps_archs38_vdk_defconfig
> > +++ b/configs/snps_archs38_vdk_defconfig
> > @@ -8,13 +8,13 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
> > ?BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
> > ?BR2_TARGET_ROOTFS_EXT2=y
> > ?
> > -# Linux headers same as kernel, a 4.9 series
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> > +# Linux headers same as kernel, a 4.10 series
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
> > ?
> > ?# Kernel
> > ?BR2_LINUX_KERNEL=y
> > ?BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.8"
> > ?BR2_LINUX_KERNEL_PATCH="board/synopsys/vdk/patches/linux"
> > ?BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
> > ?BR2_LINUX_KERNEL_VMLINUX=y
> > 
> 
