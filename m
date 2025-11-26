Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E274CD1037B
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 10:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AB67806C4;
	Wed, 26 Nov 2025 10:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vd0fOxuiq77h; Wed, 26 Nov 2025 10:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 249A1806A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 249A1806A9;
	Wed, 26 Nov 2025 10:39:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 172E72A9
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08B6F41156
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtBWLwPDC3Dd for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 10:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6BDF40ABE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6BDF40ABE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6BDF40ABE
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:39:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1816339612; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Nov 2025 10:39:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vOCve-0000000Bc27-2M4j;
 Wed, 26 Nov 2025 11:39:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251123172531.527134-1-neal.frager@amd.com> (Neal Frager's
 message of "Sun, 23 Nov 2025 17:25:27 +0000")
References: <20251123172531.527134-1-neal.frager@amd.com>
Date: Wed, 26 Nov 2025 11:39:18 +0100
Message-ID: <87v7ixgjs9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LiZCAYGqXAPugRo9Ttg3jFYsHZ8M226VxLOucfgP1zA/4bP1wVB9uybgcBeemjg1aaEC03LK8pZRHMjlWDvX9ncBtrVV8CtEQHIMk8o4vqPl/hU10BJy6KCAygKnZAE413Sh5DHx3de3gxwkfNLTUkjaRLTxvUNl9ITaz8o9c/MZm9XNACLuxnlzMBTpZ/Gdz/RtL5YaMVZzwPhxhU4h+SGZAbNA9I9RneRKP706OkxCA1brwtLzTpB44e76eYPc2fg0IH+I1VDkj6T1JKpjU3eGZJFoh+hgJohyUkRmLR2ZKbs4I0roVzIiPR8mce50mXvnCoGT0Wgp7Yn0uNes0g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=y54ZG2BsIkMiQ6IK5pDW0ESLkEYyB/ixPxiPUeDICsI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=LiZCAYGq
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx: add xilinx_v2025.2
 hashes
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Add hashes for xilinx_v2025.2 release tags which include the following:
 > arm-trusted-firmware v2.12
 > linux v6.12.40
 > uboot v2025.01
 > with all Xilinx downstream commits included with xilinx_v2025.2.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
