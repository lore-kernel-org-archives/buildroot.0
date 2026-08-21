Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BA1C5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 21:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E4C409F6;
	Fri, 21 Aug 2026 21:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NojY1F6KA-9; Fri, 21 Aug 2026 21:13:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787346818;
	bh=Se+KqZYNN13fpADR8FSKtpN0C3PPkL22XlOtEos7CvU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XZ7vWJ7OvH7MBGJBtKhpC6rPDb0tpbnIoBkg67uvu2UKnO665U9zO9AvS95o8tEOt
	 lpl5RwYQ5rEro5wu2Cw1nSmbu0PKMu//QgURF4jT2To8hJRwx7Clc2yhTb0CfkOqQ7
	 EW6T1oTB1necnkRMaujBjemRTVjNZ+rOBjeTe3XP4gvnLm6jFWDx4DeJjGLP0QJdJS
	 LjlxqmXRdngW2XygwJm88b9DEtRqEEAHh8VvCtKkCwoGcShH/7b1R2ZHoKTEDO+yFc
	 NCA8NGrroB+StIgS2g6fgg8hzOjozV7zzU58UTLaQ97XTNCQzM4oe/8O38NVWXyfGo
	 iC5FNQx01UtCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C00E409D9;
	Fri, 21 Aug 2026 21:13:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF0B3386
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0A53409D9
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YihHZOe58gnn for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 21:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA78D406F6
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:13:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BDFF919F576;
 Fri, 21 Aug 2026 23:13:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Aug 2026 23:13:30 +0200
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 23:13:30 +0200
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260821-doc-typo-v1-1-70429bfa1a19@bootlin.com>
References: <20260821-doc-typo-v1-1-70429bfa1a19@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <573a316b7d0b3f85a32e36a6d9e49ac6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] docs/manual: fix typo
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

On 21/08/2026 22:30, Luca Ceresoli via buildroot wrote:
> Fix significant -> significantly.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
