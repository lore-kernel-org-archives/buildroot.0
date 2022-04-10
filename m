Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51FDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 03:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E6A4416F3;
	Sun, 10 Apr 2022 03:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxatdi2GR8WJ; Sun, 10 Apr 2022 03:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BBB2418A8;
	Sun, 10 Apr 2022 03:30:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 099311BF983
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 03:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC21A60AE5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 03:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66a4DaogsVx8 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 03:30:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51BD760A70
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 03:30:02 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so13768331fac.11
 for <buildroot@buildroot.org>; Sat, 09 Apr 2022 20:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8W4H6E9LeYs1u1Chn+zMJhdEC+YUncxdofaRZnTy9lU=;
 b=Tg+HewKaEyeCxyjSfdRmb7/qtryTJThibbYSHVD4G/BqUnvXz0eYh3dLoyZE63GNoF
 7kUSuujViuUw0N10f3gitCIbYtEQtJkrCcB/SUkXaoEytMcNPDm3SuC701FihkPgj+6y
 rUjE8I86I+k7/DJ31g0MKyu8lys8wTfzDshpWzKq4Dh/q/5T5aDno8R2wgtvDgxh8imK
 ZioGcp1N6RjnnAeCSMIYXhO5ieO8818iKseptKsxYJkaQfqjXKpQ4CQ0EQu4LRqlegN0
 5H1+Uc9Z719x2FdQ7uA2VvhLu9wkEBUMs47frrqNP6LVgElcj3pE37PpzONesxHGPmX1
 w+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8W4H6E9LeYs1u1Chn+zMJhdEC+YUncxdofaRZnTy9lU=;
 b=UE7PiCBnGiQnTQemvqqjZtII3BU3nL0XGQwdfG4W67fnUJVrHjzjEJ953VjJldljEZ
 vhfa5askGLn9qwJEQBfG/+Q+bkeoh6jT/TpSWn78+0GFTtSHL5YPJf70ZqZnpmJ8M0Zc
 e+ZGqFquhV5QdE/qvBZ+iyLUZH4yeuWvWy9O9MW1PsgwCw2SJAbjxy1wZ7jSm1ivyKz8
 NhyFc5gTxV57XoFVA3RejbNGPdXLfAonX8cYguptAZhgOY1SOCtUQH05k1FlYR36UvdZ
 V/775xlpWzkb49mkd6eOnSlIpT/P4WDS2baQdn7I+wfOgUxCu7S8T5NoKG6IHQVlpiQW
 dBlQ==
X-Gm-Message-State: AOAM5332FL4ezUVJ0kKtIb0n5iOE4cXnPLtKeUXvzLMNYqVvxmIWeXXl
 FZgg8yww6WP29nf5DU0ou6AGCd/ruLYIN+T4+T3L+lE19KGwFg==
X-Google-Smtp-Source: ABdhPJw6/nDwF0mZw+h9kUCHisYDx2UHgtUASbDmhM/dZL6RRgFZv0/6Av8r7y37zTiSAiBjxXRqOFDnAbMFfWGqIjQ=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr10858331oaa.200.1649561401098; Sat, 09
 Apr 2022 20:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220405115040.3779242-1-james.hilliard1@gmail.com>
 <4a9f7aa1-82e4-664e-7177-71596cb021e7@mind.be>
 <CADvTj4rHfM=3q0DXJ2U_AccCL7VYZyUtwQ3d215o9_ev6QUPEw@mail.gmail.com>
 <41d50cfd-3009-13d4-6f41-f0b2bdf3297f@mind.be>
 <CADvTj4p0bV2iotTKrOpo30YbWJntuyY-suqzqE3JTGU=gPqYKQ@mail.gmail.com>
 <36f3e482-dce6-db0d-08e0-b062f16ca69e@mind.be>
In-Reply-To: <36f3e482-dce6-db0d-08e0-b062f16ca69e@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 9 Apr 2022 21:29:49 -0600
Message-ID: <CADvTj4pqD=nHPug1u+fm_WrYaASuM8jegRUUiCxi=3DuKoguUQ@mail.gmail.com>
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

On Sat, Apr 9, 2022 at 10:57 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 06/04/2022 23:41, James Hilliard wrote:
> > On Wed, Apr 6, 2022 at 8:12 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 05/04/2022 21:38, James Hilliard wrote:
> >>> On Tue, Apr 5, 2022 at 11:23 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 05/04/2022 13:50, James Hilliard wrote:
> >>>>> Currently we only test a limited set of toolchains that are mostly
> >>>>> prebuilt, add a flag to allow using randconfig for randomizing
> >>>>> additional toolchain settings instead of randpackageconfig.
> >>>>>
> >>>>> To avoid invalid configs we need to add additional config validation
> >>>>> filtering and fixups.
> >>>>>
> >>>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>>>> ---
> >>>>> Changes v3 -> v4:
> >>>>>      - use fixup_config instead of other retries to filter bad configs
> >>>>
> >>>>     Well, I don't like this. It means we have to duplicate the logic for checking
> >>>> the bad configs in two places: in the mk file and in genrandconfig.
> >>>
> >>> Well it seems to work better since instead of regenerating it tries to
> >>> fixup the config. I think this gives better statistical coverage of some
> >>> config options.
> >>
> >>    It will create a bias towards the default option for the options you exclude.
> >> See below.
> >
> > Yes, I'm aware of that, however this improves coverage as certain options
> > like enabling the kernel build result in a high percentage of invalid configs
> > otherwise which creates a bias towards builds with the kernel build disabled
> > entirely, at least by fixing up invalid kernel configs instead of
> > triggering a full
> > re-randomization we get more builds with kernels enabled as the invalid
> > configs should no longer create a bias towards kernel builds being disabled
> > for example. Having a bias towards the common defaults seems to be a net
> > improvement here.
>
>   Excellent point, indeed. I hadn't thought so far.
>
> >>>>     If the problem is that you sometimes don't end up with a valid config even
> >>>> after 100 iterations, then I think a better solution is to feed valid values for
> >>>> the string options. That way, we still do a build test of e.g.
> >>>> BR2_ROOTFS_SKELETON_CUSTOM.
> >>>
> >>> That looks a bit tricky, although we could probably add it for some cases
> >>> that we want test coverage for.
> >>>
> >>>>
> >>>>     [Others may disagree with me of course.]
> >>>>
> >>>>     Regards,
> >>>>     Arnout
> >>>>
> >>>>
> >>>>> Changes v2 -> v3:
> >>>>>      - properly check exit codes
> >>>>> Changes v1 -> v2:
> >>>>>      - refactor fixup_config control flow
> >>>>> ---
> >>>>>     utils/genrandconfig | 215 ++++++++++++++++++++++++++++++++++++++++++--
> >>>>>     1 file changed, 206 insertions(+), 9 deletions(-)
> >>>>>
> >>>>> diff --git a/utils/genrandconfig b/utils/genrandconfig
> >>>>> index 3483d55c14..59fe34e58d 100755
> >>>>> --- a/utils/genrandconfig
> >>>>> +++ b/utils/genrandconfig
> >>>>> @@ -315,6 +315,192 @@ def fixup_config(sysinfo, configfile):
> >>>>>             configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
> >>>>>             configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
> >>>>>
> >>>>> +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
> >>>>> +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
> >>
> >>    Here, the BR2_ROOTFS_SKELETON_CUSTOM_PATH check is basically redundant:
> >> randconfig will never fill something in for the string, so it is always empty.
> >
> > The fixup_config function is used for configs based on the toolchains csv's
> > as well so this is necessary to prevent accidentally fixing up a valid
> > BR2_ROOTFS_SKELETON_CUSTOM_PATH provided in a toolchain csv
> > file.
>
>   Oh, right, I didn't think of that either! At the moment the point is moot
> because randpackageconfig is used. Oh hang on, I'm wrong again, it actually
> *would* work specifically for ROOTFS_SKELETON_CUSTOM_PATH, if
> ROOTFS_SKELETON_CUSTOM is also set in the toolchain config. So I expressed it
> incorrectly in the commit message.
>
>   Unfortunately, I already applied and pushed, so I can't fix the commit message
> any more...
>
>   Anyway, thanks for the patch!
>
>   I think the next steps are:

Well first we need a few fixes in buildroot-test so we can enable the
new option:
https://patchwork.ozlabs.org/project/buildroot/patch/20220410031713.3662393-1-james.hilliard1@gmail.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20220410031713.3662393-2-james.hilliard1@gmail.com/

I ended up getting rid of docopts since it's unmaintained and makes it tricky
to add the --no-toolchains-csv properly.

>
> - move 'make dependencies' inside the loop (not strictly necessary but I think
> it woudl be an improvement);

Maybe, although probably need to have failures reported somewhere so
that config fixups can be added.

>
> - add the toolchain config *after* running randconfig, so we can use full
> randconfig even if toolchains-csv is set;
>
> - add a mechanism to be able to specify additional defaults together with the
> toolchain config;
>
> - add options to the toolchain configs to give default values for some string
> options.
>
>   A mechanism is needed for adding defaults because currently we can only force
> options in the toolchain config - if it's removed by 'make olddefconfig',
> is_toolchain_usable will return false. But we also don't want to *always* build
> a kernel in a toolchain config - and this is particularly true for uboot and
> barebox, where there's no arch default config to fall back to, so even with
> randconfig they essentially will never be built.

Yeah, there's a bit of cleanup needed in general, although we're getting high
failure rates just from this improved randomization so maybe best to focus
on fixing those issues that this change revealed first so that we can
get a better
idea of what combinations need more test coverage.

>
>
>   Regards,
>   Arnout
>
>
> >
> >>
> >>>>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
> >>>>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n')
> >>
> >>    Thus, the result is that if a config is generated with
> >> BR2_ROOTFS_SKELETON_CUSTOM=y, it will be removed again and revert to its default.
> >>
> >>    In this case, there are just two choices so it doesn't make a difference. But
> >> if there are more than two choices, removing one of them creates a bias towards
> >> the default option. I wouldn't call this "better statistical coverage".
> >> Statistically, taking a completely random sampling and then discarding samples
> >> that are somehow not appropriate is considered "better" than fudging
> >> inappropriate samples in a certain direction.
> >
> > The main issue is that throwing out invalids creates a heavy bias towards
> > disabling the configs dependencies entirely which is not desirable.
> >
> > Having a bias towards kernel builds with default options is better than having
> > a very strong bias towards the kernel not being built at all.
> >
> >>
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>
> >>
> >>>>> +
> >>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n')
> >>>>> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n')
> >>>>> +
> >>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_DEFCONFIG=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n')
> >>>>> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_DEFCONFIG=""\n')
> >>>>> +
> >>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_GIT=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_GIT=y\n')
> >>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> >>>>> +
> >>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_HG=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_HG=y\n')
> >>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> >>>>> +
> >>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_SVN=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_SVN=y\n')
> >>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
> >>>>> +
> >>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n')
> >>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n')
> >>>>> +
> >>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n')
> >>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n')
> >>>>> +
> >>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_DTS_SUPPORT=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_DTS_SUPPORT=y\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n')
> >>>>> +        if 'BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n' in configlines:
> >>>>> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n')
> >>>>> +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
> >>>>> +        if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
> >>>>> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
> >>>>> +            configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
> >>>>> +        if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
> >>>>> +            configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
> >>>>> +            configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
> >>>>> +
> >>>>> +    if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
> >>>>> +       'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
> >>>>> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n')
> >>>>> +
> >>>>> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
> >>>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
> >>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n')
> >>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n')
> >>>>> +
> >>>>> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
> >>>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n' in configlines and \
> >>>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
> >>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n')
> >>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n')
> >>>>> +
> >>>>> +    if 'BR2_KERNEL_HEADERS_VERSION=y\n' in configlines and \
> >>>>> +       'BR2_DEFAULT_KERNEL_VERSION=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_KERNEL_HEADERS_VERSION=y\n')
> >>>>> +        configlines.remove('BR2_DEFAULT_KERNEL_VERSION=""\n')
> >>>>> +
> >>>>> +    if 'BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n' in configlines and \
> >>>>> +       'BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n':
> >>>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n')
> >>>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n')
> >>>>> +
> >>>>> +    if 'BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n' in configlines and \
> >>>>> +       'BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
> >>>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
> >>>>> +
> >>>>> +    if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n')
> >>>>> +
> >>>>> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n')
> >>>>> +
> >>>>> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
> >>>>> +
> >>>>> +    if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_OPTEE_OS_PLATFORM=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
> >>>>> +
> >>>>> +    if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
> >>>>> +
> >>>>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n')
> >>>>> +
> >>>>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n')
> >>>>> +
> >>>>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n' in configlines and \
> >>>>> +       'BR2_TARGET_UBOOT_BOARDNAME=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n')
> >>>>> +        configlines.remove('BR2_TARGET_UBOOT_BOARDNAME=""\n')
> >>>>> +
> >>>>> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
> >>>>> +       'BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n' in configlines and \
> >>>>> +       'BR2_TOOLCHAIN_EXTERNAL_PATH=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
> >>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n')
> >>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PATH=""\n')
> >>>>> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
> >>>>> +            return False
> >>>>> +
> >>>>> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
> >>>>> +       'BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n' in configlines and \
> >>>>> +       'BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n' in configlines and \
> >>>>> +       'BR2_TOOLCHAIN_EXTERNAL_URL=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
> >>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n')
> >>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n')
> >>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_URL=""\n')
> >>>>> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
> >>>>> +            return False
> >>>>> +
> >>>>> +    if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
> >>>>> +       'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
> >>>>> +       'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
> >>>>> +        configlines.remove('BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n')
> >>>>> +        configlines.append('BR2_PACKAGE_XVISOR_USE_DEFCONFIG=y\n')
> >>>>> +        configlines.remove('BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n')
> >>>>> +
> >>>>>         with open(configfile, "w+") as configf:
> >>>>>             configf.writelines(configlines)
> >>>>>
> >>>>> @@ -331,11 +517,14 @@ def gen_config(args):
> >>>>>
> >>>>>         sysinfo = SystemInfo()
> >>>>>
> >>>>> -    # Select a random toolchain configuration
> >>>>> -    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> >>>>> +    if args.toolchains_csv:
> >>>>> +        # Select a random toolchain configuration
> >>>>> +        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> >>>>>
> >>>>> -    i = randint(0, len(configs) - 1)
> >>>>> -    toolchainconfig = configs[i]
> >>>>> +        i = randint(0, len(configs) - 1)
> >>>>> +        toolchainconfig = configs[i]
> >>>>> +    else:
> >>>>> +        toolchainconfig = []
> >>>>>
> >>>>>         configlines = list(toolchainconfig)
> >>>>>
> >>>>> @@ -409,7 +598,7 @@ def gen_config(args):
> >>>>>             bounded_loop -= 1
> >>>>>             subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> >>>>>                                    "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> >>>>> -                               "randpackageconfig"])
> >>>>> +                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
> >>>>>
> >>>>>             if fixup_config(sysinfo, configfile):
> >>>>>                 break
> >>>>> @@ -433,10 +622,18 @@ if __name__ == '__main__':
> >>>>>         parser.add_argument("--buildrootdir", "-b",
> >>>>>                             help="Buildroot directory (relative to current directory)",
> >>>>>                             type=str, default='.')
> >>>>> -    parser.add_argument("--toolchains-csv",
> >>>>> -                        help="Path of the toolchain configuration file",
> >>>>> -                        type=str,
> >>>>> -                        default="support/config-fragments/autobuild/toolchain-configs.csv")
> >>>>> +
> >>>>> +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
> >>>>> +    toolchains_csv.add_argument("--toolchains-csv",
> >>>>> +                                dest="toolchains_csv",
> >>>>> +                                help="Path of the toolchain configuration file",
> >>>>> +                                type=str)
> >>>>> +    toolchains_csv.add_argument("--no-toolchains-csv",
> >>>>> +                                dest="toolchains_csv",
> >>>>> +                                help="Generate random toolchain configuration",
> >>>>> +                                action='store_false')
> >>>>> +    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> >>>>> +
> >>>>>         args = parser.parse_args()
> >>>>>
> >>>>>         # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
