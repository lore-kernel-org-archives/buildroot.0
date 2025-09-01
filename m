Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA799CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA27A41414;
	Mon,  1 Sep 2025 09:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjjqQZMB9Yv6; Mon,  1 Sep 2025 09:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C4E4141F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C4E4141F;
	Mon,  1 Sep 2025 09:14:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA29CD2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFAB940488
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fG1YrIpynQiA for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 09:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D17DE4044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D17DE4044B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D17DE4044B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5AB1B97847B; Mon,  1 Sep 2025 08:07:48 +0200 (CEST)
Message-ID: <8a8a20c2-c68a-48c5-afe9-48bfec0102b8@rnout.be>
Date: Mon, 1 Sep 2025 08:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Hitz <christian@klarinett.li>, buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
References: <20250818064235.258181-1-christian@klarinett.li>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250818064235.258181-1-christian@klarinett.li>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756706869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=A+p8TwVZ72vS7GCacywilAbrZ7Yb1QTGAM7nTr/Cb4Y=;
 b=CHiIcCu1zxr+Ozl7NxmCGM0Z3+Mc5Nn6SA+XRvjIeZ2Cw6iNFvizMU5WdJA0Qi8nwlHlJ2
 PQ5zlO4HZfcb6LY5YlBTeCPAzLgrRs32QnS6A8T9/pn/1uBVCeTcwf1rzSfR79okORfQYr
 SzJAludx4RTUxsvcr43sO9HgllGp9X7y+8r9EDLmoacDi5z7RLjzsTC2wc3g9WBfAco3TL
 2NdZGCU9sexDAMBTNUDMYHfP5qcnlxsZu0lZtl9sZa6PbK/jBV1c4+NmM61EkBQ6jePwxa
 cw/vIQ1VGrnWJoy3AaJjAl/7B6Avuz/a0vmFJUB5sajk7CiWqrtgPOAkQANj7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=CHiIcCu1
Subject: Re: [Buildroot] [PATCH 2020.02.x] package/systemd: bump required
 toolchain headers for systemd-networkd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/08/2025 08:42, Christian Hitz via buildroot wrote:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Since 256.12 systemd-networkd requires kernel >=5.4 due to the inclusion of
> the sockios.h header, which uses the SIOCGSTAMP_OLD macro.
> 
> The same change has already been applied to master/2025.08 in
> 7d8d48cd2ba1396ea146e94020939f4dfe08c5cb
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/systemd/Config.in | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 851b91aeba..320d416203 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -52,9 +52,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
>   	  an elaborate transactional dependency-based service control
>   	  logic.  It can work as a drop-in replacement for sysvinit.
>   
> -	  Kernel versions below 4.15 ("recommended baseline") have
> +	  Kernel versions below 5.4 ("recommended baseline") have
>   	  significant gaps in functionality and are not recommended
> -	  for use with this version of systemd.
> +	  for use with this version of systemd. (e.g. lack race-free
> +	  process tracking by pidfd, systemd-networkd, and new mount
> +	  API support).
>   
>   	  Systemd requires a Linux kernel >= 3.15 with the following
>   	  options enabled:
> @@ -354,7 +356,8 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
>   
>   config BR2_PACKAGE_SYSTEMD_NETWORKD
>   	bool "enable network manager"
> -	default y
> +	default y if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>   	help
>   	  systemd-networkd is a system service that manages networks.
>   	  It detects and configures network devices as they appear, as
> @@ -365,6 +368,9 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
>   
>   	  https://www.freedesktop.org/software/systemd/man/systemd-networkd.html
>   
> +comment "systemd-networkd needs a toolchain with kernel headers >= 5.4"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +
>   config BR2_PACKAGE_SYSTEMD_OOMD
>   	bool "enable out-of-memory killer"
>   	help

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
