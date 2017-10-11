From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Oct 2017 18:26:54 +0200
Subject: [Buildroot] [PATCH 1/9] iMX6S-PICO: add default config file
 (imx6spico_defconfig)
In-Reply-To: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
References: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
Message-ID: <e4a6b726-545e-674c-c8fa-a89c25e9465c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-10-17 14:19, Alexandre Gambier wrote:
[snip]
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/TechNexion/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ecb66a3d34667fb4402457bbd6a4864e73b0fe87"

 You can also use the github helper to download a tarball:

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,TechNexion,linux,ecb66a3d34667fb4402457bbd6a4864e73b0fe87)"

*Much* faster than a git download.

 Same for U-Boot of course.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technexion/imx6spico/linux/linux-tn-imx-4.1.15/defconfig"

 Since you use a custom kernel, can't you use an in-tree defconfig? If you need
to tweak an in-tree defconfig a little, you can use
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
