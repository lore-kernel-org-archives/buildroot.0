Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2F6C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 19:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0514182969;
	Tue,  5 Apr 2022 19:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9poMiS6Lj1x2; Tue,  5 Apr 2022 19:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B26CE818CA;
	Tue,  5 Apr 2022 19:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 462C11BF21A
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34067401F9
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdeCn5Gpmd5a for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 19:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEFFD401F4
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 19:39:20 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id j83so164394oih.6
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 12:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t6GQbyZcvKvgNvA1vsMWdFPuXccc8+sPDWS+NLVVuAc=;
 b=Z20htNmi8WneCH7KY/qa87QGF3oO9xbxzYXy0UbFZX3L9x7yShp5euwyiz8WH7bv/7
 2oU5wNNTANy88y7BZBGjhS46bo56V594bTmGu/sZuDCp6k7P2mSKLn4+rNnHsDM4VzWv
 1sCF4lbKnP243ddSqWJxf+ChqJCsXamx+M1XRU5QbTz0Ci4bxvB5bl/9TecuX8ZSBuwf
 APFhoqEiKmjElQj2R7TxHxUCZNFFPhKTVg2dbIewNLH6tDC4EgbIRTKdbIh13MZvwUeU
 NCaczOn6J+y/ynv1jigEWLRyoF7PcAEL0fT652V2a+H/nQN07bJkjPCAvzlLlDVWsfOs
 ns7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t6GQbyZcvKvgNvA1vsMWdFPuXccc8+sPDWS+NLVVuAc=;
 b=xWpgmAWu5WHb44m+ozzuT96FFiWQcM9ELWfF0dtf+Dgepgo8XYHXHQkhIfAkaQVL0W
 nErs28JgbGipa5NH+EQ69CrrGJSXMDEBGKPT/gZC8fqA273yBpcLLhR/Ol8ythp9OX4s
 PgKaqiYN2rlBGxD8dNUz5AS/ExJCxt+MoDrg5Y0nSQUQ2p+t+Cpgo8darpKxhiQHdg4A
 loihcQAxKX8peSFA02N9XFpqtvRUB4paiOFvk7FHC3GszTFStFPNukXXo+FzUQ1Ruyj/
 cFpFEvfaiVMW54ThY/3VQ/grMIiflsXW/gamfH87YQVX/eojgJcXK6eXRiRnNvn6o9wg
 nkfA==
X-Gm-Message-State: AOAM531D5f756bAiadTtc+Szgkjr5+tiUa76dvotsLFK/R2s/2tZE9lk
 p9T7iPAoVcgNk57GLWHBRDJ9IqjT/MUYCvnw0YkdWLsGZLE=
X-Google-Smtp-Source: ABdhPJyw5igEETvOVrihltP6EFcBY6MxFa1pPJbbgDpePMwD5zH/9Kry4U3MlzEq/5n81n6ccsaoiEvZvQIa8AyFRWs=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr2012583oic.200.1649187559708; Tue, 05
 Apr 2022 12:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220405115040.3779242-1-james.hilliard1@gmail.com>
 <4a9f7aa1-82e4-664e-7177-71596cb021e7@mind.be>
In-Reply-To: <4a9f7aa1-82e4-664e-7177-71596cb021e7@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 5 Apr 2022 13:38:52 -0600
Message-ID: <CADvTj4rHfM=3q0DXJ2U_AccCL7VYZyUtwQ3d215o9_ev6QUPEw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Apr 5, 2022 at 11:23 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 05/04/2022 13:50, James Hilliard wrote:
> > Currently we only test a limited set of toolchains that are mostly
> > prebuilt, add a flag to allow using randconfig for randomizing
> > additional toolchain settings instead of randpackageconfig.
> >
> > To avoid invalid configs we need to add additional config validation
> > filtering and fixups.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v3 -> v4:
> >    - use fixup_config instead of other retries to filter bad configs
>
>   Well, I don't like this. It means we have to duplicate the logic for checking
> the bad configs in two places: in the mk file and in genrandconfig.

Well it seems to work better since instead of regenerating it tries to
fixup the config. I think this gives better statistical coverage of some
config options.

>
>   If the problem is that you sometimes don't end up with a valid config even
> after 100 iterations, then I think a better solution is to feed valid values for
> the string options. That way, we still do a build test of e.g.
> BR2_ROOTFS_SKELETON_CUSTOM.

That looks a bit tricky, although we could probably add it for some cases
that we want test coverage for.

>
>   [Others may disagree with me of course.]
>
>   Regards,
>   Arnout
>
>
> > Changes v2 -> v3:
> >    - properly check exit codes
> > Changes v1 -> v2:
> >    - refactor fixup_config control flow
> > ---
> >   utils/genrandconfig | 215 ++++++++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 206 insertions(+), 9 deletions(-)
> >
> > diff --git a/utils/genrandconfig b/utils/genrandconfig
> > index 3483d55c14..59fe34e58d 100755
> > --- a/utils/genrandconfig
> > +++ b/utils/genrandconfig
> > @@ -315,6 +315,192 @@ def fixup_config(sysinfo, configfile):
> >           configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
> >           configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
> >
> > +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
> > +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
> > +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
> > +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n')
> > +
> > +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n' in configlines:
> > +        configlines.remove('BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n')
> > +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n')
> > +
> > +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_DEFCONFIG=""\n' in configlines:
> > +        configlines.remove('BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n')
> > +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_DEFCONFIG=""\n')
> > +
> > +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_GIT=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_GIT=y\n')
> > +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> > +
> > +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_HG=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_HG=y\n')
> > +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> > +
> > +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_SVN=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_SVN=y\n')
> > +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> > +
> > +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n')
> > +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n')
> > +
> > +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n' in configlines:
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n')
> > +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n')
> > +
> > +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_DTS_SUPPORT=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines:
> > +        configlines.remove('BR2_LINUX_KERNEL_DTS_SUPPORT=y\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n')
> > +        if 'BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n' in configlines:
> > +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n')
> > +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
> > +        if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
> > +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
> > +            configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
> > +        if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
> > +            configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
> > +            configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
> > +
> > +    if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
> > +       'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
> > +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
> > +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n')
> > +
> > +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
> > +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
> > +       'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
> > +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
> > +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n')
> > +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n')
> > +
> > +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
> > +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n' in configlines and \
> > +       'BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n' in configlines:
> > +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
> > +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n')
> > +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n')
> > +
> > +    if 'BR2_KERNEL_HEADERS_VERSION=y\n' in configlines and \
> > +       'BR2_DEFAULT_KERNEL_VERSION=""\n' in configlines:
> > +        configlines.remove('BR2_KERNEL_HEADERS_VERSION=y\n')
> > +        configlines.remove('BR2_DEFAULT_KERNEL_VERSION=""\n')
> > +
> > +    if 'BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n' in configlines and \
> > +       'BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n':
> > +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n')
> > +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n')
> > +
> > +    if 'BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n' in configlines and \
> > +       'BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
> > +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
> > +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
> > +
> > +    if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
> > +       'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
> > +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
> > +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n')
> > +
> > +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
> > +       'BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n' in configlines and \
> > +       'BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n' in configlines:
> > +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
> > +        configlines.remove('BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n')
> > +        configlines.remove('BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n')
> > +
> > +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
> > +       'BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n' in configlines and \
> > +       'BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n' in configlines:
> > +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
> > +        configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
> > +        configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
> > +
> > +    if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
> > +       'BR2_TARGET_OPTEE_OS_PLATFORM=""\n' in configlines:
> > +        configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
> > +        configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
> > +
> > +    if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
> > +       'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
> > +        configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
> > +        configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
> > +
> > +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> > +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
> > +       'BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n' in configlines and \
> > +       'BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n' in configlines:
> > +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> > +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
> > +        configlines.remove('BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n')
> > +        configlines.remove('BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n')
> > +
> > +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> > +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
> > +       'BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n' in configlines and \
> > +       'BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n' in configlines:
> > +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> > +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
> > +        configlines.remove('BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n')
> > +        configlines.remove('BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n')
> > +
> > +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> > +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n' in configlines and \
> > +       'BR2_TARGET_UBOOT_BOARDNAME=""\n' in configlines:
> > +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> > +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n')
> > +        configlines.remove('BR2_TARGET_UBOOT_BOARDNAME=""\n')
> > +
> > +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
> > +       'BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n' in configlines and \
> > +       'BR2_TOOLCHAIN_EXTERNAL_PATH=""\n' in configlines:
> > +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
> > +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n')
> > +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PATH=""\n')
> > +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
> > +            return False
> > +
> > +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
> > +       'BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n' in configlines and \
> > +       'BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n' in configlines and \
> > +       'BR2_TOOLCHAIN_EXTERNAL_URL=""\n' in configlines:
> > +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
> > +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n')
> > +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n')
> > +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_URL=""\n')
> > +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
> > +            return False
> > +
> > +    if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
> > +       'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
> > +       'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
> > +        configlines.remove('BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n')
> > +        configlines.append('BR2_PACKAGE_XVISOR_USE_DEFCONFIG=y\n')
> > +        configlines.remove('BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n')
> > +
> >       with open(configfile, "w+") as configf:
> >           configf.writelines(configlines)
> >
> > @@ -331,11 +517,14 @@ def gen_config(args):
> >
> >       sysinfo = SystemInfo()
> >
> > -    # Select a random toolchain configuration
> > -    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> > +    if args.toolchains_csv:
> > +        # Select a random toolchain configuration
> > +        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> >
> > -    i = randint(0, len(configs) - 1)
> > -    toolchainconfig = configs[i]
> > +        i = randint(0, len(configs) - 1)
> > +        toolchainconfig = configs[i]
> > +    else:
> > +        toolchainconfig = []
> >
> >       configlines = list(toolchainconfig)
> >
> > @@ -409,7 +598,7 @@ def gen_config(args):
> >           bounded_loop -= 1
> >           subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> >                                  "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> > -                               "randpackageconfig"])
> > +                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
> >
> >           if fixup_config(sysinfo, configfile):
> >               break
> > @@ -433,10 +622,18 @@ if __name__ == '__main__':
> >       parser.add_argument("--buildrootdir", "-b",
> >                           help="Buildroot directory (relative to current directory)",
> >                           type=str, default='.')
> > -    parser.add_argument("--toolchains-csv",
> > -                        help="Path of the toolchain configuration file",
> > -                        type=str,
> > -                        default="support/config-fragments/autobuild/toolchain-configs.csv")
> > +
> > +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
> > +    toolchains_csv.add_argument("--toolchains-csv",
> > +                                dest="toolchains_csv",
> > +                                help="Path of the toolchain configuration file",
> > +                                type=str)
> > +    toolchains_csv.add_argument("--no-toolchains-csv",
> > +                                dest="toolchains_csv",
> > +                                help="Generate random toolchain configuration",
> > +                                action='store_false')
> > +    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> > +
> >       args = parser.parse_args()
> >
> >       # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
