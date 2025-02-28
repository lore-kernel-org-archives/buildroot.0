Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AE5C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D72346FCD3;
	Fri, 28 Feb 2025 23:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xy_eymjbzFnl; Fri, 28 Feb 2025 23:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E46E4703AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E46E4703AC;
	Fri, 28 Feb 2025 23:08:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C52791
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDBC7416AF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgpK5tsXRgmp for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:08:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EFD64106E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EFD64106E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EFD64106E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:08:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E145D78032A;
 Sat,  1 Mar 2025 00:08:05 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 00:08:05 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 00:08:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250217112011.1853079-1-james.hilliard1@gmail.com>
References: <20250217112011.1853079-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e4c66a82afe7bba8ab120fad3fd5170c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740784087;
 bh=leDDLzWm3DLn6RUiUeR1WBmfykzxAmB4T70ItqIufiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KCOcyimVk0RNkyIo3nXEOO4w3vwovT+uKrDIfFtUlw9B5QOO77Mq2Pbge8PbyUmKI
 sb8uOVD4LvGqZRmw2E+XPI5l+OMWuaeUAg/GRoqZ7EFAh+6SzRieWD4Mj04Wo3XwlS
 BI9/XzN9GIRgEMSzePTui+FCHU+K/nEeteLnZDsVSW5xCgGwu39zGVIzoR/XXuuVKd
 qZ/gWBXezuprUwajR0v56vS1a/qyoo94WifkkmwjcEUzpfBqJu2K4085md97CCqfpn
 t3ngMqHjJYl29dBxagqq11PtjRt2ffWBT9106fMzYwPSecYAMWzCOfXlIs+RnXwz5P
 McsHpvhH7DkVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KCOcyimV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to
 version 64.0
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

On 17/02/2025 12:20, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
