Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45286E7315A
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5689407FC;
	Mon,  2 Feb 2026 11:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i08fAheHgJqp; Mon,  2 Feb 2026 11:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A71640834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770032584;
	bh=slZQFOxt9YGLUUlk9+Xg8WZHZQld2z0ySG1xihFaSTI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WPqTi1odRB9npdG0J0jAFhdhyTaWi9s4KWBEvmwNtGRH+mehxS3JTbxYfcM9fYOge
	 Hoqc031xCtynD+FWleKpLG202ruaV5NVkgGM4U9Euh1DZj842hcG3wzhnQgdPowBNf
	 4kf8afbW9CcWC1IZR07bo7KGqKzhw/kP7C4mQPRBRKWiHOYS9bhMiMG81ihXm9ajwY
	 qColRczwlXRV+YpCYaVUm//G7Rub6GCp3fojNzavS0v2N/F4BNfaCb/Zwv1Ig405M8
	 H8a8FZ8VesdnDzBiDHqDdRnPsJTWPHn872j+pnQmXP1rEl2AlG7GO1x0r8E/GrNvXK
	 zPkRPD9fCjmhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A71640834;
	Mon,  2 Feb 2026 11:43:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F2423E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4981540834
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwDWVoQhHglU for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F27F9407FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F27F9407FC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F27F9407FC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -382074927; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 11:42:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmsKY-00000005usm-1TyT;
 Mon, 02 Feb 2026 12:42:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  Boerge Struempfel
 <boerge.struempfel@gmail.com>
In-Reply-To: <20260202084741.1557662-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Mon, 2 Feb 2026 09:46:53 +0100")
References: <20260202084741.1557662-1-buildroot@bubu1.eu>
Date: Mon, 02 Feb 2026 12:42:58 +0100
Message-ID: <87ikcf4bi5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=s8eHphqzbu+jrqbo0Eui+vUus8a8wck3zASdRCVvZIEjgJnHURz38MrArtDoOxtmWumeA5YyVWCNzvE10Uz+RKPzteY7qZke7MI8TDcFSSwjAuD4PkPZdaSQFZU+gIbmRBNVR+tiaAEHNrJwDyo4ZoZPQsXwfzuaePgcQvLuXGevmK+BPHYm+z8gaBvWFf3MrIJ7Ba+q33K+hL3HZv3Dwoe3cDECiWjM+xucSwigzQLMO+u0QqVg4mBT5HdRDkwEDoOwsQB+rptDb08nx6OOGtxvoLGxj37ddTdWcbLUR7Wc/6cAUhmgqCKAIYC60h63bjj50IxxNhExBH5lso7lKg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ZTIfNGbdzg3PCKN32c9PIw0OytxRtLBunFDSEfZ+az8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=s8eHphqz
Subject: Re: [Buildroot] [PATCH v2] package/libgpiod2: enable gpioset
 interactive when libedit is available
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
 > ---
 > v1 -> v2: Remove explicit option and always enable when libedit is
 >           selected.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
