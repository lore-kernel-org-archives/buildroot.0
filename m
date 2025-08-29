Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1EFCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 290A0844EB;
	Fri, 29 Aug 2025 15:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ya58a4UDXnA8; Fri, 29 Aug 2025 15:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62FA3844F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62FA3844F0;
	Fri, 29 Aug 2025 15:32:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40A601BF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CF4C844F2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1JQPqMQsAJ8 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A6F8844A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A6F8844A5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A6F8844A5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:32:29 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1293358031; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:32:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us15W-00ChcV-23;
 Fri, 29 Aug 2025 17:32:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250828130513.146485-1-thomas.petazzoni@bootlin.com>
 <20250828130513.146485-3-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 17:32:26 +0200
In-Reply-To: <20250828130513.146485-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 28 Aug 2025 15:05:11
 +0200")
Message-ID: <87h5xqi1o5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Mqn0Ox0oF5727Y3IlwhZCxP4aaiBcj7MtQrmZ1eM7s/GJzzKuos3GSXH44XwSrCNbexX8mLsQ4kKLhC+CkxEmozdqtUJ+/qUhgwT3kUd82nAyQnvmtwpsNH9uxp2kniOHNnaA72B9YAm+4jHS6K6MyKUvEXFKfPGJ666s5N1NhqEpJKv6Sglxwe/vhM6d4By2voqDPIE9PN79FpXOnobGv5Eu3mhy/DVx/8tUmVqOEfVYaEhVrlRxX2qdMejDnx9dLHTHE468jgf+nALKMAqHR4dW+IqfobaX//KOhT9aanH8vGBmlMX7UQTBDOwRKTHqIeXknqDf3As5DOeCrrwAg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=qcpCTyEjElgidzmfGskDH4opNHcA0xB/0q2NvIiH8Zs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Mqn0Ox0o
Subject: Re: [Buildroot] [PATCH v2 3/3] package/netsurf-buildsystem: remove
 package
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

 > This host package was only used as a build dependency of libsvgtiny,
 > which itself has been removed, so it can be dropped as well.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > v1 -> v2: No changes.

Committed after adding a Config.in.legacy entry, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
