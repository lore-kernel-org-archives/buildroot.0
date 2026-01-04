Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4309DC2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1F040535;
	Sun,  4 Jan 2026 14:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgeebngJF4Cw; Sun,  4 Jan 2026 14:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB3C640387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767537701;
	bh=IbhpKgwrFquhzOPSptyH4k+jTGZvuLLNW9roc6hzEr8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UCKdJeKVI4JBf5Ood5HvR/zIQnlhJ+80rwTpqOpqzltvrBREzIYeOCKeEkzetzfh+
	 XTqjCDOCQIlaRQ8cHa5tW54gPlk+KRK6u7LyCtut66obizD5CdCM/OG7QeAOvsBcd6
	 FtFNKUqASsGyhv6Jjee9YsOm/6ThYV+caMzvvXQv62gx6/GaFinba3hWkd+ImG8aUh
	 QxoWN0shmkkf7e9YxsDW6MgDOP7/pTKRhUR8nbSpRG2TzmWxB62scm594I9e1J9rci
	 LfR7vK+lvANsWoGuWCINy4n5YltNeufbZmTgQZ9AM6QDL1d/yfVc4kYZ04PKF53KIi
	 0nzlM0i7ociMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB3C640387;
	Sun,  4 Jan 2026 14:41:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66B122DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 573E06077E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id za9b214eArS0 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77D4A60758
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D4A60758
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77D4A60758
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:41:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 49BB55FFB1;
 Sun,  4 Jan 2026 15:41:35 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 15:41:35 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 15:41:35 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260102231311.131465-1-giulio.benetti@benettiengineering.com>
References: <20260102231311.131465-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <18491baacd9266f1b18ed5cd944cf9b5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767537697;
 bh=YGfQqR6rSMBLloKz3pExGDxOsKANs8bXOZBR+/OOxtM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cCjLCqmvVMqMx5MszFzukvo7QbIv2dNz7GPD/QlmPIAgpm63UtyxUpWkD/91y+FGA
 ilc29QHGy+shTKqRInoojqRlLv+OL65EJvQic5Mtmgis1RxV3TQEeHqhxckP0tVq8B
 gmlzLXL8auepvzKTR2n85oUMtkp6hRFDzBI0v9m2EiKRilB9O00ofQ/n7eUPOL2Lps
 /8q/ElU18QkIqBsBDVFhoxZ1eHHuhkFrcTB8DdaXRa6gSbhdtp4xw0uf0g4wx4XlWY
 pw5ptN2y6fXTzAUYFZDpirm2PyKH1eHcjT7HCrIow3znyDhWFd7m4VrMNLI5imvL2r
 KVcFVjNJ2KQmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cCjLCqmv
Subject: Re: [Buildroot] [PATCH] package/libtracefs: bump to version 1.8.3
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

On 03/01/2026 00:13, Giulio Benetti wrote:
> Release notes:
> https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
