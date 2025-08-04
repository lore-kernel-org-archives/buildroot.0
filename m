Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C73C87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 19:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1C8660ED4;
	Mon,  4 Aug 2025 19:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhPi157rm2B4; Mon,  4 Aug 2025 19:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F078360B9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F078360B9A;
	Mon,  4 Aug 2025 19:39:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4A951A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B07BA40D2B
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZV5Ze2YEnIAd for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 19:38:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF9BF40D32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF9BF40D32
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF9BF40D32
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:38:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1379114787; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Aug 2025 19:38:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uj11G-00BJdt-1e;
 Mon, 04 Aug 2025 21:38:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
References: <20250803164701.225241-1-angelo.compagnucci@gmail.com>
Date: Mon, 04 Aug 2025 21:38:50 +0200
In-Reply-To: <20250803164701.225241-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Sun, 3 Aug 2025 18:47:01 +0200")
Message-ID: <87pldalvw5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=R5oIMb7f2TvELq01v6isBp9ovRWy7aB8O0lBARkrKUANFyLsif2/VevAzNe8qkf14nmqjexjlFduR4ERFwXhs9kk105IQ+8RZ+o6mibPQmz5fhRfRoQRlKzDOVZcpaYbDxcR2Hv+QBQvK9+g1sSn8FrTPAEmTjT1fnHiZ/KfQAYen3fGJWUjgmowZ7dJ5rA1/Oxms3GZyePo8X/v34YrMi4HUPmmXsV45wWLDBV/Gt4hoYyTN1LLCJkPIDngy9DitzgFy3y8cvFkNFUcM7Jry01q+y8OYCDXTFwxlaUBhWPEIimueqRXbhbiLaEY0fJKcHq3dKxOu/lYDPenmelDvw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=gKuhbmbWQmmf+73wZA9pBbDevNyi5ym4W5dAcfjTyNk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=R5oIMb7f
Subject: Re: [Buildroot] [PATCH] package/sshguard: bump to version 2.5.1
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

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > Changelog:
 > https://bitbucket.org/sshguard/sshguard/src/master/CHANGELOG.rst

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
