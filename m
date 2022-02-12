Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E3A2410E8;
	Sat, 12 Feb 2022 13:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcbgjWBvVNZn; Sat, 12 Feb 2022 13:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6132410D3;
	Sat, 12 Feb 2022 13:07:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBE6D1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAA3D410CF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vn0RVyoLa-uS for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:06:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC079410CB
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:06:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p9so5245979ejd.6
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=T16H56/ZinD+ctE5sPmPYftGkpzFpR2YElMQz0fWxMc=;
 b=erbtqD+wIwHEr6JLSPFhG5wg8MLwUmoFvBe6tOMqbFsDCzKaZ0f2gCrhFBIIrLEww8
 d0mXriCpQxaq1pr68lh7EDtII5AD8WuNsjj2AsmnBcZT2Num5wRqE6X8pHaPhcnZlRZA
 O6Ph2gba1jiKJaQwCyTQkrw9nMosM2b2K+sIFSbDjmc9rsmLV6W7FY2tsRDVBWsmZr/Z
 6PFKUirrIe5ljtG9ZIz1gt3+UenHDMq+k4kYealQoOJ06GQYlEHC64JxnAEdhNMKqbDo
 IpcmtO2dW1hbCDPwSWkwVRzoazAxnbL4+7uECq12ODcBvAE7GjKENzF8Qj84bFTwldiG
 dUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=T16H56/ZinD+ctE5sPmPYftGkpzFpR2YElMQz0fWxMc=;
 b=LU+BGoEIq78AC4PkCj/SHo+KFAlbBucKoQ+jW24TviCtyfyUjcY4J4swlfp3mLw1br
 UdBH72opqd6dLlga+zG/II7S2vDLMWhozoAlO96/+uQlwCU1MLECnzw7K54+k+42G+19
 Syun70lnAztzvfiUBCS0oNC2uGWcIOM9CWsvQ2yNIyXUK8IrvW7RZAD3OhWil4gmsQ25
 gTlYwVXJpmgWbOhnfIqXp2xEQa3USpXZaqSMRyOPS7s+H1jispZ0zQPD2wHJCCaKMUjJ
 oInVXjT2RutGNQfIuWZKT5nnsnwrlKqMKGj2HyRtBD3R118Ijo5fiZ9bzUx9VXV49a01
 PEGA==
X-Gm-Message-State: AOAM5300TKITKJ5Lgcvgta8sCNjqGg0LnN0N8x4K9PYfRxog13PdH09K
 CywpmVSZE8UXIYGe8HTsQmyHEg==
X-Google-Smtp-Source: ABdhPJz8LfPzAIm9mMiDGeTCkKEqhrMych/jfgfI9w0OJM25DqHbtfXBlKPZNRKl9pf4d4UX4LVjqw==
X-Received: by 2002:a17:907:d04:: with SMTP id
 gn4mr4834490ejc.86.1644671214960; 
 Sat, 12 Feb 2022 05:06:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ck9sm6541893edb.61.2022.02.12.05.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:06:54 -0800 (PST)
Message-ID: <d0ff5ba2-5412-92af-47d2-db39fedc2997@mind.be>
Date: Sat, 12 Feb 2022 14:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220131024451.2580165-1-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131024451.2580165-1-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/thermald: update URL in the docs
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



On 31/01/2022 03:44, Ricardo Martincoski wrote:
> Old project homepage was removed, so switch to github, already in use to
> download the sources.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> This commit can be backported to maintenance branches
> ---
>   package/thermald/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/thermald/Config.in b/package/thermald/Config.in
> index 6d74a164b6..e5e15b9b8d 100644
> --- a/package/thermald/Config.in
> +++ b/package/thermald/Config.in
> @@ -20,7 +20,7 @@ config BR2_PACKAGE_THERMALD
>   	  reaches a certain threshold, the Linux daemon activates
>   	  various cooling methods to try to cool the system.
>   
> -	  https://01.org/linux-thermal-daemon
> +	  https://github.com/intel/thermal_daemon
>   
>   comment "thermald needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
>   	depends on BR2_i386 || BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
