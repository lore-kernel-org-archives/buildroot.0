Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3E0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 16:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EE7441998;
	Sat,  9 Apr 2022 16:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eF59dxzBIog3; Sat,  9 Apr 2022 16:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9024B419A8;
	Sat,  9 Apr 2022 16:57:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF2471BF59C
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 16:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D8E160ACE
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 16:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yh4Vzxs6ggW for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 16:57:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5B7C60812
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 16:57:40 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bh17so22953896ejb.8
 for <buildroot@buildroot.org>; Sat, 09 Apr 2022 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yNNYDBio9J0yYvd9U/xLbmtISuj5kUVE1nl5gGb+jY4=;
 b=M+lqS9AruQjaF4ghoU/tp9ZFfxmhTNn5trML0ZHKRCgcHz/iOy0TmVvPn1ROLB+2WV
 q7vRbLVDtPJOwIGQ4zuHjtL/bOqd0ga/VuJaK1fV3DLPbgXxfY1dHxALKM2LYY+6zC1Y
 MlWwlCLzd6by/3pyeIAdYQZEMRj7CHfpkm6jHAe0uilOYUAh66rJ/3EDEWWBL16p8NcC
 nCE78gRVxpA3jqIKcfqinhZFg8ZwR2bf2BQDguMupVmmwP2rLSaVMVnJZfrMnB/D3vu2
 H/2RFfRYHyMvBPiH5O0X1yi52Dkk2uUkAycPaHO13BcIZIPzl6AH3QfZQev2IxdfuKIz
 eA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yNNYDBio9J0yYvd9U/xLbmtISuj5kUVE1nl5gGb+jY4=;
 b=LVM7ydJnSqe/7aUXtcIdW1ZF6QAruQjHPfReBEGv1Irto126R3I7JneURyd4aXSx33
 74Lfqm78z+cDzQw2TWP1dVaZ76Ldw4AVpo5MacqmEORafAsbatEC4HdULZZ1Fu6FSOMC
 mQ4gODpLZQk51elePbbbPoBZ5P8lLcLt2mn0pxJAL/EeRaVFYQWqKBvQqnxG+z05sQGJ
 xU+7bYoCP1IEZjVrMKpENskM/aAnJP0g/QBdMX9Z7Syoqb4XWKA6xL8NZj01RzEZTWko
 psxa+clt0OsRDxh+FXMJI/E9E+pwZz4GvPpvn3l6Akc/ovqn/Z+vrXuLhwN5Rn3wYZo1
 hHow==
X-Gm-Message-State: AOAM531DvMCslPECZS7qzQTS3YEgnDZzAywyXJ4XE0lsL7+vgQVP6DD0
 W2yoSVWhtUr98RD2dt7MPWdI/EeOhJOJyg==
X-Google-Smtp-Source: ABdhPJyyb77z/K4SMj4jN0F0f/DPysDhH62V950N5eUYVw3yQFeXFBjUdOlT0MXr0ff3XgIiXRko/A==
X-Received: by 2002:a17:906:c110:b0:6e0:dc2a:3393 with SMTP id
 do16-20020a170906c11000b006e0dc2a3393mr22965322ejc.512.1649523458885; 
 Sat, 09 Apr 2022 09:57:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a1709067c0c00b006e86db76851sm977767ejo.193.2022.04.09.09.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 09:57:38 -0700 (PDT)
Message-ID: <36f3e482-dce6-db0d-08e0-b062f16ca69e@mind.be>
Date: Sat, 9 Apr 2022 18:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220405115040.3779242-1-james.hilliard1@gmail.com>
 <4a9f7aa1-82e4-664e-7177-71596cb021e7@mind.be>
 <CADvTj4rHfM=3q0DXJ2U_AccCL7VYZyUtwQ3d215o9_ev6QUPEw@mail.gmail.com>
 <41d50cfd-3009-13d4-6f41-f0b2bdf3297f@mind.be>
 <CADvTj4p0bV2iotTKrOpo30YbWJntuyY-suqzqE3JTGU=gPqYKQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4p0bV2iotTKrOpo30YbWJntuyY-suqzqE3JTGU=gPqYKQ@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/04/2022 23:41, James Hilliard wrote:
> On Wed, Apr 6, 2022 at 8:12 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 05/04/2022 21:38, James Hilliard wrote:
>>> On Tue, Apr 5, 2022 at 11:23 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>
>>>>
>>>>
>>>> On 05/04/2022 13:50, James Hilliard wrote:
>>>>> Currently we only test a limited set of toolchains that are mostly
>>>>> prebuilt, add a flag to allow using randconfig for randomizing
>>>>> additional toolchain settings instead of randpackageconfig.
>>>>>
>>>>> To avoid invalid configs we need to add additional config validation
>>>>> filtering and fixups.
>>>>>
>>>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>>>> ---
>>>>> Changes v3 -> v4:
>>>>>      - use fixup_config instead of other retries to filter bad configs
>>>>
>>>>     Well, I don't like this. It means we have to duplicate the logic for checking
>>>> the bad configs in two places: in the mk file and in genrandconfig.
>>>
>>> Well it seems to work better since instead of regenerating it tries to
>>> fixup the config. I think this gives better statistical coverage of some
>>> config options.
>>
>>    It will create a bias towards the default option for the options you exclude.
>> See below.
> 
> Yes, I'm aware of that, however this improves coverage as certain options
> like enabling the kernel build result in a high percentage of invalid configs
> otherwise which creates a bias towards builds with the kernel build disabled
> entirely, at least by fixing up invalid kernel configs instead of
> triggering a full
> re-randomization we get more builds with kernels enabled as the invalid
> configs should no longer create a bias towards kernel builds being disabled
> for example. Having a bias towards the common defaults seems to be a net
> improvement here.

  Excellent point, indeed. I hadn't thought so far.

>>>>     If the problem is that you sometimes don't end up with a valid config even
>>>> after 100 iterations, then I think a better solution is to feed valid values for
>>>> the string options. That way, we still do a build test of e.g.
>>>> BR2_ROOTFS_SKELETON_CUSTOM.
>>>
>>> That looks a bit tricky, although we could probably add it for some cases
>>> that we want test coverage for.
>>>
>>>>
>>>>     [Others may disagree with me of course.]
>>>>
>>>>     Regards,
>>>>     Arnout
>>>>
>>>>
>>>>> Changes v2 -> v3:
>>>>>      - properly check exit codes
>>>>> Changes v1 -> v2:
>>>>>      - refactor fixup_config control flow
>>>>> ---
>>>>>     utils/genrandconfig | 215 ++++++++++++++++++++++++++++++++++++++++++--
>>>>>     1 file changed, 206 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/utils/genrandconfig b/utils/genrandconfig
>>>>> index 3483d55c14..59fe34e58d 100755
>>>>> --- a/utils/genrandconfig
>>>>> +++ b/utils/genrandconfig
>>>>> @@ -315,6 +315,192 @@ def fixup_config(sysinfo, configfile):
>>>>>             configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
>>>>>             configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
>>>>>
>>>>> +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
>>>>> +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
>>
>>    Here, the BR2_ROOTFS_SKELETON_CUSTOM_PATH check is basically redundant:
>> randconfig will never fill something in for the string, so it is always empty.
> 
> The fixup_config function is used for configs based on the toolchains csv's
> as well so this is necessary to prevent accidentally fixing up a valid
> BR2_ROOTFS_SKELETON_CUSTOM_PATH provided in a toolchain csv
> file.

  Oh, right, I didn't think of that either! At the moment the point is moot 
because randpackageconfig is used. Oh hang on, I'm wrong again, it actually 
*would* work specifically for ROOTFS_SKELETON_CUSTOM_PATH, if 
ROOTFS_SKELETON_CUSTOM is also set in the toolchain config. So I expressed it 
incorrectly in the commit message.

  Unfortunately, I already applied and pushed, so I can't fix the commit message 
any more...

  Anyway, thanks for the patch!

  I think the next steps are:

- move 'make dependencies' inside the loop (not strictly necessary but I think 
it woudl be an improvement);

- add the toolchain config *after* running randconfig, so we can use full 
randconfig even if toolchains-csv is set;

- add a mechanism to be able to specify additional defaults together with the 
toolchain config;

- add options to the toolchain configs to give default values for some string 
options.

  A mechanism is needed for adding defaults because currently we can only force 
options in the toolchain config - if it's removed by 'make olddefconfig', 
is_toolchain_usable will return false. But we also don't want to *always* build 
a kernel in a toolchain config - and this is particularly true for uboot and 
barebox, where there's no arch default config to fall back to, so even with 
randconfig they essentially will never be built.


  Regards,
  Arnout


> 
>>
>>>>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
>>>>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n')
>>
>>    Thus, the result is that if a config is generated with
>> BR2_ROOTFS_SKELETON_CUSTOM=y, it will be removed again and revert to its default.
>>
>>    In this case, there are just two choices so it doesn't make a difference. But
>> if there are more than two choices, removing one of them creates a bias towards
>> the default option. I wouldn't call this "better statistical coverage".
>> Statistically, taking a completely random sampling and then discarding samples
>> that are somehow not appropriate is considered "better" than fudging
>> inappropriate samples in a certain direction.
> 
> The main issue is that throwing out invalids creates a heavy bias towards
> disabling the configs dependencies entirely which is not desirable.
> 
> Having a bias towards kernel builds with default options is better than having
> a very strong bias towards the kernel not being built at all.
> 
>>
>>
>>    Regards,
>>    Arnout
>>
>>
>>
>>>>> +
>>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y\n')
>>>>> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""\n')
>>>>> +
>>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_DEFCONFIG=""\n' in configlines:
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_USE_DEFCONFIG=y\n')
>>>>> +        configlines.append('BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_DEFCONFIG=""\n')
>>>>> +
>>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_GIT=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_GIT=y\n')
>>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
>>>>> +
>>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_HG=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_HG=y\n')
>>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
>>>>> +
>>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_SVN=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n' in configlines:
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_SVN=y\n')
>>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_REPO_URL=""\n')
>>>>> +
>>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n')
>>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=""\n')
>>>>> +
>>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n' in configlines:
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION=y\n')
>>>>> +        configlines.append('BR2_LINUX_KERNEL_LATEST_VERSION=y\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=""\n')
>>>>> +
>>>>> +    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_DTS_SUPPORT=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines:
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_DTS_SUPPORT=y\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n')
>>>>> +        if 'BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n' in configlines:
>>>>> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_UIMAGE=y\n')
>>>>> +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
>>>>> +        if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
>>>>> +            configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
>>>>> +            configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
>>>>> +        if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
>>>>> +            configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
>>>>> +            configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
>>>>> +
>>>>> +    if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
>>>>> +       'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
>>>>> +        configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n')
>>>>> +
>>>>> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
>>>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
>>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n')
>>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE=""\n')
>>>>> +
>>>>> +    if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
>>>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n' in configlines and \
>>>>> +       'BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n' in configlines:
>>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS=y\n')
>>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG=y\n')
>>>>> +        configlines.remove('BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG=""\n')
>>>>> +
>>>>> +    if 'BR2_KERNEL_HEADERS_VERSION=y\n' in configlines and \
>>>>> +       'BR2_DEFAULT_KERNEL_VERSION=""\n' in configlines:
>>>>> +        configlines.remove('BR2_KERNEL_HEADERS_VERSION=y\n')
>>>>> +        configlines.remove('BR2_DEFAULT_KERNEL_VERSION=""\n')
>>>>> +
>>>>> +    if 'BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n' in configlines and \
>>>>> +       'BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n':
>>>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_GIT=y\n')
>>>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_REPO_URL=""\n')
>>>>> +
>>>>> +    if 'BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n' in configlines and \
>>>>> +       'BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
>>>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
>>>>> +        configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
>>>>> +
>>>>> +    if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
>>>>> +       'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
>>>>> +        configlines.remove('BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n')
>>>>> +
>>>>> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
>>>>> +       'BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>>>> +       'BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
>>>>> +        configlines.remove('BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG=y\n')
>>>>> +        configlines.remove('BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE=""\n')
>>>>> +
>>>>> +    if 'BR2_TARGET_BAREBOX=y\n' in configlines and \
>>>>> +       'BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n' in configlines and \
>>>>> +       'BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TARGET_BAREBOX=y\n')
>>>>> +        configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
>>>>> +        configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
>>>>> +
>>>>> +    if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
>>>>> +       'BR2_TARGET_OPTEE_OS_PLATFORM=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
>>>>> +        configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
>>>>> +
>>>>> +    if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
>>>>> +       'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
>>>>> +        configlines.remove('BR2_TARGET_S500_BOOTLOADER_BOARD=""\n')
>>>>> +
>>>>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
>>>>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
>>>>> +       'BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>>>> +       'BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
>>>>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
>>>>> +        configlines.remove('BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n')
>>>>> +        configlines.remove('BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE=""\n')
>>>>> +
>>>>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
>>>>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
>>>>> +       'BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n' in configlines and \
>>>>> +       'BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
>>>>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n')
>>>>> +        configlines.remove('BR2_TARGET_UBOOT_USE_DEFCONFIG=y\n')
>>>>> +        configlines.remove('BR2_TARGET_UBOOT_BOARD_DEFCONFIG=""\n')
>>>>> +
>>>>> +    if 'BR2_TARGET_UBOOT=y\n' in configlines and \
>>>>> +       'BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n' in configlines and \
>>>>> +       'BR2_TARGET_UBOOT_BOARDNAME=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TARGET_UBOOT=y\n')
>>>>> +        configlines.remove('BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y\n')
>>>>> +        configlines.remove('BR2_TARGET_UBOOT_BOARDNAME=""\n')
>>>>> +
>>>>> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
>>>>> +       'BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n' in configlines and \
>>>>> +       'BR2_TOOLCHAIN_EXTERNAL_PATH=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
>>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y\n')
>>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_PATH=""\n')
>>>>> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
>>>>> +            return False
>>>>> +
>>>>> +    if 'BR2_TOOLCHAIN_EXTERNAL=y\n' in configlines and \
>>>>> +       'BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n' in configlines and \
>>>>> +       'BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n' in configlines and \
>>>>> +       'BR2_TOOLCHAIN_EXTERNAL_URL=""\n' in configlines:
>>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL=y\n')
>>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y\n')
>>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y\n')
>>>>> +        configlines.remove('BR2_TOOLCHAIN_EXTERNAL_URL=""\n')
>>>>> +        if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
>>>>> +            return False
>>>>> +
>>>>> +    if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
>>>>> +       'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
>>>>> +       'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
>>>>> +        configlines.remove('BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n')
>>>>> +        configlines.append('BR2_PACKAGE_XVISOR_USE_DEFCONFIG=y\n')
>>>>> +        configlines.remove('BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n')
>>>>> +
>>>>>         with open(configfile, "w+") as configf:
>>>>>             configf.writelines(configlines)
>>>>>
>>>>> @@ -331,11 +517,14 @@ def gen_config(args):
>>>>>
>>>>>         sysinfo = SystemInfo()
>>>>>
>>>>> -    # Select a random toolchain configuration
>>>>> -    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
>>>>> +    if args.toolchains_csv:
>>>>> +        # Select a random toolchain configuration
>>>>> +        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
>>>>>
>>>>> -    i = randint(0, len(configs) - 1)
>>>>> -    toolchainconfig = configs[i]
>>>>> +        i = randint(0, len(configs) - 1)
>>>>> +        toolchainconfig = configs[i]
>>>>> +    else:
>>>>> +        toolchainconfig = []
>>>>>
>>>>>         configlines = list(toolchainconfig)
>>>>>
>>>>> @@ -409,7 +598,7 @@ def gen_config(args):
>>>>>             bounded_loop -= 1
>>>>>             subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>>>>>                                    "KCONFIG_PROBABILITY=%d" % randint(1, 20),
>>>>> -                               "randpackageconfig"])
>>>>> +                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
>>>>>
>>>>>             if fixup_config(sysinfo, configfile):
>>>>>                 break
>>>>> @@ -433,10 +622,18 @@ if __name__ == '__main__':
>>>>>         parser.add_argument("--buildrootdir", "-b",
>>>>>                             help="Buildroot directory (relative to current directory)",
>>>>>                             type=str, default='.')
>>>>> -    parser.add_argument("--toolchains-csv",
>>>>> -                        help="Path of the toolchain configuration file",
>>>>> -                        type=str,
>>>>> -                        default="support/config-fragments/autobuild/toolchain-configs.csv")
>>>>> +
>>>>> +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
>>>>> +    toolchains_csv.add_argument("--toolchains-csv",
>>>>> +                                dest="toolchains_csv",
>>>>> +                                help="Path of the toolchain configuration file",
>>>>> +                                type=str)
>>>>> +    toolchains_csv.add_argument("--no-toolchains-csv",
>>>>> +                                dest="toolchains_csv",
>>>>> +                                help="Generate random toolchain configuration",
>>>>> +                                action='store_false')
>>>>> +    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
>>>>> +
>>>>>         args = parser.parse_args()
>>>>>
>>>>>         # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
