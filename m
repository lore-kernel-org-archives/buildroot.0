Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774BDC61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BF5F80EF8;
	Thu, 27 Aug 2026 21:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glnWgrMqF2KD; Thu, 27 Aug 2026 21:09:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787864975;
	bh=YpM4zsMyEt5YKWzMbJ+cE3EBrWk9ZfFXsvaTiethUNk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MJvBN6IJgbunNnLAsSpowmDtvDgmDiUe0EGQbp/Sac3WgD+f1KvvqkxmGHMzb8CoE
	 ySq086RWmbgZ3iU49iV3HJ1/JxFAU+22RDRqU7E3kxyLCUd7XzIa3cs3MQXzeLXCnp
	 QsH6u3q16PN5DB7VAwWzptWCFDxc4hbr405oVtnQduf0Zb7+o7PIkDpAIa5Tgl+9mR
	 GxnkkjzFh9KO0pUbsm5/FcBCWZ3mENgdWly4/dEvRE+oHRoRiDgA3iHBP61C2o+/rU
	 t9FD0viDYUDfWAe0y5n+ubd12Torifs0YsXCAFA037celyr3C/Ekti9+Z89i5RerDm
	 vGtVaF5p66b8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8439480EEC;
	Thu, 27 Aug 2026 21:09:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC326465
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D23AC60825
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvPKb1ma-sZN for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:09:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C86856081B
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:09:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7573719F576;
 Thu, 27 Aug 2026 23:09:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 23:09:28 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 23:09:28 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260816145930.3581966-1-ju.o@free.fr>
References: <20260816145930.3581966-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <5b42dbd5d2dea41a11e15604efb5fdcd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: quickjs: new runtime
 test
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

On 16/08/2026 16:59, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
