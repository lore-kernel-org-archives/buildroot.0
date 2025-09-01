Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B895CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 12:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 579D241402;
	Mon,  1 Sep 2025 12:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZ3J_n3-r2KH; Mon,  1 Sep 2025 12:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A96B412B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A96B412B1;
	Mon,  1 Sep 2025 12:13:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5036810E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 12:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3405383E81
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 12:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peaOQjs1Uu55 for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 12:13:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3AB983E69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3AB983E69
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3AB983E69
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 12:13:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 725891554; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 01 Sep 2025 12:13:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ut3Pa-0022n4-23;
 Mon, 01 Sep 2025 14:13:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org,  thomas.petazzoni@bootlin.com
References: <20250829201835.795429-1-titouan.christophe@mind.be>
Date: Mon, 01 Sep 2025 14:13:26 +0200
In-Reply-To: <20250829201835.795429-1-titouan.christophe@mind.be> (Titouan
 Christophe's message of "Fri, 29 Aug 2025 22:18:35 +0200")
Message-ID: <87y0qye5g9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TSML/18m1kvXPV/qW7qfH5u/EkKnPQ/tGLUIr2CgMGE9LAxIfz1x7FV5NIU9mHWdkZPYLizxtk1Wcacd50wc+gBvBP531x37g6gzY0DMrsBKpBE27nt7yQQ748TkbnRWedTuKUPTnritTg4BOdk/ggNrdIXbjPHSNzW5QfkkcN4uXyybW3LNVozg9r03HgzJTF4nBm6BlibI0LOa8Uw7R75LCNIvzZ8qkhnxrHeHA48f2Yy3TSPylnnpEvIV3veH4mafsu/UZ6bWsWdTWlqNrT3/fJvm2sblNJJmg99b66/Om7XtoX3QsEEjJLFfw7KrqsqLW7/VXGVoWcuxkygH3w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=2Bfn5qqkYeU7FJj78SMAAdKBl7VU/U4Acb7CZjckawU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TSML/18m
Subject: Re: [Buildroot] [PATCH] package/mosquitto: fix build failure with
 recent glibc
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

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@mind.be> writes:

 > Fix link-time build failures because glibc>=2.34 no longer ships libanl.so
 > as it has been consolidated into libc.

 > See the inner patch message for more details.

 > Fixes: https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b/

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
