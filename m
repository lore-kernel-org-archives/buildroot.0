Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643C4E7FDE0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21D1A4073F;
	Mon,  2 Feb 2026 22:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyLcKcBGDtwa; Mon,  2 Feb 2026 22:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4543940740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070620;
	bh=nptC2a8hFSVvebNkMJfu2VWKpQ7/ws3wL/ZBEo1Z1Z8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUNj3ZMIorQtdByTf5OkcpPScXdlMsOd6PgTq+qxaMua1aIdEoSnNqrUh32p7224G
	 Lzj2UBS/yhl5y2lU69dgv3DN5l/uMxAdPiE86QMl+RsdVJZ123CMIeIuKrs5DtWMJ3
	 PR63mSX0y1nfI53vw5+nOHT2NxLQuoYdZXMRHdq1hUYoQQMoz2xQ0kglhiiqLQLnUm
	 Ahj12GdtVJS2qsJyQhXY3qnWL1Ynho4zmqMMXIJqyY2hUcjzBDRwfeSUqzAnoDaeB6
	 a9bKKLzUy8biv/rzIAU5h0wDBXEeiiwBXpuZet7g9OznpY7t0WqhLRtsPUNzHDnTbl
	 Smay1akr1zYRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4543940740;
	Mon,  2 Feb 2026 22:17:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F65EF5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F03C82304
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGHhd8o5Je-U for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF8FB82C61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF8FB82C61
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF8FB82C61
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1734403833; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 22:16:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vn2Dy-00000007h0C-22RM;
 Mon, 02 Feb 2026 23:16:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260202144704.980271-2-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Mon, 2 Feb 2026 15:47:04 +0100")
References: <20260202144704.980271-1-ju.o@free.fr>
 <20260202144704.980271-2-ju.o@free.fr>
Date: Mon, 02 Feb 2026 23:16:50 +0100
Message-ID: <874inyrdt9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=b7S8fbVYrDubzFAZbxfjfltF4RatBuNhrUQVQsl2buliePkq+78Y67q6GCYxjAwBUaTqvmgPvLWZzfwTH4YNPRqU3Jf2DNDkwP2d7LcK16B2dLt8VgGcbLWoUjnZmIFiUg4IvLhDOaMwrAy6CBQc4Oarh2oCnDGqraSS3FejeOC1Wh1CY4T1IZc2A4RiohC9J4MPDVo4oR3LQpIwSBkKv+H2bAyhCN7KBUOMXQvaoSDLFl+1zzFWKdCWMMxYDvWJDjY0g6gyuqSrLtM68ebjkJ4PnPghiag2hi6g64lZXJeG64g0fMYm8S2GdlQt21RX3nyb/xhIlykuIra3cq5l5w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=E7/K0LZc8+PH5zmiupQldoxtq5A+7iBqQxN/axr0qf8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=b7S8fbVY
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: bump to version 10.2.0
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > For change log, see:
 > https://wiki.qemu.org/ChangeLog/10.2

 > Note: this commit switches to the new qemu stable-10.2 branch series.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
