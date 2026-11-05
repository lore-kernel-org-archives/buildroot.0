Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C49606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IcRTbilf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B59608A4;
	Thu,  5 Nov 2026 23:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31sWwmk8sPNj; Thu,  5 Nov 2026 23:19:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 81F326088D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793920785;
	b=fmBY7QeU9zDQGKoZ3jOGLXVFG5jKOoG8bYO1e1RVhcCQGbUYvtT+BiqbO3BteG/MEWuc
	 +K6QloQPTmiirD9EMb2ZmzlWJVhZJwKNakuFU4YsgH5r/Fjbu33ZK1oKujLFfbcx/3ilD
	 JdmVPHrmDAdORt5V5eJavXNAUy19VtgcamM2b8EaZNxW+XH8PdqcmnCPnqvMg0vEv+r70
	 pgTh9+cXtQiQfFCir6+WXAkUTRTBxRiIU12rbX6cL8NjxoBDYqSBf+YAGPSPNPOJIVHzE
	 JoWXMxQdKJ55lH8OGQ+c/0oADjalzPiPztyHtgMTslKFkjdnDGp7tsIwaDgdNNVLFjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793920785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=C5Q88rVlOWAlrbb2HKnff6QnGs2ugSuJ/oQRrMakQ8M=;
	b=RWu2G11XEgsgqknLI7buUp0uJ2ef9kqFAxapnDVvxW3CIROzQRlRkm/AFRKjdOpNwAED
	 +Fzvm023lkl/Wt/u0A3p3V77l3BzTR1+jg+aZuoNQEtWgcUQfNwpM9kApPczWy6CArePN
	 vNoAJWVOtb1Sl592oo9LRt5Q2umqj2erDjcbaddj8U7LiYr+7W0/b4VZb5yEy/SWYrSr4
	 3Ub97GwIpGusX4q9uBanRVSc67wc1gC21xCdfq6lRACFixzfmFglP0/9e71AXQA1VkpJv
	 JfNt+mYW472wdm0llDBWopnrb9ScW7XI9l1GUQXTc00PsEy2cnFoecf2V+07quq+Nmg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793920785;
	bh=C5Q88rVlOWAlrbb2HKnff6QnGs2ugSuJ/oQRrMakQ8M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IcRTbilf5B4mHgLB6uM4qdvkE+pRX8Q1+K2cYmHmpgOorvNY411rg1YppidYc+t+K
	 NYYuhfBwgA+u3uzLkwGd5XJT2jlkv5x+KmAW7FrhaeXZI8qV4nueBOyWndFVXlbqvU
	 BMjMXVEdJzxF4cYi96xURg1fl/ZatQRyy9a++tcELt9J/C5fZELsgVee644QUUcelF
	 Iwke501dnoXV5KfxlY3Z+F0B5KEajkghKRPUzNefs7h30REkrrBHIpFCydjkP5wKXm
	 op5/DcUukQWA6krlHJrY6G0//Lr+7duKlznNVjz2zUz7CdfTRh7SeOhN9EoYS7VNAV
	 VKkYp+/Mm/cGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F326088D;
	Thu,  5 Nov 2026 23:19:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DBDA32A
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 328D3408E3
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44dmh8UzM7ac for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:19:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3862B408E6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3862B408E6
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:19:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 495F319F5A7;
 Fri,  6 Nov 2026 00:19:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 00:19:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 00:19:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261105211709.2111233-1-bernd@kuhls.net>
References: <20261105211709.2111233-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <0f7660a0ccb8424fa25b4286a2c4e1eb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-headers: drop 7.2.x option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 22:17, Bernd Kuhls wrote:
> The 7.2.x series is now EOL upstream, so drop the linux-headers
> option and add legacy handling for it.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
