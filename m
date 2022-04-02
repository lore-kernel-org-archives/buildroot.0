Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ADEC433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 16:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 410FC60BB2;
	Sat,  2 Apr 2022 16:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ws6aBwgr19p; Sat,  2 Apr 2022 16:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D37E60B6E;
	Sat,  2 Apr 2022 16:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79DF31BF3F0
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 16:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67FDF41750
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 16:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6tz4-t7oKOFd for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 16:29:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 413E14173B
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 16:29:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a6so830676ejk.0
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=qiMJACK1Fe9huCYNLMPh58eHFNiuQtY1qHwdWndLO3c=;
 b=DVEYiiQEz4Qjyz3FIlw/TC0UxTMbAAR5nfS1IXOmQCagpN4wo1c8XrNQPq3cIW/Yd7
 GL8R3Cc5FlromY9QWKu3jRYF9XX/08KODGlgREaEfIlYtJ8/e70AAHXs5Rtso/hjGFLC
 Qq4Bhh7RxjoyRlNTUdu87KgjPV8kGivgF9eZbx4aFbNlL7BrreOz+VvIeVZpuQd2YpLx
 d/BAEicKcnOX77ZKAK5wsFeoCb5/VWkTbs84amK8GBnYa5ON1cyzb2rajqldn4AUfFG6
 jG+ex43MX7CRtYi1LJ5bh412yGSL8MRavLLCVcFIbLtzf//ZCFLsPpCurYcuy38JN1Xm
 2DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qiMJACK1Fe9huCYNLMPh58eHFNiuQtY1qHwdWndLO3c=;
 b=05Vf24ut59AXaJHWQWLi9R28237WUbgzU70FfBuroNQUiVOTsxYbUv4TfCKMHENbKw
 gd/hgEpwrwXJinTvKg4FWlKIt8wqudCsC9rGVMc9bs0MI7G1PEcAj4QJ2n+0aX7Km6Lt
 vD3b6n7j9JNQzk8cizSwxgViYPiPS8TLssMtHxK9LPAqnjSRbuZrlI3Pznfnz5e7phxE
 r4bx3O5lLEXZZbQUvGJpQHaDsTvr7p5S92qXBrcJ2roOefe5PCHPrYj2j9KzOKtRrTop
 6tLHNiC7ytDSQqrtByl8PMOgN7xijNUgO73rxYtR23JMwg1t6XiCuRK3mrovnCUGiwYR
 QmkQ==
X-Gm-Message-State: AOAM5301CHHtalBq6NYJ/hRtrNNOMk1PkzI8sUePnMWnv9Sd7nioaaN7
 mjIZfCpIj6TAIOfZnof7hUYHxg==
X-Google-Smtp-Source: ABdhPJwNVQKxEjUXzIsWxqSNJoib6b9RYIkyK6qZixTpYr5Zd7MUenfi8M+mo9ygaPske3z4lMLfyA==
X-Received: by 2002:a17:906:4ad0:b0:6e0:12aa:a911 with SMTP id
 u16-20020a1709064ad000b006e012aaa911mr4418692ejt.455.1648916982126; 
 Sat, 02 Apr 2022 09:29:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 jt8-20020a170906ca0800b006df9b29eaf1sm2272068ejb.8.2022.04.02.09.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 09:29:41 -0700 (PDT)
Message-ID: <34c73050-b148-7887-63ec-56f1e90c854e@mind.be>
Date: Sat, 2 Apr 2022 18:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220402010559.410834-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402010559.410834-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add randconfig
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

  Hi James,

On 02/04/2022 03:05, James Hilliard wrote:
> Currently we only test a limited set of toolchains that are mostly
> prebuilt, add a flag to allow using randconfig for randomizing
> additional toolchain settings instead of randpackageconfig.

  Oooh, it's been on my wishlist for a loooong time to use randconfig instead of 
randpackageconfig in the autobuilders...

> 
> To avoid invalid configs we need to add additional config validation
> filtering and fixups.

  I guess the following 4 patches are supposed to do that? Please keep them 
together in a series in the future.

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   utils/genrandconfig | 52 ++++++++++++++++++++++++++++++---------------
>   1 file changed, 35 insertions(+), 17 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 3483d55c14..1e72e14461 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -315,6 +315,10 @@ def fixup_config(sysinfo, configfile):
>           configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
>           configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
>   
> +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
> +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')

  I don't understand why for this particular one you remove it explicitly, while 
for other cases you rely (I guess) on the dependency check to make sure we get a 
valid config (eventually).

  Also, I think the proper approach for dealing with required string options is 
to give them a default value in support/config-fragments/minimal.config. Unlike 
the toolchainfile, the configlines in minimal.config don't all need to be 
present in the final .config, so we can add stuff there that is only available 
if the appropriate boolean option gets selected randomly.

> +
>       with open(configfile, "w+") as configf:
>           configf.writelines(configlines)
>   
> @@ -331,11 +335,14 @@ def gen_config(args):
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

  Wow, you lost me here. The commit message says "for randomizing *additional* 
toolchain settings", so I assumed that it would still use a toolchainfile but 
allow randomizing other options.

  And I don't see a problem with that. We just have to first run randconfig, and 
apply the toolchain config after that.

  And I think we can do that unconditionally, even. It would require a little 
bit of testing (basically iterating over all the toolchain configs and checking 
that a valid config can still be generated for each of them) but can be deployed 
pretty much as is I think.

  I agree though that it's more work to do that than the current patch, so 
perhaps this is a good first step.

>   
>       configlines = list(toolchainconfig)
>   
> @@ -409,19 +416,22 @@ def gen_config(args):
>           bounded_loop -= 1
>           subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>                                  "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> -                               "randpackageconfig"])
> +                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
>   
>           if fixup_config(sysinfo, configfile):

  I think the control flow is easier to follow if we change this into

           if not fixup_config:
               continue

> -            break
> -
> -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                           "olddefconfig"])
> +            if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> +                                      "olddefconfig"]):
> +                continue
>   
> -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                           "savedefconfig"])
> +            if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> +                                      "savedefconfig"]):

  This one should simply never fail, so it should move outside of the loop, 
after checking dependencies.


  Regards,
  Arnout


> +                continue
>   
> -    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                            "dependencies"])
> +            if subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> +                                "dependencies"]):
> +                continue
> +            break
> +    return 0
>   
>   
>   if __name__ == '__main__':
> @@ -433,10 +443,18 @@ if __name__ == '__main__':
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
