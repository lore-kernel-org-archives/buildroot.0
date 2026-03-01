Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8D5FD0066
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 14:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B9283F5B;
	Sun,  1 Mar 2026 14:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7QUKb6369QA; Sun,  1 Mar 2026 14:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1125A82327
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772373812;
	bh=M1VowECc+gJvZpUWfeBTdv7gFXoQwWkP3U3opxqBWWo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqskvgetWe7cFzB68dfiOiot31BddWcRXz2QQZFMjfpI3KLPI3DJ7I2eYGK1LeOtc
	 B8OX7mw7EIK5BTVQsgsXXWAwNt4YRYxMbYxGavQZbJauBCeXXV2AGV4u3w5aAssmXC
	 1PkALYIb4ol3rGl81cKDlef3T7EwwWSed0v3l8P6GrQTnHyvd/nMUg3FTl2vedX0DE
	 /UOx+8GNmnDdXhqK3/CiysDRby02p2t7Wk2jlgWPkYdtynPGQw97hVr34A+VfD5nYh
	 7HuH51l7pJ26ncp1weWQnKZbbCkRfxcTuCUT9pCLit7lht2OadjwSc7vfey6GoOkkZ
	 Rx4vHKGa6HcOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1125A82327;
	Sun,  1 Mar 2026 14:03:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A455624E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 966F7403CB
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAydAj20-P3e for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 14:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83E4A4007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83E4A4007C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83E4A4007C
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:03:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1664420132; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Mar 2026 14:03:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwhOE-0000000CjmS-217f;
 Sun, 01 Mar 2026 15:03:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260228194903.1908686-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sat, 28 Feb 2026 21:49:02 +0200")
References: <20260228194903.1908686-1-aperez@igalia.com>
Date: Sun, 01 Mar 2026 15:03:22 +0100
Message-ID: <87zf4rmytx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Dm48PJKtRHpmJUSrU6aVtlpvn7DhgZR3g4SBDMNHyhAzOjDy9xbISsCC5hUoYjIQDnsiNhureY8ot5Ebfz4xxhkHWNFXlUEzReBxnhqg0bV/5M+oXmpJZgni18DagWTIi/U57eS4Wzla5bvZLxXTvXVif5Z3CgJAoG1uZxcdrMOgxjfBBGKfc0uq+pSfLNrSWahqfFRBqwQUOh+Z+szKKcYdTgZVVGK9aw7cq0ZpYVX+tcLZJ+Xf6fbAeIhYWOCmaVYWZT5ZlZRDKBZkKB8AgAI2T1hySm0jDV2sPtXuQJiu52T+SIc3iv9805YAIzv4xFev6GJCY6uSweXLST9+XQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=n5Twp++NEiBH/PW57RGHfXK8UTLg5vo+cRQIp8GdRoY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Dm48PJKt
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: disable JIT for all MIPS
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
