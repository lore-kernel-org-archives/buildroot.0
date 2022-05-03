Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AA5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B093340B47;
	Tue,  3 May 2022 20:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrDvtp3WLt0V; Tue,  3 May 2022 20:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C84ED40B37;
	Tue,  3 May 2022 20:28:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F5DD1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C46A60F2D
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JulyBCdb-kt6 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:28:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96AFE60F2E
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:28:05 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id k27so21127574edk.4
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=37sgllwRM5MUOC/AQcRw3xN+1GW5F+WMHpLnQ9DsdYk=;
 b=V1LZqJywkHdnaKGdkfotvg01Tn10TvmrbHplVgwIMMErk6Gs8U2IUgfIapXkc7lQsI
 JsXqcuMesZORkRf2WfwDe2rxOhYuRyGRPSTEr6mFugeV89VUgBl7v+H48ueY1AwZtXvb
 sKqtOnhKS08DDS8nTdp5jKF13btd6SJp6NmVGhDRbGNv9yPI7Ep6CW1UlF3d0+0n7tn0
 hT8lBiT4myMnH6sweKHlgAuvTK0KbWmmTxURowbTnf4HfDmJXPSe9LFKJ0E0TP9+abv6
 ge8KWvE9LVMGpwygySXT4T+lLK1+TNSTu5SnZa2o+siIZ2qbOTa5Bvb/LtijloFqKzT/
 SWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=37sgllwRM5MUOC/AQcRw3xN+1GW5F+WMHpLnQ9DsdYk=;
 b=kudIg3LapogB6VQ5no0BRVqYx5LZS+6xME7AdibUq86ahyIq5PCq4bBJJPDK9HxoKY
 U3DhPfCf2AjTU81leLVubyLVTwB9Z0GDJxOrkdUlUTG2xyb428MXL6jN/+O8FygYGiwp
 aq5JoTdN0XesHhpETbicMXGqn+73t/rDCbMYbNbjVZdhUOx+KoTPVpwdUqXbest4UkCC
 mJR1vHQYH0ksYG8LASItRwy50xf64AwwtZEddFLc7ofS74lZupAEZymTttq6F/Qg4zA8
 DUUoRoSZILy+5slBWVq9QGdeivLNTPaCLjOb0JxsHgxWEl1z9akyW6FUqh5cSq7zjJed
 FfcA==
X-Gm-Message-State: AOAM533kry6nQ83vf56/tKYQ9u38W96VOKS7GmLXmkBhi1OMEyoDOIkS
 iOSXKC1yZOQMl2G/8uwzTAV/2Q==
X-Google-Smtp-Source: ABdhPJynwc6dQ3uezMYlY1E1j2FxZMfjFe60apZmIvT4lsL5i/TM2Gru+8wgDG37+zgLUwNjomJ1TQ==
X-Received: by 2002:a05:6402:26d3:b0:427:c571:86fe with SMTP id
 x19-20020a05640226d300b00427c57186femr12186788edd.133.1651609683709; 
 Tue, 03 May 2022 13:28:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 rb48-20020a170907693000b006f3ef214e11sm5017992ejc.119.2022.05.03.13.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:28:03 -0700 (PDT)
Message-ID: <8fcec20b-cc98-91c8-5031-db37c03dd19d@mind.be>
Date: Tue, 3 May 2022 22:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220503015039.3354269-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220503015039.3354269-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: only fixup host
 uboot tools source when empty
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



On 03/05/2022 03:50, James Hilliard wrote:
> If the kconfig values being replaced are not empty we should not
> try to fix them.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/genrandconfig | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 70af84f002..cdd781c6c2 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -298,7 +298,9 @@ def fixup_config(sysinfo, configfile):
>          'BR2_PACKAGE_FLANN=y\n' in configlines:
>           return False
>   
> -    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines:
> +    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines and \
> +       'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=""\n' in configlines and \
> +       'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE=""\n' in configlines:
>           bootenv = os.path.join(args.outputdir, "boot_env.txt")
>           with open(bootenv, "w+") as bootenvf:
>               bootenvf.write("prop=value")
> @@ -307,7 +309,8 @@ def fixup_config(sysinfo, configfile):
>           configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE=""\n')
>           configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x1000"\n')
>   
> -    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y\n' in configlines:
> +    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y\n' in configlines and \
> +       'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n' in configlines:
>           bootscr = os.path.join(args.outputdir, "boot_script.txt")
>           with open(bootscr, "w+") as bootscrf:
>               bootscrf.write("prop=value")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
