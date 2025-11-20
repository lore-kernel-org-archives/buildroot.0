Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A963CF8875
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 15:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36C1481353;
	Thu, 20 Nov 2025 15:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdMKAuCUZkRz; Thu, 20 Nov 2025 15:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658AA81399
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 658AA81399;
	Thu, 20 Nov 2025 15:59:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 913ED37D
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 15:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ED9481399
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 15:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WY0bBAoy1WzG for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 15:59:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E237481326
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E237481326
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E237481326
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 15:59:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1344058586; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Nov 2025 15:59:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vM74M-00000003pDQ-1P95;
 Thu, 20 Nov 2025 16:59:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251119213631.3212239-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 19 Nov 2025 22:36:31 +0100")
References: <20251119213631.3212239-1-bernd@kuhls.net>
Date: Thu, 20 Nov 2025 16:59:38 +0100
Message-ID: <87h5uolmol.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DQ+j9TqYddzGeuyhJFh/DMtD6bq5faMfLc6GVdQ8cwOHmFBdcv8/XLNQR3hKfs1br4mMgv8frgBpzFQEgs/pxi7coFBhrAU5ENEQJWpoMDhPQWESzO5ye9CTjHtTcemse3vOZJ7t3rsOA5ZYPolSmS/veWm1i3yeQY6GlnCVYxskOD/3pH0AuhZaosuYDtwOWM/uHbZ3aMtVV3yHmqFwVsG0Xb9A+OcyS+jFJCy4mioBzvB3SqSi3TztXHDViaMm+o+jTjTzJ3Ee2b2AvXeEhxNf3ITJgZ15oekIZXAaarGv0S+mkpEkYKR8EAt2FzjtGghJ6uNxz7kecgqRNzobMg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=//ZLLGlyt5ypzhHmOWeZ6mypn52wWSa0ri5IQ7kV1SU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=DQ+j9TqY
Subject: Re: [Buildroot] [PATCH 1/1] package/e2fsprogs: bump version to
 1.47.3
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

 > Release notes:
 > https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1.47.3.txt

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
