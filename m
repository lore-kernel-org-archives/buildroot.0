From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 12:59:01 +0200
Subject: [Buildroot] [PATCH] config: update linux version in zebu
 defconfig
In-Reply-To: <1491928333-30537-1-git-send-email-vzakhar@synopsys.com>
References: <1491928333-30537-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <cb3c3c49-d89f-f7d0-4ba4-ddbb7209764a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-04-17 18:32, Vlad Zakharov wrote:
> With this commit we update snps_archs38_zebu_defconfig the following:
> 
>   - bump linux kernel version to 4.10.9
>   - set up host linux headers to 4.10

 This causes the build to fail because zebu_hs_smp has been renamed to
haps_hs_smp in upstream commit 4988cc5. Have you tested this at all?

 See also https://gitlab.com/buildroot.org/buildroot/builds/14419271

 Regards,
 Arnout

> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  configs/snps_archs38_zebu_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/snps_archs38_zebu_defconfig b/configs/snps_archs38_zebu_defconfig
> index 96d941a..98beb2b 100644
> --- a/configs/snps_archs38_zebu_defconfig
> +++ b/configs/snps_archs38_zebu_defconfig
> @@ -7,12 +7,12 @@ BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
>  BR2_TARGET_ROOTFS_INITRAMFS=y
>  
> -# Linux headers same as kernel, a 4.9 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +# Linux headers same as kernel, a 4.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="zebu_hs_smp"
>  BR2_LINUX_KERNEL_VMLINUX=y
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
