Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEC3C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 19:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71281607E9;
	Sat,  8 Feb 2025 19:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUxh_AChbN7m; Sat,  8 Feb 2025 19:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B6C5607FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B6C5607FB;
	Sat,  8 Feb 2025 19:40:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D3271B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 19:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CAC280F66
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 19:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2by3sFgITuBw for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 19:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E09280F4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E09280F4F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E09280F4F
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 19:40:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 30BD213F8AD;
 Sat,  8 Feb 2025 20:40:08 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:47030])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Feb 2025 20:40:08 +0100
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 20:40:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Stefan Agner <stefan@agner.ch>
In-Reply-To: <20250205234229.76788-1-christian@aperture.us>
References: <20250205234229.76788-1-christian@aperture.us>
User-Agent: Webmail Free/1.6.9
Message-ID: <204b8fdaaf158ec78e2d2dfeff61b1fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739043611;
 bh=BMHxNa1LrQjSRXHSRJsmlmMr3vEw2j6+tnRK9GSyjFA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=osJj+3oVZ0xagjINgEhNHuvngAeizJSYnntqFSknW+/ETbBQAOlkUF0xVpF3w5Cv0
 QrlkqV7is1qCDQYYCqOQQv6Jbn7ettJDvJ2wOeYF+BjHoLMwZ3O0M7zN4n+MDFwNrm
 4tgRj/MbB1tO/E62bFJIsoLT+PVxbHvq7xeWofXboTm3TasUiexMC8jaA4my7M9z1m
 /WGzD3+HDxGxzS6176GckR2epYGILf0UrJZVsZcSf6TeVe3Lsmy73QINNO8AtlRfyU
 8FXfIy+UXBTZOfKBOWrQY6k1Cs+HVWIzKcw5IGjD4pa/1CXGWXHrSc5GvTIkKnRgvW
 oZOYEEkClgTkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=osJj+3oV
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.32.4
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

On 06/02/2025 00:42, Christian Stewart via buildroot wrote:
> https://github.com/docker/compose/releases/tag/v2.32.4
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
