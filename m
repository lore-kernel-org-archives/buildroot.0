Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C75C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 19:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0973E40121;
	Mon, 22 Nov 2021 19:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtP5VMH9G32K; Mon, 22 Nov 2021 19:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E09A54013E;
	Mon, 22 Nov 2021 19:13:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E66741BF28E
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 19:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D332580F16
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 19:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fu8fDAayMGXN for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 19:13:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D1A880DE1
 for <buildroot@busybox.net>; Mon, 22 Nov 2021 19:13:03 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r25so44578209edq.7
 for <buildroot@busybox.net>; Mon, 22 Nov 2021 11:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DkQ6VzDPJl+gZlAQqJqFgizgCIDRmyKtb+G8tSU2hDs=;
 b=bUotGQN8LXHr67o1u+z6FmbhsaIcMY7tQGnoSxe/JBdZxCp8A9mKEsnV9VcVfNqEDv
 AuLdFPF80Tl8ELBA2UUX5omDJefrjVfY2a+HpRjQR/Yq3BlKrQ/Mh9ijkYqXegWPLM7M
 HWqyKzEOp91EB/LPnaaOB2ZqFf9B5vPxiiIXaUtKTFd640MfKQuXL/uzb8zCTZOVPTCl
 Ku9W4lrM1BFBBIwPc4EgdbmpldSx0gVXOG7zMIBiKAzyttCSXGsgfu4btFbrXk/TJKiT
 deWxroYLey1I5G+mCP63b0tjPji0fYk3Jm38kBSVHgmN5rVB69hREaliobS1hmVxSBFT
 t0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DkQ6VzDPJl+gZlAQqJqFgizgCIDRmyKtb+G8tSU2hDs=;
 b=cI5iSYaUufd+0fryEGYqrS14RE0nWDF0HsTVpBXvqg7bFRW8fokuN6H2b5piGJssch
 vDE7JkVal94eBnyUJ8E2yk8F0Ki+D3uW5VCZECj9IbNUaHJQs7J8lJlaFRdOW4kuLsMi
 gBBCO3tw1HZfENo9jHAYRPC644qIV5XFULWlpcWXXOQ8of6cBHLGvKXcUpHOfgeUsv/x
 sjWlLw6gkJFk6tdMuPIG2aZOl2ptuJvElIwHFvpfnCLtiYbMqKGJNkRaIikgg/QMHFfT
 NuCjY2dveJhRFYBIFh4ZiN2WbA7rIOtvCOkBP7uepPLhfwayYKcNWCHXODfJMQftnmnx
 36IA==
X-Gm-Message-State: AOAM531eSx3Wh+GKxx2IGyEYitTx4Xn3x1CochsLJkuko8Ea4QXoWLPo
 ORwNLxp5GHOibZ1trPamk0uNJQ==
X-Google-Smtp-Source: ABdhPJzrn9EoQgVfVCyY2PsZ5FTHxW2blP5lM8GAic2bLxuf/HNcsAuD9Gkvwigvipa+dcC2vrXXlQ==
X-Received: by 2002:a05:6402:4312:: with SMTP id
 m18mr67095024edc.273.1637608381359; 
 Mon, 22 Nov 2021 11:13:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g1sm4119239eje.105.2021.11.22.11.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 11:13:01 -0800 (PST)
Message-ID: <2d4b5386-ceee-43cd-774f-bc707d26a203@mind.be>
Date: Mon, 22 Nov 2021 20:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "buildroot@busybox.net" <buildroot@busybox.net>
References: <PH0PR12MB54010CCFB1F1B2A7C1090802A1999@PH0PR12MB5401.namprd12.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <PH0PR12MB54010CCFB1F1B2A7C1090802A1999@PH0PR12MB5401.namprd12.prod.outlook.com>
Subject: Re: [Buildroot] utils/genrandconfig discards all pre-defined
 BR2_PACKAGE_ packages
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
Cc: ARC Buildroot mailing list <arc-buildroot@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/11/2021 17:31, Alexey Brodkin wrote:
> Hello,
> 
> While playing with Buildroot autobuilder "nodes" I noticed one strange
> behavior: if I add "BR2_PACKAGE_xxx=yyy" in my architecture's config fragment
> (I mean those in "support/config-fragments/autobuild") most likely it won't
> appear in the resulting ".config". Well, unless it gets configured back by the
> random configuration selector. Which to me looks a bit incorrect.
> 
> First, why was I doing that: I wanted to fix a headers version with
> "BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_x_y=y". And to me it was
> not a package, but a property of the toolchain, so could be kinda legitimate
> use of the fragment (though you may argue for sure).
> 
> Then there's another observation to make that case a bit stronger if you will ;)
> We do append "support/config-fragments/minimal.config" to any given fragment
> with rationale of "disabling Buildroot options that are turned on by default,
> in order to arrive at minimal build time". And some of its entries are BR2_PACKAGE_xx:
>   - # BR2_PACKAGE_BUSYBOX is not set
>   - BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> 
> And those 2 will disappear in the end as well, while I guess we'd like them to be applied.

  I completely agree that we want them to be applied!


>  From what I may see it happens because of this part in the root Makefile:
> ---------------------------->8------------------------
> randpackageconfig ... : $(BUILD_DIR)/buildroot-config/conf outputmakefile
> 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
>   "utils/genrandconfig"
> ---------------------------->8------------------------
> and "make randpackageconfig" is being called from "utils/genrandconfig".
> 
> The first thing I though of was removal of that filtering together with
> the first ".config" expansion in the "utils/genrandconfig" with "make olddefconfig"

  Well, that kind of defeats the purpose of randpackageconfig (and especially 
allnopackageconfig). The idea of those targets is to take an existing config and 
do the rand/allno/allyes on only the package part.

  A better solution is to change genrandconfig itself.
- Create the partial config in a different file, e.g. .config.in.
- Run randconfig instead of randpackageconfig.
- Set KCONFIG_ALLCONFIG={builddir}.config.in in the environment.

  I think the KCONFIG_ALLCONFIG is the only real difference between randconfig 
and randpackageconfig.


> like that assuming that "olddefconfig" is being called in "randpackageconfig"
> target anyway:
> ---------------------------->8------------------------
> diff --git a/Makefile b/Makefile
> index f9cf0f4cb3..1ac33d9da3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1004,7 +1004,7 @@ randconfig allyesconfig alldefconfig allnoconfig: $(BUILD_DIR)/buildroot-config/
>          @$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
> 
>   randpackageconfig allyespackageconfig allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> -       @grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
> +       @cat $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
>          @$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
>                  KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
>                  $< --$(subst package,,$@) $(CONFIG_CONFIG_IN)
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 622cfd4891..5234a0726f 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -392,9 +392,6 @@ def gen_config(args):
>       with open(configfile, "w+") as configf:
>           configf.writelines(configlines)
> 
> -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                           "olddefconfig"])

  This change can be done independently, right?

  Regards,
  Arnout

> -
>       if not is_toolchain_usable(configfile, toolchainconfig):
>           return 2
> ---------------------------->8------------------------
> 
> But I'm not sure if that approach is correct in solving observed problem.
> 
> Any thoughts on this one?
> 
> -Alexey
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
