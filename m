Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A5BC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E0F260778;
	Tue, 15 Sep 2026 17:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVKZYXFpLgxn; Tue, 15 Sep 2026 17:22:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 74ED06077D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789492921;
	b=l4FTR2En7jPUJd2lGLTHJzPIiXoWVcFLuyu/w/w7j/7CpLZft7CvdnFvOIcKWx1GCBB7
	 ZlagySFM8zyGcRTYqrZsZEXnyIu8tphgyw1zLP4hUtdGkBl/9rm8CUiCQ2As5ZaSjnDpj
	 V8aloDIprSusXJv8hDbKdrwZh4fh/qy2tdAUNa1tcoI7MAuRtnEsRCoqSs9okRQeZSyhQ
	 /wPw2zCki+ViQnqwJrRPI3TjgYhDbREMAzBaIMVrWqKZhFfFyYrNIERD/NAxFQCLNeL5R
	 GE/a0nXO1NmGG2kFMyVvrfrjqoAd81SIW6WiGwKpbKbIL3WWQqNBasWRxCn+ApwxU+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789492921;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=R/Xj5igmtG2s/q8rUxCuICjN7mEE6pPpsL0NK7zFyjo=;
	b=OQJlvqHdrZ3qq6OITcX1oapLh8B6RhqryperHoKI+5xqS6sWezkZNb5o2D+JB0JsAuDm
	 ATIruZa95TH8/1l6WYoMzbhXGmzzdqCKS7xa0Sc6BygfDJ0MZfHEhNQclkZno1xJNwKfc
	 4IbakudmZo/W6+RGwkSmmZgeDFT6GLU7SkBvbY5D3fEP6dR2DTPA6bIoqZPrzp2MmVbOJ
	 a6TqUGJhPXRHkgoN7cXz6Ww3Kgs2WKodxU8o8ak5UyYi7F4ZO5BGOUeFmB7jlDhcTRbUd
	 x3rOteFaUBmIhE197Al92su7zO4ZUbJBrod7qyPT69RLCpasbuZ5pqDhVktX7muynlA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789492921;
	bh=R/Xj5igmtG2s/q8rUxCuICjN7mEE6pPpsL0NK7zFyjo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lAWX05eqZ8sH1RW1LknyG9/zWK7o7BI+Sx3zbA3J+CrjLHzvHG1xiItyEH4JF52Ur
	 rse9OHHqnLOzkwVfD9FuvozmvJAGnItkUZqjJl2Ylw615IuS31MjHazJzYPDE1iain
	 uCiGYnUYnreJY3qNYSMzbjS126vehucdJ6L7N/nDbbTpWOPKe8XcLGh638oHqhXi02
	 dFVEtCgEV0sI5PwBoRS1CRnX9SpNwj7RqV646MzzHDYIGSRdA2bPekR3NI29rr8NKz
	 86M8Jjay2yH+BS0R0aKSj2tPi37UApH/c/stg8zMZtgstZrGYbVB24HoFPmJFpOOui
	 IsBRbmudsWCkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74ED06077D;
	Tue, 15 Sep 2026 17:22:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CA8123F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62C9540568
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sI7PkaLRwYf for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:21:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6432840535
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789492918;
 b=PGArGepN5svEkbdEjHNVq6c+rs8l1mBDq3y5R4PqTx0qDKu9RT4QhXeHPNSSVQQrmZrG
 HbTE9uqosWl5AaQyrW5i4iZJsy2f5pyeuVSKv94jbo9nbUqL5F/KQaW7bBhZp9u1P1jo7
 hPWA9VL2oDV6vXTSLK+MPST6Kd3TIooUqEHn4YF83Ja3GL3VxjAKjWGlL7LxOt+/XMet+
 SIgqCKXT1NvOWObvLmTsQyKkYKudxszqhOrI+HKAx+K+UL10IBqvgPrJvOIQ+qjuAv0Qr
 p7/FMWHRboUfVacQfJBOmKje4ngmPIdLh2gxjkSkkUB+mPsGmfmeqjjqFtebWopQZjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789492918;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=UHxKPOD4kDIutsXToEWRWbiBwvPjlXfQue++K/pm7YM=;
 b=UewYxJ3oCmFZPhjMKo240KE0AobwFfUpIlAg0seoV/4bYq80+B9yfYa8GAuda4m2DrPp
 w4OB2p/eOS5U6b96LaP+M7TL9Q/KCbPXc1sDdRg4Xd0wFHx0njRyWL40J3H+PdlSStibj
 OPoVJm3xWzPxJWWL7sC871Oz6vXlMlQcb2Z/2dLlC3rOyf8L82k2SAuoFuJLPbxZmXcqp
 UWoA/oGtJWQ4i6KPEpkc2Oa8s9kSwDLp05UMM5gBOPp6meTzTP8cR5wyyd07OzTUuIs8R
 tkOVuRrFLbGz+pplgOPaOFux+M2opqKvGpdsaVQa+iXJ2AoLHi0/9PqTCtd9LAglS9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=paB0puzy; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6432840535
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:21:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A8110B0051B;
 Tue, 15 Sep 2026 19:21:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:21:51 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:21:51 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>,
 =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
In-Reply-To: <20260914221145.1858079-1-thomas.petazzoni@bootlin.com>
References: <20260914221145.1858079-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <4011e10c00469f24cb05a2bd2891bdb2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/rpi-rgb-led-matrix: propagate
 BR2_PACKAGE_GRAPHICSMAGICK dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/09/2026 00:11, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER selects
> BR2_PACKAGE_GRAPHICSMAGICK, but did not propagate its BR2_USE_MMU
> dependency. This issue exists since the package was introduced in
> commit e821078031e14df69e5142f23e9cb7b5a1ea0e77.
> 
> It fixes the following Kconfig warning:
> 
> WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_GRAPHICSMAGICK
>   Depends on [n]: BR2_USE_MMU [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER [=y] && 
> BR2_PACKAGE_RPI_RGB_LED_MATRIX [=y]
> 
> which occurs when you configure an ARM noMMU FDPIC toolchain (because
> we have noMMU, but shared libraries, so rpi-rgb-led-matrix can be
> enabled).
> 
> Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 
> ("package/rpi-rgb-led-matrix: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
