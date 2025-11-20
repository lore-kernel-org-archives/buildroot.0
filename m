Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1E0CF9C47
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 16:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250CA84535;
	Thu, 20 Nov 2025 16:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vqwlx6mxL11i; Thu, 20 Nov 2025 16:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F5BF8453B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F5BF8453B;
	Thu, 20 Nov 2025 16:42:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 622302A9
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EC8D606BD
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gC308AY_ilpi for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 16:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5009460609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5009460609
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5009460609
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:42:17 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1273065465; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Nov 2025 16:42:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vM7ja-00000003q3z-2WZB;
 Thu, 20 Nov 2025 17:42:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Sen Hastings <sen@hastings.org>
In-Reply-To: <20251119213420.7480-2-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Wed, 19 Nov 2025 22:34:17 +0100")
References: <20251119213420.7480-1-thomas.perale@mind.be>
 <20251119213420.7480-2-thomas.perale@mind.be>
Date: Thu, 20 Nov 2025 17:42:14 +0100
Message-ID: <878qg0lkpl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TGthigvFLevJEYSuLfyQJUhH2wtd3506K1nyiy11TVNfpaXb72GoRoHMr1ty5gjFeW5RWtfAHK83ozvXpTPgrJjZrYus6GKBV98BaROF6GZ7kwuHNbTFZJbA6UpJkAnZDqH1DvaoTX3OrcINk+v4/t5LmT1vJV/6k82CLWiwgGl6dONF00wPwRMyP/kSJFWlZpscuQKVYW9W7gt9Er9bQqj/d5+YI6yCpZrvO78anPfAT6taD4O/du9zi3lLNcLOFre6dCsjGNTxi92ZL9IQSIbJVXIdYUq/zyF7DQbS8Zlg6FFyWtyoY1MIay/WUv6N9sedKuUIeO6mHQrr0SlbAw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=hVzjuuzRd5XFaZEd8i5wXGpZY8Z03CJ55K2il9aUCSM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TGthigvF
Subject: Re: [Buildroot] [PATCH v2 1/4] support/scripts/cve.py: don't call
 download_nvd
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > This patch move the 'download_nvd' call to the 'pkg-stats' script
 > instead of automatically calling 'read_nvd_dir'.

 > Since the cve.py file can be used as a library it's up to the caller to
 > decide wether or not to update the NVD database.

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
