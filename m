Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F87C87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 19:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFED861360;
	Mon,  4 Aug 2025 19:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3e51seM8Ywkt; Mon,  4 Aug 2025 19:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 228FE61338
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 228FE61338;
	Mon,  4 Aug 2025 19:39:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A00118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1715D40D32
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDwFqaTDjeAK for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 19:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A80740D2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A80740D2B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A80740D2B
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:39:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -646967620; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Aug 2025 19:39:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uj11j-00BJey-1Y;
 Mon, 04 Aug 2025 21:39:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Stephan Hoffmann <sho@relinux.de>
References: <20250804185233.3345099-1-bernd@kuhls.net>
Date: Mon, 04 Aug 2025 21:39:19 +0200
In-Reply-To: <20250804185233.3345099-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 4 Aug 2025 20:52:33 +0200")
Message-ID: <87ldnylvvc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aneQSAS1/At1kFcHnm68KLHjNtKPz9ZQ/ra5l3iR6wH/Wf5p314HrM+f3S8mVX7Heg+3s2IuYlUy+7lcnO1JmP2Qf3/QjXJ5WIiWJdHQcdj+P/Vs/AKOJ9DU0yatr1E/TAT0tGqy/IAoLJjkJGToHhwyQ9EWpdTMxSD5Ou9sPKr1ESSM9TkOLLaHVmxJWJKUiNK85wDIGrt7WZUwTHf2VQP+QESoxFTn9/Q3jeEYg0/GOT/0YzRP6+esUjxLvZMt7w7ARWzHzOu0tVzCCg85TtNgc51ZIq/5uHSKTkUjjrHYXhWG1XxrmWBuCWRoDi+KQ9Ih3zZfcPlM0+zQ6i0w+w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=mvbMtCqNHwxxusACPm50zm2Y1vhN+6n3E4d3RH6t1L0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=aneQSAS1
Subject: Re: [Buildroot] [PATCH 1/1] package/mtdev: bump version to 1.1.7
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

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
