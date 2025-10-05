Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C62CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 14:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0BAA40A93;
	Sun,  5 Oct 2025 14:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aawkSndG9G5T; Sun,  5 Oct 2025 14:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9FA40A87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F9FA40A87;
	Sun,  5 Oct 2025 14:46:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1321909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A313C8333F
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azTMmb8TLzLT for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 14:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C3B3832DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C3B3832DC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C3B3832DC
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:46:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1409199289; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 14:46:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5Q02-00GwEb-0W;
 Sun, 05 Oct 2025 16:46:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251003201335.2430390-1-bernd@kuhls.net>
Date: Sun, 05 Oct 2025 16:46:10 +0200
In-Reply-To: <20251003201335.2430390-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 3 Oct 2025 22:13:35 +0200")
Message-ID: <87wm591k5p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=plGg6LRipu9PLYlL0e6W2lEE8f9W86k5ZE2Z8zHoqMux/zyJnYQV3hgcuxf25QuQAKEEiXfE+YBC5EGnS9Kt6zS9DC5vHisWJV+9oT7C3HZcI6LbJIH3yQC1hDcJ0aW817ZbTQNB8mT8tznmrxTok/YmYI4OxpcB5oVNQOirLkPj9PbnMhok+AdbyANNZFBDOV8B3wtVlx1LyBC3LyDVcAA/SF+9XlDm5WbvK7hpEMbjfamKFHFgxkBV3ZfbSIg0lreMO6w24CD/zowy3Po/ardV8Y/NWCBuNhv9KaA+CO7LyS2OrQny2ovDLEZBJ0GaouBZxj1hn3u1JblxjSomaA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=sWjJqrxgnmpVP5jOqoFQ/k1GGNJlC8CPc4Lf7nvf1UA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=plGg6LRi
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: bump version to 1.20.2
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

 > Release notes: https://github.com/strukturag/libheif/releases/tag/v1.20.2
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
