Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27997FD0066
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 14:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6AA1417C2;
	Sun,  1 Mar 2026 14:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PUBIbDSIF3Z; Sun,  1 Mar 2026 14:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 049BE417C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772373786;
	bh=M1VowECc+gJvZpUWfeBTdv7gFXoQwWkP3U3opxqBWWo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+PxdFwI9iK+GVFFjPTuDPXb6NI6CaB5Ib+hRYwqyH+B9I9rev+YHfH1hXR/Ektms
	 oo+UUlwFtoSKNeCJ5iEH0XEqRqztojf8aiBAVO4vEwOdJnbXZMOP1r5ggqI7Sfx9n5
	 cQfvtx/KADzX5vFIElVVfrG97oIXtqvXivud3zbwZQ3HNpiPVS7TFIbW1Lp8UQEcOf
	 EyRNVA1FYJkmc5jkqPSs49KSFJysy4hWNnG5rD0bL1Wq45va4ZtmlXpJ90ptUojjRF
	 v1XwziPpmpqQhFgNi/JnlB1Ph9jT7vzvo6rsVsXk8+ySxlQHeIAXMYU7c8xocdj40H
	 HeUALDvJVJnmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 049BE417C4;
	Sun,  1 Mar 2026 14:03:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34203231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A1DC417C4
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0ohgov6vmBL for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 14:03:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08487417C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08487417C2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08487417C2
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:03:02 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1974706039; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Mar 2026 14:02:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwhNl-0000000CjkH-3APj;
 Sun, 01 Mar 2026 15:02:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260228194406.1906845-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sat, 28 Feb 2026 21:44:04 +0200")
References: <20260228194406.1906845-1-aperez@igalia.com>
Date: Sun, 01 Mar 2026 15:02:53 +0100
Message-ID: <874imzodf6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LaB4qJQ96UrhZ87SDgj32GAhGQ5hTCX9brQ+o3TNjQqXaKCdxMR3RhQCWGapMoXWQE+ETFV076Fnfds/If5OpF47nHGEoltwvGo+9dLmA0zWERNh0Y42LpBdnslCZ+0bcC4JNKHJH6qwGISvm0lpTNcQfOxLkkqY35zvd3TPXQ1U4Jz0/0hoE6ShZ9RVJjgHtFdbyFKFj/5eMZuLWe0Cg6s8F2MyqZEfZoh+w4srExwmdA27fcthU6PnTukiM8ErYK6D5GJlpRd3AoBWn1KAca2hhwgORlDy7PsEJUPkWkvYv7pdw8DFruk3e2MZ4DU/sYLHdEZcwDOjLji9npOp5A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=n5Twp++NEiBH/PW57RGHfXK8UTLg5vo+cRQIp8GdRoY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=LaB4qJQ9
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: disable JIT for all MIPS
 CPUs
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Change the mips32r6 into a blanket BR2_mips[el] check to disable the
 > JSC JIT. Upstream removed JIT support for all MIPS processors in
 > January 2024 [0], and the change trickled down to stable releases
 > starting on version 2.44.0 [1].

 > While at it, change the upstream bug links to point to a more
 > appropriate bug report.

 > [0] https://commits.webkit.org/272866@main
 > [1]
 > https://lists.webkit.org/archives/list/webkit-wpe@lists.webkit.org/thread/JM7GLPPKGAB6DIQ2YDHPEIWNOYSUHBC7/

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
