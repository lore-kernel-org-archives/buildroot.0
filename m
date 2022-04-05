Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CE4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 17:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D7A41523;
	Tue,  5 Apr 2022 17:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFVDI-sxZUws; Tue,  5 Apr 2022 17:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9ADC410D1;
	Tue,  5 Apr 2022 17:23:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDBB71BF2BE
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 17:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDC5F8125F
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 17:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rDiqx3yhPwaS for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 17:23:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB75280B68
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 17:23:29 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id k2so8504425edj.9
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=m6vr0E/GXI+g18tQJSCNLIqDMbzvJl8KpgVJHN4nof8=;
 b=KZWoF9q+agYFVn9F1G8aaNe20LLFveOL8p1IaT2WplOvMImIB7VYQNi+GFQb6QWSZw
 PsXaLd2zV1Klvv8nHbErTJb0S7YI3k2sGdV6JND1sarGoTFDr+xxZCuDbSUe/nfQ+lHZ
 FNfAumYj2yJcvy6oelzFK9sPN4naG5cAbouGuAOTrxsEqkkDwPHQPl5ena/YGww83Xrh
 XWmgaZuV8WxaSsO6bi12lIW6KKSBb4eVAEk9G0X0cXIJI5JLcUtLAjBYTLw7x9iVvKC/
 p+RYbbDbzECyP1fjt0JJ+FQbUFqNddQDNY2T+2cQr5XnLaZTAgV9501wryhiFdGMWmbs
 /kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m6vr0E/GXI+g18tQJSCNLIqDMbzvJl8KpgVJHN4nof8=;
 b=RvTdGm8CJYTZlzTdJ38jqp9mYaMMzORXGp1LJZqk19HGXXx6UwwSFl9aEvODOAgPNy
 kKSGIv2UE2vtga62vKedn3Ggmrww5aU5dydE2n6bw0ludDVpJe961Q6Wfjbah11kGgTd
 vOPy12JaE/dJGnNKq0A6xmpcf1Y57l/LO9Ucw+wL93y5Quofq3sdJA8D4f8yfuJRSVwS
 ALTS2+Ylq+/Um5POHecsV8ohbiItYuhQc3tyq59p+IT0/QNPb5Nd2GphNhSj9eyZjb0u
 EFSLhy6PedVgwqMOQNnaMwN19YZNiKqsnE5N9qJ+GElhQmS0NU3gnU8u4Ui/EXbVKN15
 gFXg==
X-Gm-Message-State: AOAM530AoGN8INJ2icBmejcJEMXbMJP/yKQ8Oy3y9XADVYQ1S1PEZ6Bz
 mfJU2ft0aVKN/pJ+QVhKj6fQrg==
X-Google-Smtp-Source: ABdhPJz8fotezk/9Jsxg2qto9sS8Yz29OkQj+78HEfVsjxJGaW4sCZ6siO3jWcb1X8LGqNXO0+tYfQ==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id
 i20-20020a05640242d400b004165caca9a0mr4837083edc.86.1649179407859; 
 Tue, 05 Apr 2022 10:23:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lb4-20020a170907784400b006e0d13f65e5sm5671400ejc.167.2022.04.05.10.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 10:23:27 -0700 (PDT)
Message-ID: <4a9f7aa1-82e4-664e-7177-71596cb021e7@mind.be>
Date: Tue, 5 Apr 2022 19:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220405115040.3779242-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405115040.3779242-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v4 1/1] utils/genrandconfig: add randconfig
 based --no-toolchains-csv option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 13:50, James Hilliard wrote:
> Currently we only test a limited set of toolchains that are mostly
> prebuilt, add a flag to allow using randconfig for randomizing
> additional toolchain settings instead of randpackageconfig.
> 
> To avoid invalid configs we need to add additional config validation
> filtering and fixups.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v3 -> v4:
>    - use fixup_config instead of other retries to filter bad configs

  Well, I don't like this. It means we have to duplicate the logic for checking 
the bad configs in two places: in the mk file and in genrandconfig.

  If the problem is that you sometimes don't end up with a valid config even 
after 100 iterations, then I think a better solution is to feed valid values for 
the string options. That way, we still do a build test of e.g. 
BR2_ROOTFS_SKELETON_CUSTOM.

  [Others may disagree with me of course.]

  Regards,
  Arnout


> Changes v2 -> v3:
>    - properly check exit codes
> Changes v1 -> v2:
>    - refactor fixup_config control flow
> ---
>   utils/genrandconfig | 215 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 206 insertions(+), 9 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 3483d55c14..59fe34e58d 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -315,6 +315,192 @@ def fixup_config(sysinfo, configfile):
>           configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
>           configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
>   
> +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
> +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n')
> +
> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n' in configlines:
> +        configlines.remove('BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n')
> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n')
> +
> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_DEFCONFIG=""\n' in configlines:
> +        configlines.remove('BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n')
> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
> +        configlines.remove('BR2_LINUX_KERNEL_DEFCONFIG=""\n')
> +
> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_GIT=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_GIT=y\n')
> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> +
> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_HG=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_HG=y\n')
> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> +
> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_SVN=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_SVN=y\n')
> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> +
> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n')
> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n')
> +
> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n' in configlines:
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n')
> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n')
> +
> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_DTS_SUPPORT=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines and \
> +       'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines:
> +        configlines.remove('BR2_LINUX_KERNEL_DTS_SUPPORT=y\n')
> +        configlines.remove('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n')
> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n')
> +        if 'BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n' in configlines:
> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n')
> +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
> +        if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
> +            configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
> +        if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
> +            configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
> +            configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
> +
> +    if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
> +       'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n')
> +
> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
> +       'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n')
> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n')
> +
> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n' in configlines and \
> +       'BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n' in configlines:
> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n')
> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n')
> +
> +    if 'BR2_KERNEL_HEADERS_VERSION=y\n' in configlines and \
> +       'BR2_DEFAULT_KERNEL_VERSION=""\n' in configlines:
> +        configlines.remove('BR2_KERNEL_HEADERS_VERSION=y\n')
> +        configlines.remove('BR2_DEFAULT_KERNEL_VERSION=""\n')
> +
> +    if 'BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n' in configlines and \
> +       'BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n':
> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n')
> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n')
> +
> +    if 'BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n' in configlines and \
> +       'BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
> +
> +    if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
> +       'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n')
> +
> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
> +       'BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n' in configlines and \
> +       'BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
> +        configlines.remove('BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n')
> +        configlines.remove('BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n')
> +
> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
> +       'BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n' in configlines and \
> +       'BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
> +        configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
> +        configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
> +
> +    if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
> +       'BR2_TARGET_OPTEE_OS_PLATFORM=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
> +        configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
> +
> +    if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
> +       'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
> +
> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
> +       'BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n' in configlines and \
> +       'BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
> +        configlines.remove('BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n')
> +        configlines.remove('BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n')
> +
> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
> +       'BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n' in configlines and \
> +       'BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
> +        configlines.remove('BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n')
> +        configlines.remove('BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n')
> +
> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n' in configlines and \
> +       'BR2_TARGET_UBOOT_BOARDNAME=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n')
> +        configlines.remove('BR2_TARGET_UBOOT_BOARDNAME=""\n')
> +
> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
> +       'BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n' in configlines and \
> +       'BR2_TOOLCHAIN_EXTERNAL_PATH=""\n' in configlines:
> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n')
> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PATH=""\n')
> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
> +            return False
> +
> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
> +       'BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n' in configlines and \
> +       'BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n' in configlines and \
> +       'BR2_TOOLCHAIN_EXTERNAL_URL=""\n' in configlines:
> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n')
> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n')
> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_URL=""\n')
> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
> +            return False
> +
> +    if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
> +       'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
> +       'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
> +        configlines.remove('BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n')
> +        configlines.append('BR2_PACKAGE_XVISOR_USE_DEFCONFIG=y\n')
> +        configlines.remove('BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n')
> +
>       with open(configfile, "w+") as configf:
>           configf.writelines(configlines)
>   
> @@ -331,11 +517,14 @@ def gen_config(args):
>   
>       sysinfo = SystemInfo()
>   
> -    # Select a random toolchain configuration
> -    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> +    if args.toolchains_csv:
> +        # Select a random toolchain configuration
> +        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
>   
> -    i = randint(0, len(configs) - 1)
> -    toolchainconfig = configs[i]
> +        i = randint(0, len(configs) - 1)
> +        toolchainconfig = configs[i]
> +    else:
> +        toolchainconfig = []
>   
>       configlines = list(toolchainconfig)
>   
> @@ -409,7 +598,7 @@ def gen_config(args):
>           bounded_loop -= 1
>           subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>                                  "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> -                               "randpackageconfig"])
> +                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
>   
>           if fixup_config(sysinfo, configfile):
>               break
> @@ -433,10 +622,18 @@ if __name__ == '__main__':
>       parser.add_argument("--buildrootdir", "-b",
>                           help="Buildroot directory (relative to current directory)",
>                           type=str, default='.')
> -    parser.add_argument("--toolchains-csv",
> -                        help="Path of the toolchain configuration file",
> -                        type=str,
> -                        default="support/config-fragments/autobuild/toolchain-configs.csv")
> +
> +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
> +    toolchains_csv.add_argument("--toolchains-csv",
> +                                dest="toolchains_csv",
> +                                help="Path of the toolchain configuration file",
> +                                type=str)
> +    toolchains_csv.add_argument("--no-toolchains-csv",
> +                                dest="toolchains_csv",
> +                                help="Generate random toolchain configuration",
> +                                action='store_false')
> +    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> +
>       args = parser.parse_args()
>   
>       # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
