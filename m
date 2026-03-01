Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62EAFD0070
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 15:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA8760BAB;
	Sun,  1 Mar 2026 15:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGpCJy2hsBTS; Sun,  1 Mar 2026 15:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB3E260BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772380301;
	bh=m7K6mo2nqRBAOUBC8lUoMcTbjL4u1anOs6qQ5da/AIA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YUnkFfkohlWY5AZfj/QwCsxtOATy2L+d8zkWJcK+eT7GFTZHZGs0Qj2ug9apAGd/i
	 2xJoZ9PyfrLE222HUCZNc2Kgre5Gu5mvQyhZXeZ0WlQ9yVfyIVvv2Dr8ZZu918HnmE
	 oOUVya7TIA2XarQRbEb33iKY4he5oDq/YDlbywgd2pHAPtfq0G4vqnWnHB4Njyq2ub
	 BRDdT1Bz6TWyMIauRvaOjjLsv4NwETMX2ONv6HQEFxRTGJRf8DHb3QgqC6yQWdqtJL
	 cRS7ewVcD5aWCdvDqJHfn1N+hh+jEL7e9upqNQaP+Jns6SI9yjrvc3wozKME2YaR/I
	 oax0FgeTQBFLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB3E260BC0;
	Sun,  1 Mar 2026 15:51:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6009E24E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 15:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5154460BC0
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 15:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_NVWYWaoyMI for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 15:51:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F0D660BAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F0D660BAB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F0D660BAB
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 15:51:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EC6FEB00548;
 Sun,  1 Mar 2026 16:51:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Mar 2026 16:51:33 +0100
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 16:51:33 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20260301140024.693061-1-giulio.benetti@benettiengineering.com>
References: <20260301140024.693061-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <57f5a1043ce0ef66ae77a010483d6ff9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772380296;
 bh=d0VNgDYattQ7y99/qwg0Ajlhy3OJO0JUIW0tG94wdrk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KCoikJhRty9qE5fpiaL44f5O0riz+Xv8+W4x8YpYJqng/IOljnlHAe2oVO/HU1znh
 dHcsro9zqfoEQSuS1Xaecg91jMiCSSPkn1k5IU+YoIBD7rNwnQcf8YT//r8GsLDJcY
 s81NI5hWncLNFZ7hSlbR5z2J0aY59vo35tJ/lE4GPoKR+t29a4cF/iVuRh164ZDaqa
 vNLDMXZeaWBUL1QbnTladSXT1xobrjn4V4BAh0ME937jsXaBnrZhy7HqvPIo4ROFwB
 QSB9pJWVexlPpDJ8mCgMfgsxEx2CkBuJ1Myk7fP6LQVqFFjnxjJYdLDjWcWGJTBgbD
 P3msGSMAG2XHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KCoikJhR
Subject: Re: [Buildroot] [PATCH v2] package/nfs-utils: bump version to 2.8.5
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

On 01/03/2026 15:00, Giulio Benetti wrote:
> Release announce:
> https://lore.kernel.org/linux-nfs/fdf3631f-e924-4e4c-bd9f-db5b40a90bfe@redhat.com/
> 
> With patch [1] option nfsv41 required to be renamed to blkmapd.
> 
> [1]: 
> https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=59e85671e59f7ccbf66dcf72ce7462bf4932cc78
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
