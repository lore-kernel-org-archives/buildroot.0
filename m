Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B2C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 365CF60AD2;
	Thu,  3 Feb 2022 20:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5cqX4wbe9Ppg; Thu,  3 Feb 2022 20:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65F4F60A72;
	Thu,  3 Feb 2022 20:43:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A46F1BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68DDE60A72
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hb7gIEZXCDa0 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:43:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A907960A6F
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:43:16 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id j23so8546357edp.5
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 12:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ZoyMUPUqu8x+hvktzaCe4ypMdknph2Xhkq/nn35G4Vc=;
 b=Qzm5EqTXlAWa9qAIVn00PbF0Nh4D0e7Ojewz+rdm74O1JN5XwgGehoVTyivIKsw/7C
 DxAouoECKLFb0jCO26Mq6ctpXxMknj0LcAM6ASteDNP7cnFszGDe1KPm/DifoOPrQJAx
 PN9O7jC3ubimpbwNWwmCC8dEg3WfHgkhqxgX95xtOWJ9EEvCchpDcyGd4k8knY12e28l
 h4vYY7ygqo0V8VVY+AQA9q0rs5e4CSG6ubjOShaAmttE7zs6pj3dFS54z3dxAdS9lAaW
 J88plwdlXeuHdsQOKlk4jgkjrGHa/mJOENdD9xPddHJnjBh8xnndrzrCQnbq94On15Uz
 Zv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZoyMUPUqu8x+hvktzaCe4ypMdknph2Xhkq/nn35G4Vc=;
 b=kIetUPxUiZO4bgG+K2vTSgW+LpVt1Qsn4L3oLrDI1/458+N72ouq4IKIZ64Iw8NC9U
 r+cXONgpwX6DbUubHg8IHL6aznIx1tqLzYf72IJASods3NjrREjuZr2J0ZhFy07WDEJP
 jvmPsEz8QUlN/xl0VEkmp4QZ6OlJxcaUWgybRg4HlenYcdJxc895ToxLil9Q2X5Goeun
 /GYFc65VduQFRK9d4t565DqIg7Uf0JKH/TBVnyPDHQFDD81weUuarsuldpGyQ9BeloJq
 tsyWHOMzxyniM1Y95AzHhYwwR9iWWopi45v6UI9I/vFRVDprqQ1+R3pSsoYFmvjEm8tw
 EaVw==
X-Gm-Message-State: AOAM530p/tAVGBBZs73dP05eDx0qK2H+KaUy1i317zPgG8+w3D4xgOtV
 wjkrOnN+b0n4mdOdps5QNhRh8Lh3jhe13A==
X-Google-Smtp-Source: ABdhPJxaKGB2+wWlyx3g5q6yeGaKEupD+s1vKsY0NlOrdVca6tQ1I7ogJqaVi+7WBu2fzFsKlaKDyQ==
X-Received: by 2002:a50:d0c4:: with SMTP id g4mr37405084edf.278.1643920994911; 
 Thu, 03 Feb 2022 12:43:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f19sm17916325edu.22.2022.02.03.12.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 12:43:14 -0800 (PST)
Message-ID: <e32270a8-d21e-0973-769e-0c9180544dfe@mind.be>
Date: Thu, 3 Feb 2022 21:43:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 buildroot@buildroot.org
References: <20220114093049.2380117-1-michael.opdenacker@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220114093049.2380117-1-michael.opdenacker@bootlin.com>
Subject: Re: [Buildroot] [PATCH] linux: clarify
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH description
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



On 14/01/2022 10:30, Michael Opdenacker wrote:
> This clarifies that custom DTSI files can be passed too,
> and that the files are compiled after being copied to the
> Linux kernel source tree.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   linux/Config.in | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 582f37ba7c..048a7fbfd0 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -411,9 +411,10 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
>   config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>   	string "Out-of-tree Device Tree Source file paths"
>   	help
> -	  Path to the out-of-tree device tree source files.
> -	  You can provide a list of dts paths to copy and
> -	  build, separated by spaces.
> +	  Paths to out-of-tree Device Tree Source (.dts)
> +	  and Device Tree Source Include (.dtsi) files,
> +	  separated by spaces. These files will be copied
> +	  to the kernel sources and compiled from there.

  I rewrapped this at 72 columns, and added "... and dts files are compiled from 
here" to clarify that the dtsi are just copied.

  Applied to master, thanks.

  Regards,
  Arnout

>   
>   config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
>   	bool "Keep the directory name of the Device Tree"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
