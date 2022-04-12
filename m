Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC33C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 384D683FA0;
	Tue, 12 Apr 2022 18:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hT_Nulox4Klp; Tue, 12 Apr 2022 18:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C1FB83F68;
	Tue, 12 Apr 2022 18:31:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 763161BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 744DC83F68
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eh3Pg9VI3wvu for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:31:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A4C282CCA
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 18:31:49 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id c64so11260754edf.11
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 11:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=IVemJwMOJ/VBghmxjxDzHpqp3GuG4IMi2lFy5SWh3Jk=;
 b=UvRbFnEH/gR0A8dZGu8YQqWiwQbdHqiTi88ieVPuoE2PG2Dr968AGjw3qShF1FetTb
 AoOJsTBG9p1SoMtiSVZ+D0vIkTqBJP7JJCsip54sxG+7Q6txZydABvPqdzrGrF2YLVoL
 ov5wlPj4qSnx148l2sSJgHkoKkHIDpTBP8bkWklivJU1iihnKi044LJY6SjMjiWV5N8s
 ZMcvxiW7pamB80PK4/QxvBAFaDqhGbUe0qIqH/zgIjQLXe7baMY95fZIfd2c20f99x5q
 vHSN8/ohki9P2h7dCHTzFt73dOBl6OASfJO4Nj5TwsntxzD+fN2KU6FDN9g9fFY6dLaB
 2Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IVemJwMOJ/VBghmxjxDzHpqp3GuG4IMi2lFy5SWh3Jk=;
 b=YZqy6+oIYi0C7pxqJp8hWqoaeO8CKIpdIwNoYh5OTdXBOQWUtMtSsmploQhTV30POv
 USDWb1ctcELSIDLKel+r1uaGzyzPGtzxqqtturCxtk4L8OD/wptIEIxWdoempd8TOaQ7
 uu9FM+E1z/0zeFrGqw1DAaAioHlfMeiIxtLPGfLBWfheWirKiL7sTnpX4Vq6vYbvVs1U
 Xb6uRMQcIXMsMe7t3GBnKU8DhvwevPg0+ZXRv6bdFbF7dQrKGfqEup0vBoc5ITj50RdA
 dVafkkCuITXurmElGbt8/CtK70N7LazXSyjZD9dGlkcM/aRBOym5xCaXVx6yFhLg9yv4
 xEcQ==
X-Gm-Message-State: AOAM533nF63sQGpk39hC9EzizSDL3v5qGX/Jq9QA9DUwZvuzdhkrggd1
 531IpXLwI4PkddNQb3hto6DwVQ==
X-Google-Smtp-Source: ABdhPJxnM2MPpLucaUWxeIgl6gnpCT4sNQ8Y0NiR97WR2My6zQM4B9HclkMpCsPDnraIPeKrIHSOMw==
X-Received: by 2002:aa7:d682:0:b0:419:3b78:e489 with SMTP id
 d2-20020aa7d682000000b004193b78e489mr40361871edr.372.1649788307869; 
 Tue, 12 Apr 2022 11:31:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a0564021e8700b0041d03a94f27sm105227edf.66.2022.04.12.11.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 11:31:47 -0700 (PDT)
Message-ID: <67711ace-1c16-238a-0297-fb236153f474@mind.be>
Date: Tue, 12 Apr 2022 20:31:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220406140535.2569899-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220406140535.2569899-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] configs/olimex_stmp157: bump kernel version
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



On 06/04/2022 16:05, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/olimex_stmp157_olinuxino_lime_defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
> index 74e7f9ba6..f9b31bbdc 100644
> --- a/configs/olimex_stmp157_olinuxino_lime_defconfig
> +++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
> @@ -16,8 +16,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_GIT=y
>   BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
> -# branch release-20210821-v5.10.60
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="081be4c4c634cf9345b8bf59fe141a0236383ae4"
> +# branch release-20220321-v5.10.105
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="82a1d20f488b895ffe817c5692a631237e257b7d"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
