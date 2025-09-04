Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75638CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2638080756;
	Thu,  4 Sep 2025 16:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy23pJkgDf4n; Thu,  4 Sep 2025 16:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EA2980750
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA2980750;
	Thu,  4 Sep 2025 16:11:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 270D1AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18AF6403A8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iMfi75fKy6V for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26B46403BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B46403BE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26B46403BE
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:11:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -160295124; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 04 Sep 2025 16:11:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uuCYU-002hnl-0f;
 Thu, 04 Sep 2025 18:11:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,  David Pierret
 <david.pierret@smile.fr>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250904150941.427455-1-elmehdi.younes@smile.fr>
Date: Thu, 04 Sep 2025 18:11:22 +0200
In-Reply-To: <20250904150941.427455-1-elmehdi.younes@smile.fr> (El Mehdi
 YOUNES via buildroot's message of "Thu, 4 Sep 2025 17:09:41 +0200")
Message-ID: <87h5xii4et.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=d2wpnnzmDl/t/Jj7IW3Fkmzs82GG+/idrGauCaqYsY9sC2slzgSaXSHBsbatCVfGVSEOM1d57+zbAV77rE+61NIEMOxf14NgWD+1mgWWWpaQEK9xhna4QjuNS6Yzh/g5OBC2luA/NN065T4wvu6VJzH7ZQWPD/H9+aLUE43XSwFFurewW2xK7mS/tCh69YKIPpolRxV1WEnxEM8vM7j8At+ngml3qeqh3dS+UzqpmY/dGjSMmAHbfuEHq+bsgI3E1VhenH+DFqpt0tfUdwvJeo2wtH2vn0Bt7yH2wEqzU0/qpQUbw1NaKOB9C2e88Ib50cm8u/SvonoIlr9/mf+xUA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=rE6BCAFLIaYAtsNG3MtwT930nOMEIr02O3vVvhP9gy0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=d2wpnnzm
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bat: fix build with GCC 15
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

>>>>> "El" == El Mehdi YOUNES via buildroot <buildroot@buildroot.org> writes:

 > Bat pulls in the onig crate (version 6.4.0) through syntect with the
 > default "regex-onig" feature. This crate depends on the Oniguruma C
 > library (via onig_sys), which fails to build with GCC 15 due to C23
 > keyword conflicts. Newer versions of onig fix this issue, but bat
 > cannot directly update the onig version because it is pinned by syntect.

 > To resolve the build failure, apply a patch that replaces the
 > "regex-onig" feature with "regex-fancy" in bat's minimal-application
 > feature set. This switches bat to use the pure-Rust fancy-regex engine
 > instead of Oniguruma, avoiding the problematic onig_sys dependency.

 > Fixes:

 >   https://autobuild.buildroot.net/results/ecc/ecc3b0c83e691e9a8ed5c7ff9d0a92ee06409f20

 > Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
