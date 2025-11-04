Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A71CCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B87440F4E;
	Tue,  4 Nov 2025 21:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JYChWZqQT84; Tue,  4 Nov 2025 21:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8843D40ED3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8843D40ED3;
	Tue,  4 Nov 2025 21:33:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D931462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1741861119
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAP00JmiL18N for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 21:33:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C202E6112E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C202E6112E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C202E6112E
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:33:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1479631589; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Nov 2025 21:33:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vGOeL-0043RG-1q;
 Tue, 04 Nov 2025 22:33:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251103211146.57344-1-thomas.perale@mind.be>
 <20251103211146.57344-2-thomas.perale@mind.be>
Date: Tue, 04 Nov 2025 22:33:09 +0100
In-Reply-To: <20251103211146.57344-2-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Mon, 3 Nov 2025 22:11:41 +0100")
Message-ID: <875xbp8ove.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Wvak9Qx2t2UdjLJhRbmp1KzOC2zGkuW/LEnW/zgydFgYsEGXqOM/qOSNkYULPVh3OQaX0NL7Avx+a2q3vgohGSuS6E/p2ByldwIB2BC0vYBj/jUAgZHgzeEhoB2V9qwTcN5SuR4imtLYoT+Ijql3N7pYNlimaxwUe/7/QD/YHDnbU/2GKDb0xyj0cdWh97qM6dMcGjNwvzTyfqWVRrtpNP6mIvtdbsFxzSXc9yHu/6hIZY0Uadq6LSlJWzgyS9UFN3StNW6vlsZx92X0zmprL+muTNkrkOF3ZgOAY4YgZMnvjQVL96X5W+zPTYHa0AaB7WuJl8p3GTcLnn9vtUV5jg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=gWe2GaSFNsVOHy9bno6q0tVsJtNlQcq96VjmY3OPHak=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Wvak9Qx2
Subject: Re: [Buildroot] [PATCH 1/6] support/scripts/cve.py: remove print
 from cve.py library
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

 > The `support/script/cve.py` file is used as a library. Depending on how
 > you use this library you might not want to write content to stdout when
 > calling its function.

 > This patch move the 'updating' log to the 'pkg-stats' script and write
 > the alert when LooseVersion doesn't have a version to stderr.

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
