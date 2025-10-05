Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08208CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E9D403E9;
	Sun,  5 Oct 2025 13:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyKQqz_-3an2; Sun,  5 Oct 2025 13:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A26E40A93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A26E40A93;
	Sun,  5 Oct 2025 13:37:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04D1C909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAFA983C6B
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stkTbCDrq4d1 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E765D83C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E765D83C30
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E765D83C30
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:36:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1667492161; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 13:36:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5Ouw-00GmT1-0c;
 Sun, 05 Oct 2025 15:36:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251004103109.28487-1-bernd@kuhls.net>
Date: Sun, 05 Oct 2025 15:36:50 +0200
In-Reply-To: <20251004103109.28487-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 4 Oct 2025 12:31:09 +0200")
Message-ID: <87ikgt31xp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iy4a9E5DhulcqGK2wG4DENOF+r2brk4BMi6w5X75DdY9fIzTA+Fh4dwCBMxeUVT9sQi9NvvXaOnPcnvUDCkFsBrsD+DhFcPivtsL2ZGC2cBe9+PoaIyf+Z5wW36zCPCYCSw7pXTbNiHVlhu2XbwYkPWh+LsnKdozG1M5UlEhSW1UprnuxJ7s7yzeIC+yoPUZmbkypk6KDFAHLTFXEFoasH9d5bznEHeTnLyDUt0pvMu0bEEulFABJMGV390pQd4Dc5l4ke327L8baJ3WxbBIhlJFcpnJYmGHIUz2qJeMZmAoTH0/tr5MXhDELmEkIZ2tBaewLI91FdStuEHxrVwoag==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=ZdFqmE99YgW4+AMsl50rvcEBjKP0w76YjeIbCzv9brg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=iy4a9E5D
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: fix license hash for kernel 6.17
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit 76d25d365bc12c34d01703f1f9a45a0e02454466 added support
 > for kernel 6.17 but forgot to update a license hash needed due to
 > upstream commit:
 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/LICENSES/preferred/GPL-2.0?h=v6.17&id=660470dc58624242e39b7fdc6290c81a4f810b1e

 > Fixes:
 > https://autobuild.buildroot.org/results/fbf/fbf40bda2e31ed9b9eb94dbc398123695366b776/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
