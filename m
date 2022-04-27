Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC413C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA3D60FB4;
	Wed, 27 Apr 2022 18:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCSnXlPQn-EV; Wed, 27 Apr 2022 18:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DFAE60ECF;
	Wed, 27 Apr 2022 18:53:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 360CA1BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 240D860ECF
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMnau7LgRnJq for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:53:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8402560EA4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:53:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id y3so5162493ejo.12
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VkBx39aYNwykip2g2B3MZbh+2RuELRzcHLOtGRFbvs4=;
 b=FLI03CDGjWdCLVh/Nn4GMrzmiE10cdR1ARmceDa2V6O5c6oIZUZJtSayWabvBnmDUa
 tack5V6x1ZyPHOt+BdeqMYbXPDlAG4vRVXMW0A+YIGX+vbOCsQYPSxgrO3/bvnDFEIlo
 dvmAwNPQcSW2Cg440V4DlTptCm4hZJWJdD9cyievXW6NZ35v3+1vNHuIWyWgeO+Ix4Hl
 5czVScfSvpZ+dlc2Nnza5vxlrIyaW3fHPYa9YZYSwdmEpKXxoMtYRkk7AK2O3pHP0Zn8
 ux+C0MLMMXpCemdoPSoh6xJkDPKt+OauK571dmHwd5uh46OkORS4SgMtWnxPifY1IaS7
 KVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VkBx39aYNwykip2g2B3MZbh+2RuELRzcHLOtGRFbvs4=;
 b=zMK3mmxPv4mxn3e7laR7CdomJ1nx3kLMof8wfgp9yQz0O7wjh596eNYE/+diTq3d+r
 d5bFIedmduHLfXBgChV8Db2QzlQul2+ZprPw4cvfniwd+B2x+p8S4YSppoIIf2Mw9BO1
 StESrkzBSAzrqNJVXgR7lrbISwD6/1myMJdo3WKt980aPnmsIus2y+0yKZCV6xLevtwt
 m30VcsCp73YEu2GboQKJbbL4RQ9BAXWAYvTDi2qSOMZta+cbix7dAPGC95VWDxphJCW8
 8s+Wb3Glw6mqbkVflqjG6zc2/1f7p6ulGbiKr6tdj1YXUdZYpo23GK3kLD9ElyNzuH8p
 m4bA==
X-Gm-Message-State: AOAM5314+Rnfl1GJbS78oClobAgsdN5eVRr2ZVlwMpcyb7sLgF/un9Hu
 1zjF4UOmpPzuZXazM/ZUsWE9gLWYgN+S7Q==
X-Google-Smtp-Source: ABdhPJxvIFxSD8YRRtrFwjFfscN+y+S2U1y3C/kCOKMhuY9V0B47mutViMsmoxeGe+2zl8SBpP1a5g==
X-Received: by 2002:a17:907:100e:b0:6f3:8efd:107b with SMTP id
 ox14-20020a170907100e00b006f38efd107bmr17163223ejb.745.1651085588529; 
 Wed, 27 Apr 2022 11:53:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ah14-20020a1709069ace00b006f38e912d3dsm4981151ejc.99.2022.04.27.11.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 11:53:07 -0700 (PDT)
Message-ID: <c8d1f9c7-a1bb-9da4-c84d-70cdc5f3c949@mind.be>
Date: Wed, 27 Apr 2022 20:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20220425190506.543507-1-b.bilas@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425190506.543507-1-b.bilas@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] boot/barebox: bump version to 2022.04.0
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



On 25/04/2022 21:05, Bartosz Bilas wrote:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/barebox/Config.in    | 4 ++--
>   boot/barebox/barebox.hash | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index c16fea3cea..726f0f980b 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -12,7 +12,7 @@ choice
>   	  Select the specific Barebox version you want to use
>   
>   config BR2_TARGET_BAREBOX_LATEST_VERSION
> -	bool "2022.01.0"
> +	bool "2022.04.0"
>   
>   config BR2_TARGET_BAREBOX_CUSTOM_VERSION
>   	bool "Custom version"
> @@ -40,7 +40,7 @@ endif
>   
>   config BR2_TARGET_BAREBOX_VERSION
>   	string
> -	default "2022.01.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
> +	default "2022.04.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
>   	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
>   	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
>   	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
> diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
> index 3d52d40beb..3a92f7fd82 100644
> --- a/boot/barebox/barebox.hash
> +++ b/boot/barebox/barebox.hash
> @@ -1,8 +1,8 @@
>   # From https://www.barebox.org/download/barebox-2021.12.0.tar.bz2.md5
> -md5  753ba533ced54f4113f9e97846c13fc1  barebox-2022.01.0.tar.bz2
> +md5  e4970687cf7943eadf71b1ae6d344ff7  barebox-2022.04.0.tar.bz2
>   
>   # Locally calculated
> -sha256  ddf7898075bec05e4865ce0f7a2ac19c2b1efaaa0d066eba1939494e25711d28  barebox-2022.01.0.tar.bz2
> +sha256  f751b506deb0a5d82682a85cf65e329dd562e48ea057533dc5c8876120a09ebc  barebox-2022.04.0.tar.bz2
>   
>   # License files, locally computed
>   sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
