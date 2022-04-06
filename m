Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FE8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0F0840192;
	Wed,  6 Apr 2022 21:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fR60Fl7klPB4; Wed,  6 Apr 2022 21:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 486A040017;
	Wed,  6 Apr 2022 21:41:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 487671BF57C
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 21:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3692F41879
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 21:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUOXOyoMiPh6 for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 21:41:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CFF24158B
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 21:41:56 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e2442907a1so4030553fac.8
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 14:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jqiWOmxyMYTZRzZHslrByjk9ndXPkF7YygYzSoGq6eY=;
 b=B2rt4cSPPS0baXOtVBxhFa4DMc8q7vAjV/EfbzRh8GZdppsse9NWQQos6k1KE35i6G
 mg2AlCE3IulBEBsvB6Fr133FhEgvYeA4+ovT2uuy7jtfP6V0Zvb2lgJFm764ib/4sajx
 ss5+HC2aSMNP6E9lZL50JPVkHDVbmYvdGsz6aJRdBTiPrDyz2VqoTQxpXdT/IFzD6a/8
 Py1Mo/oaH5n7wlVBAGiRFeHlAqcalTgoPzIuNDwnSvv+X0aXdHHkAz7EDjCdgBlIHPig
 TO1VBIX77zNHATuzSwfproRQe+l+rOZAMDg5Uu+XYwVjIJSU4HJhUV83mBK2DlCs+y4r
 O0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jqiWOmxyMYTZRzZHslrByjk9ndXPkF7YygYzSoGq6eY=;
 b=skav1bc1iVaL8DaHdcx8rk8h+iCyBEyT7gR6cFHtiHMfU3Z0lxvkmMNUx8OOcL7Phs
 K0zJexrxkNpgzj3c4dOvOnkqLhE3ezRCLLG5o4nalMgPBF5qguqtjmFiCEGZtDHy+qFk
 v9SRGII/BAXeIy0R7P8D8t4XH5iT6R2K8RnM02M3qQ0v+KNucclBU0CimuWvQqiHF10J
 9Y2+DctmKbcFiYty4YOIFXqKNutxUtgMDnu1HCr9NuAqzavZy7d9kPkTXooHis33affn
 3pxB0StcYxHcWxIFyJrfTwUc4wzvhdyYxzDV+PzQzeBxLfO6Bu1Ks1JCOkzXMQcUYEmU
 smGA==
X-Gm-Message-State: AOAM532xUm4IauvsFkbX4awd7Bs/rDpS09FjFclnifsKk9XTmOStuvP1
 J5v8NxMq3ZpvA80wexs4YYghRclaTnQ3YKPPddI=
X-Google-Smtp-Source: ABdhPJyOnN15VpAOlz/0H/GLrUMInuheKPKUq438ruonjtAF6eekqYDQy5xOP7zSS3WDlpTLssxEkntNmIrhwBYEcnk=
X-Received: by 2002:a05:6870:2104:b0:e2:96b:be89 with SMTP id
 f4-20020a056870210400b000e2096bbe89mr5006508oae.99.1649281315046; Wed, 06 Apr
 2022 14:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220405115040.3779242-1-james.hilliard1@gmail.com>
 <4a9f7aa1-82e4-664e-7177-71596cb021e7@mind.be>
 <CADvTj4rHfM=3q0DXJ2U_AccCL7VYZyUtwQ3d215o9_ev6QUPEw@mail.gmail.com>
 <41d50cfd-3009-13d4-6f41-f0b2bdf3297f@mind.be>
In-Reply-To: <41d50cfd-3009-13d4-6f41-f0b2bdf3297f@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 6 Apr 2022 15:41:43 -0600
Message-ID: <CADvTj4p0bV2iotTKrOpo30YbWJntuyY-suqzqE3JTGU=gPqYKQ@mail.gmail.com>
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

On Wed, Apr 6, 2022 at 8:12 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 05/04/2022 21:38, James Hilliard wrote:
> > On Tue, Apr 5, 2022 at 11:23 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 05/04/2022 13:50, James Hilliard wrote:
> >>> Currently we only test a limited set of toolchains that are mostly
> >>> prebuilt, add a flag to allow using randconfig for randomizing
> >>> additional toolchain settings instead of randpackageconfig.
> >>>
> >>> To avoid invalid configs we need to add additional config validation
> >>> filtering and fixups.
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>> Changes v3 -> v4:
> >>>     - use fixup_config instead of other retries to filter bad configs
> >>
> >>    Well, I don't like this. It means we have to duplicate the logic for checking
> >> the bad configs in two places: in the mk file and in genrandconfig.
> >
> > Well it seems to work better since instead of regenerating it tries to
> > fixup the config. I think this gives better statistical coverage of some
> > config options.
>
>   It will create a bias towards the default option for the options you exclude.
> See below.

Yes, I'm aware of that, however this improves coverage as certain options
like enabling the kernel build result in a high percentage of invalid configs
otherwise which creates a bias towards builds with the kernel build disabled
entirely, at least by fixing up invalid kernel configs instead of
triggering a full
re-randomization we get more builds with kernels enabled as the invalid
configs should no longer create a bias towards kernel builds being disabled
for example. Having a bias towards the common defaults seems to be a net
improvement here.

>
> >
> >>
> >>    If the problem is that you sometimes don't end up with a valid config even
> >> after 100 iterations, then I think a better solution is to feed valid values for
> >> the string options. That way, we still do a build test of e.g.
> >> BR2_ROOTFS_SKELETON_CUSTOM.
> >
> > That looks a bit tricky, although we could probably add it for some cases
> > that we want test coverage for.
> >
> >>
> >>    [Others may disagree with me of course.]
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>
> >>> Changes v2 -> v3:
> >>>     - properly check exit codes
> >>> Changes v1 -> v2:
> >>>     - refactor fixup_config control flow
> >>> ---
> >>>    utils/genrandconfig | 215 ++++++++++++++++++++++++++++++++++++++++++--
> >>>    1 file changed, 206 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/utils/genrandconfig b/utils/genrandconfig
> >>> index 3483d55c14..59fe34e58d 100755
> >>> --- a/utils/genrandconfig
> >>> +++ b/utils/genrandconfig
> >>> @@ -315,6 +315,192 @@ def fixup_config(sysinfo, configfile):
> >>>            configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
> >>>            configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
> >>>
> >>> +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
> >>> +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
>
>   Here, the BR2_ROOTFS_SKELETON_CUSTOM_PATH check is basically redundant:
> randconfig will never fill something in for the string, so it is always empty.

The fixup_config function is used for configs based on the toolchains csv's
as well so this is necessary to prevent accidentally fixing up a valid
BR2_ROOTFS_SKELETON_CUSTOM_PATH provided in a toolchain csv
file.

>
> >>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
> >>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n')
>
>   Thus, the result is that if a config is generated with
> BR2_ROOTFS_SKELETON_CUSTOM=y, it will be removed again and revert to its default.
>
>   In this case, there are just two choices so it doesn't make a difference. But
> if there are more than two choices, removing one of them creates a bias towards
> the default option. I wouldn't call this "better statistical coverage".
> Statistically, taking a completely random sampling and then discarding samples
> that are somehow not appropriate is considered "better" than fudging
> inappropriate samples in a certain direction.

The main issue is that throwing out invalids creates a heavy bias towards
disabling the configs dependencies entirely which is not desirable.

Having a bias towards kernel builds with default options is better than having
a very strong bias towards the kernel not being built at all.

>
>
>   Regards,
>   Arnout
>
>
>
> >>> +
> >>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>> +        configlines.remove('BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n')
> >>> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n')
> >>> +
> >>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_DEFCONFIG=""\n' in configlines:
> >>> +        configlines.remove('BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n')
> >>> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_DEFCONFIG=""\n')
> >>> +
> >>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_GIT=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_GIT=y\n')
> >>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> >>> +
> >>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_HG=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_HG=y\n')
> >>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> >>> +
> >>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_SVN=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_SVN=y\n')
> >>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> >>> +
> >>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n')
> >>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n')
> >>> +
> >>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n' in configlines:
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n')
> >>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n')
> >>> +
> >>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_DTS_SUPPORT=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines:
> >>> +        configlines.remove('BR2_LINUX_KERNEL_DTS_SUPPORT=y\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n')
> >>> +        if 'BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n' in configlines:
> >>> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n')
> >>> +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
> >>> +        if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
> >>> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
> >>> +            configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
> >>> +        if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
> >>> +            configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
> >>> +            configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
> >>> +
> >>> +    if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
> >>> +       'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
> >>> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
> >>> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n')
> >>> +
> >>> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
> >>> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>> +       'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
> >>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n')
> >>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n')
> >>> +
> >>> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
> >>> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n' in configlines and \
> >>> +       'BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n' in configlines:
> >>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
> >>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n')
> >>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n')
> >>> +
> >>> +    if 'BR2_KERNEL_HEADERS_VERSION=y\n' in configlines and \
> >>> +       'BR2_DEFAULT_KERNEL_VERSION=""\n' in configlines:
> >>> +        configlines.remove('BR2_KERNEL_HEADERS_VERSION=y\n')
> >>> +        configlines.remove('BR2_DEFAULT_KERNEL_VERSION=""\n')
> >>> +
> >>> +    if 'BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n' in configlines and \
> >>> +       'BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n':
> >>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n')
> >>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n')
> >>> +
> >>> +    if 'BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n' in configlines and \
> >>> +       'BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
> >>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
> >>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
> >>> +
> >>> +    if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
> >>> +       'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
> >>> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
> >>> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n')
> >>> +
> >>> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
> >>> +       'BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>> +       'BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
> >>> +        configlines.remove('BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n')
> >>> +        configlines.remove('BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n')
> >>> +
> >>> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
> >>> +       'BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n' in configlines and \
> >>> +       'BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n' in configlines:
> >>> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
> >>> +        configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
> >>> +        configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
> >>> +
> >>> +    if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
> >>> +       'BR2_TARGET_OPTEE_OS_PLATFORM=""\n' in configlines:
> >>> +        configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
> >>> +        configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
> >>> +
> >>> +    if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
> >>> +       'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
> >>> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
> >>> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
> >>> +
> >>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> >>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
> >>> +       'BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>> +       'BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> >>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
> >>> +        configlines.remove('BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n')
> >>> +        configlines.remove('BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n')
> >>> +
> >>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> >>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
> >>> +       'BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n' in configlines and \
> >>> +       'BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n' in configlines:
> >>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> >>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
> >>> +        configlines.remove('BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n')
> >>> +        configlines.remove('BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n')
> >>> +
> >>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> >>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n' in configlines and \
> >>> +       'BR2_TARGET_UBOOT_BOARDNAME=""\n' in configlines:
> >>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> >>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n')
> >>> +        configlines.remove('BR2_TARGET_UBOOT_BOARDNAME=""\n')
> >>> +
> >>> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
> >>> +       'BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n' in configlines and \
> >>> +       'BR2_TOOLCHAIN_EXTERNAL_PATH=""\n' in configlines:
> >>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
> >>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n')
> >>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PATH=""\n')
> >>> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
> >>> +            return False
> >>> +
> >>> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
> >>> +       'BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n' in configlines and \
> >>> +       'BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n' in configlines and \
> >>> +       'BR2_TOOLCHAIN_EXTERNAL_URL=""\n' in configlines:
> >>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
> >>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n')
> >>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n')
> >>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_URL=""\n')
> >>> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
> >>> +            return False
> >>> +
> >>> +    if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
> >>> +       'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>> +       'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>> +        configlines.remove('BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n')
> >>> +        configlines.append('BR2_PACKAGE_XVISOR_USE_DEFCONFIG=y\n')
> >>> +        configlines.remove('BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n')
> >>> +
> >>>        with open(configfile, "w+") as configf:
> >>>            configf.writelines(configlines)
> >>>
> >>> @@ -331,11 +517,14 @@ def gen_config(args):
> >>>
> >>>        sysinfo = SystemInfo()
> >>>
> >>> -    # Select a random toolchain configuration
> >>> -    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> >>> +    if args.toolchains_csv:
> >>> +        # Select a random toolchain configuration
> >>> +        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> >>>
> >>> -    i = randint(0, len(configs) - 1)
> >>> -    toolchainconfig = configs[i]
> >>> +        i = randint(0, len(configs) - 1)
> >>> +        toolchainconfig = configs[i]
> >>> +    else:
> >>> +        toolchainconfig = []
> >>>
> >>>        configlines = list(toolchainconfig)
> >>>
> >>> @@ -409,7 +598,7 @@ def gen_config(args):
> >>>            bounded_loop -= 1
> >>>            subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> >>>                                   "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> >>> -                               "randpackageconfig"])
> >>> +                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
> >>>
> >>>            if fixup_config(sysinfo, configfile):
> >>>                break
> >>> @@ -433,10 +622,18 @@ if __name__ == '__main__':
> >>>        parser.add_argument("--buildrootdir", "-b",
> >>>                            help="Buildroot directory (relative to current directory)",
> >>>                            type=str, default='.')
> >>> -    parser.add_argument("--toolchains-csv",
> >>> -                        help="Path of the toolchain configuration file",
> >>> -                        type=str,
> >>> -                        default="support/config-fragments/autobuild/toolchain-configs.csv")
> >>> +
> >>> +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
> >>> +    toolchains_csv.add_argument("--toolchains-csv",
> >>> +                                dest="toolchains_csv",
> >>> +                                help="Path of the toolchain configuration file",
> >>> +                                type=str)
> >>> +    toolchains_csv.add_argument("--no-toolchains-csv",
> >>> +                                dest="toolchains_csv",
> >>> +                                help="Generate random toolchain configuration",
> >>> +                                action='store_false')
> >>> +    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> >>> +
> >>>        args = parser.parse_args()
> >>>
> >>>        # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
