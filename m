Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D3CC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 640C2851F1;
	Fri, 28 Mar 2025 18:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJN9jF0n6jWu; Fri, 28 Mar 2025 18:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DF5B8577F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF5B8577F;
	Fri, 28 Mar 2025 18:53:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F25481B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D829B8577F
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Steq3lPhDeRm for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06795851F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06795851F1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06795851F1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:53:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C900D6012D;
 Fri, 28 Mar 2025 19:53:16 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35786])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Mar 2025 19:53:16 +0100
MIME-Version: 1.0
Date: Fri, 28 Mar 2025 19:53:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20250327182940.944174-1-bernd@kuhls.net>
References: <20250327182940.944174-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <2e1c30acdb8cab366dae3e17cf6e0864@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743187999;
 bh=TiTZtgm2KIxwHCIoWq86VcCRby5b/xUFHbQmXsLRT8s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=heFOGKDQdCGFpZP2yWzPMuGV8MeItiPo6kweETu3F8unbvjLREonae++CYwFrO8xU
 +Bq0yi3Mo49tXCFNiuf0FajdBJUyeFNylnN0Rf/+eJadNR80XjiJAqtPeRfrJZiNjZ
 gRaD+ie2v/+l8Yn+IFhI2kfkMgDUhmoS3Ribo1LxHyHdTmHzRsiRRNxDTKVdYosWey
 wMzK7oLvSJ7c/Vfm4rnmSj0FYdbRCD97zjRrCNJeydJXv5UQkHaTWSfQw2vvRcGESY
 VYeoDWd6zBuaJVtVwjM8k2VQBYTIGeJaXUX9rVGgu2ciYRKmc1eF/tiaTqobiUONks
 c8TcboMcaVwAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=heFOGKDQ
Subject: Re: [Buildroot] [PATCH] package/exim: security bump version to
 4.98.2
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

On 27/03/2025 19:29, Bernd Kuhls wrote:
> Fixes CVE-2025-30232:
> https://lists.exim.org/lurker/message/20250326.140105.6b97555b.en.html
> https://exim.org/static/doc/security/CVE-2025-30232.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
