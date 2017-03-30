From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 31 Mar 2017 00:51:08 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
	BR2_GENIMAGE_CFG_FILES
In-Reply-To: <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
Message-ID: <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-03-17 16:51, Etienne Phelip wrote:
> diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
> index 0ec210f..23bb8b9 100644
> --- a/configs/acmesystems_aria_g25_128mb_defconfig
> +++ b/configs/acmesystems_aria_g25_128mb_defconfig
> @@ -8,7 +8,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/aria-g25/post-image.sh"
>  
>  # Kernel configuration
>  BR2_LINUX_KERNEL=y
> @@ -34,3 +33,4 @@ BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_GENIMAGE_CFG_FILES="board/acmesystems/aria-g25/genimage.cfg"

 I'm still not entirely sure if this new option is worthwhile. Without it, you
would instead need

BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="board/acmesystems/aria-g25/genimage.cfg"

Not really complicated either... The only real advantage I see is that it
motivates people more to use genimage (which is otherwise a bit hidden). But for
that, a paragraph or two in docs/manual/customize-post-image.txt would also
work. By the way, even for this series an explanation of the option would be
required in that file.

 What do the others think?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
