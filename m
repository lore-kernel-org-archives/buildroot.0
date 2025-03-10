Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E8CC282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 21:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A3260B7B;
	Mon, 10 Mar 2025 21:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRrhz9IRuGJq; Mon, 10 Mar 2025 21:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 955A160B7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955A160B7D;
	Mon, 10 Mar 2025 21:32:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ACEAAF7
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 21:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A7DC60B7D
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 21:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ob4RzNNyW10t for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 21:32:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E08760B7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E08760B7B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E08760B7B
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 21:32:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4F4C813F879;
 Mon, 10 Mar 2025 22:32:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Mar 2025 22:32:26 +0100
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 22:32:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250310014715.2815990-1-dungeonlords789@naver.com>
References: <20250310014715.2815990-1-dungeonlords789@naver.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <0274a011087a6c9d6883fd9bea418f2d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741642349;
 bh=CGXlMEub2410rpVdrigZyzB3pPi4HYpunyBNQF+ol4E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sur26dFTe42P1Hog4eDgIXgufHOy8ElzBYmWy4w8jcW+U/aN6TckBJrRdLWZowT5y
 vtotwzwJZ7jD36c93ZZJd7d+u6ua+iTdMYnla7wVeABA9iZ4q3KXr19Mc9+jtr/b86
 X+7ZxoKrBZTYVGhV/Y+cmtJhH5V92Y8fhWo4tx67+1+pibCdlh9BN0wZXpUkprZpOu
 rPCNx/MIRqamxZhOUlW/sVGGCTPAfCP12vlETg192OejD5SQlpFNUVk8P2JtbhnvDu
 +1s6FBLbYfWRkpj1gcJIPKbYE8PBpAo2qFQYRkMOxSEZNgv1kV3P8wRTgIhzs+FEx0
 HE9TdwxkkN8+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Sur26dFT
Subject: Re: [Buildroot] [PATCH] boot/grub2/readme.txt: typo
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/03/2025 02:47, Cherniaev Andrei wrote:
> ---
>  boot/grub2/readme.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
> index 90866e83a9..d0999ec390 100644
> --- a/boot/grub2/readme.txt
> +++ b/boot/grub2/readme.txt
> @@ -51,7 +51,7 @@ grub-bios-setup does but it works anyway.
>  To test your BIOS image in Qemu
>  -------------------------------
> 
> -qemu-system-{i386,x86-64} -hda disk.img
> +qemu-system-{i386,x86_64} -hda disk.img
> 
>  Notes on using Grub2 for x86/x86_64 EFI-based platforms
>  =======================================================
> @@ -93,7 +93,7 @@ To test your i386/x86-64 EFI image in Qemu
> 
>     [0] https://github.com/retrage/edk2-nightly
> 
> -2. qemu-system-{i386,x86-64} -bios <path-to-OVMF.fd> -hda disk.img
> +2. qemu-system-{i386,x86_64} -bios <path-to-OVMF.fd> -hda disk.img
> 
>  Notes on using Grub2 for ARM u-boot-based platforms
>  ===================================================
> --
> 2.43.0

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
