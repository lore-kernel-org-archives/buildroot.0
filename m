Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE8DC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 10:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81EA481699;
	Thu, 12 Jun 2025 10:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLjdqVz1DL6O; Thu, 12 Jun 2025 10:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71E1A81119
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71E1A81119;
	Thu, 12 Jun 2025 10:36:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA881E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 10:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E2324024F
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 10:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBrPBYE7CXD2 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 10:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D6424003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D6424003D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D6424003D
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 10:36:18 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1969082954; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 12 Jun 2025 10:36:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uPfI2-004tEt-2h;
 Thu, 12 Jun 2025 12:36:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
References: <20250523215050.28908-1-fl@n621.de>
Date: Thu, 12 Jun 2025 12:36:10 +0200
In-Reply-To: <20250523215050.28908-1-fl@n621.de> (Florian Larysch's message of
 "Fri, 23 May 2025 23:50:45 +0200")
Message-ID: <87wm9hz1ph.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aM/JXGWrJ0dn8gSQ6oug6IdJBPygTwPFy3KyMY68I8FJO7UIGVGdnLyk2s0Tuval+t3FL2FvyupgdFP4z3mthNErSoAQbLsqEcyA8QY+7G093cPMXpzbgyULeNY5d2nYRSYiv4e+0bMfxpoj0bd+sTwAIxENKZaaKcoTOtnDRyLMnbDlhLlZsi045LNg1j0eXlCimmzNMLRYvpHpg8YrcFmIiVih6Q32+cvTUjamTTpa1dhURXugRnoxrqOAFKQlyilI0cRNGJV3I4tGzUNEMviHmnMV3M3mqUzbJFfA9Z7HdyoZieh+xqQSZOQBXPwZTDPV7TDhNC8IGE+N9Vupmw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=vr6mVl7FzBnNhBJBm7Yw67/baulhLYbHT5UjLT0kCEc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=aM/JXGWr
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh2: bump to version 1.11.1
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

>>>>> "Florian" == Florian Larysch <fl@n621.de> writes:

 > Release notes: https://libssh2.org/changes.html#1.11.1
 > Among other things, this release includes the patches previously carried
 > by Buildroot and also has fixes for build issues with mbedTLS 3.6.x. It
 > also includes a purely cosmetic copyright bump[1].

 > Builds with test-pkg against all three crypto providers.

 > Fixes: https://autobuild.buildroot.org/results/306/30699f986c6bcd1ab247d92c4ba0999f09aa226f

 > [1] https://github.com/libssh2/libssh2/commit/187d89bb0740400e8fa0b5f1441d089392797f53

 > Signed-off-by: Florian Larysch <fl@n621.de>

Committed to 2025.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
