Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE19C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 550A360AE3;
	Sat,  8 Jan 2022 15:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OlJH5ifrq9PC; Sat,  8 Jan 2022 15:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC4D60AA9;
	Sat,  8 Jan 2022 15:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECF221BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB4FA8138E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7p89UKxhq2SF for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E558B8149E
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 15:15:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r10so9520813wrc.3
 for <buildroot@busybox.net>; Sat, 08 Jan 2022 07:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=obcQ7EKQ4J5jgXrvzffbZV5K4pp9k1TXqy/9sO8Kmjk=;
 b=DD3LZPKTzW7cVTGtbsC3oL9egzsZC4u3p019XHloMivdALBy8sy7VPJQlIQX8FSSQY
 XkMCsQNZODAOgSoHEgT+/jpiqlrmx2XkwBPfdMohC4IUvbKbya30qdkugg35szKxf9SK
 vsOedCO+FlIHDZRf0FhXLw3cll5b71UFOeE1raoWLdyY/htKm1mzpmvm21/2Sg9PTy9M
 I6NsZMBMF0qSPJ60CCyg2Xe3+I3Wdsb7nI9mdAFZnae55Hywxzx2Ns97pTPvUn3WOif7
 1Oj/4Gq3g6AN9AsAQuBX1mR2RJLfHJXYgg1PyzZcQ0VtPxQIlqKa8QPp+xbb4d9/Q+GZ
 OT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=obcQ7EKQ4J5jgXrvzffbZV5K4pp9k1TXqy/9sO8Kmjk=;
 b=2R0WjsXjuwNefbtM2/6o43L3rvl8QiDbmen8llzl9zAj/qWLAR5WVu5uZ0JY/+8xCp
 6Ew33C6mc4dLBC6TPAEr4PRuq+NKr+OhjJ3lGtBEcfOsCxRAeczDtn0Sr3TrfymFwI8U
 vJamgsyp+SiJoVnz7Q7n47tXid1KFpDXSywbXEzBZQ8i+6DujFQ7We8CbcNXfzy75wyR
 VNq8fRL1PTlQmHuUJ0ytU4ctslw63favGWeyu0hV+BCvOifvXlXH/W9vAiFXb3MJDTqV
 dSmT9PhpeI48e3qMICYpn2TqwMx9DMos+WgMtkM7/NzoLVvrO8cssJgaAfNcMXzZDiu5
 F3+Q==
X-Gm-Message-State: AOAM533ZC0tsNnY+/vYR1FWgpsifWNIyBuFY+XuC9MvANVtHyy3P0rLm
 2ZL8Y6hpS2cUKQ+2nWDPiRN/rg==
X-Google-Smtp-Source: ABdhPJyROuBNjR6zgOHzPBV+ObzMiuWRVA31iz+bk2660xl+HITPNXHxzUW9LLyiz05lrOur1N6XgA==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr9044445wrc.262.1641654912277; 
 Sat, 08 Jan 2022 07:15:12 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l4sm1992970wry.85.2022.01.08.07.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:15:12 -0800 (PST)
Message-ID: <5f1bf6cc-7a01-327d-e91a-d0933924f1f2@mind.be>
Date: Sat, 8 Jan 2022 16:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220108141459.2972-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108141459.2972-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] configs/olimex_stmp157: bump U-Boot version
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



On 08/01/2022 15:14, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/olimex_stmp157_olinuxino_lime_defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
> index f54d899b3..74e7f9ba6 100644
> --- a/configs/olimex_stmp157_olinuxino_lime_defconfig
> +++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
> @@ -34,8 +34,8 @@ BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_GIT=y
>   BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
> -# release-20210821, based on 2021.04
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="acda542100fa83e4bc82634e4668f8106af37a61"
> +# release-20211130, based on 2021.04
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1c29714bc643c299e2ed4ba870be8d4538124144"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
