Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A532C8302D
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 14:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8465406B0;
	Mon, 30 Jun 2025 14:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZWvPuqnIGKQ; Mon, 30 Jun 2025 14:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D9C4063B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09D9C4063B;
	Mon, 30 Jun 2025 14:25:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53E8FDF
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 14:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45A014063B
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 14:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xUOJK2FutgN for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 14:25:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 829F540602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829F540602
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 829F540602
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 14:25:08 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2019417412; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 30 Jun 2025 14:25:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uWFRP-005PuR-34;
 Mon, 30 Jun 2025 16:25:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250623215546.1850256-1-thomas.petazzoni@bootlin.com>
Date: Mon, 30 Jun 2025 16:25:03 +0200
In-Reply-To: <20250623215546.1850256-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 23 Jun 2025 23:55:46
 +0200")
Message-ID: <87ecv1park.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iGebJwbNcT2J1eeXhaoIx1mW/zLR/Zp6H8Ix3vPrROEsVK4GKHD/h6gLEld7saP/2rewy0wfqysFvsviEZkGfPXJgUfmmu1C/h27RqBJOtiaxBEDCgOiA0BnmwDREagaJuNh4x3Ys0gXWMVo3B1UqgCIbYrx8othgd7Rvv5TlnzTHxpCMFPjHfwjSIks3VG9zq085fgz9nUFAwxn76nr5rQ+e6gzAQ0FyumPT1X+Mw0IT/po5jrZIZXVbAAtArjshDMgrDU4iRzSfUp4vfFdeanxmJHuvX+JK0EV9Dkiay7Bq3iOWzW/XBLQZuIuz2dk2zg9xxBVr97GKvxwMQPItA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=51KLLdQXz2Qim7qcZsRjD/j5YIkEm13i/+4UHPkp5Qo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=iGebJwbN
Subject: Re: [Buildroot] [PATCH] package/squashfs: bump to version 4.7
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > See https://github.com/plougher/squashfs-tools/releases/tag/4.7 for
 > details:

 > 1. Mksquashfs now reads files in parallel from the input directories
 > 2. Rewritten and improved help system (Mksquashfs/Unsquashfs)
 > 3. New options for building reproducible filesystems (Mksquash/Sqfstar)

I didn't look at the code, but is this something we could/should be
using for BR2_REPRODUCIBLE builds?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
