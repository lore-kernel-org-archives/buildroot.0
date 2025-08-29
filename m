Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3837EC8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E59C841732;
	Fri, 29 Aug 2025 08:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYz-TuGl6Qeb; Fri, 29 Aug 2025 08:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B708416C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B708416C8;
	Fri, 29 Aug 2025 08:35:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45AD76C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BC6A83DBB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCbzL5Mt6-EH for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5801083D98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5801083D98
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5801083D98
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -21899111; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 08:35:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uruKG-00B5KU-0v;
 Fri, 29 Aug 2025 10:19:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250828215818.364295-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 10:19:12 +0200
In-Reply-To: <20250828215818.364295-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 28 Aug 2025 23:58:17
 +0200")
Message-ID: <871poulev3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bKVuS3KzVc2RYU0j62z4vTpY1Ur+MBwxjrwA7oT/ywKGf5pEbIbjLuUPp7J+OOivuXBuw5dUEZtEzf7kj9wrcIK9yk9P9eIbtY0qJX3iY5Jm06JBWNKBZt6D+8wJRsCFC87R39+G/b+CrxYfQevgapRj46fyupk9ganFPT93rax5XfAzeGcgQB/pmPAXEEuEkxVo2TqIvVJ/GT4BlpttN2keIE27GItAvQBCIE8aadnZd/IM+VmRiGvaW5HdRTbzFX9aDLQNzUHDv2EPYs/6jRPJuAu3T+PdyE3z3XitQmFjGfwyCeYVwjt9qh4OUdreaWjb+RCXrAcUGtBvtpDBzg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=TuVIgcGs4Ju2NCvBrxnQt0JcHr7jjoOPZ7myLMf2ocE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=bKVuS3Kz
Subject: Re: [Buildroot] [PATCH] package/lirc-tools: fix build with GCC 14.x
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

 > Since glibc 2.28, <sys/sysmacros.h> is no longer implicitly included
 > by <sys/types.h>, which means major() is only defined is you include

s/is you/if you/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
