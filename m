Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B21606A329
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UTQIIYkj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=Fx2g/42o
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE2E405DE;
	Sun, 15 Nov 2026 19:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w18Ih7-Hup2b; Sun, 15 Nov 2026 19:21:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 47BD6405C3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794770483;
	b=YMq/u5EKsqaR2lfo/ZLvM2ObhWueo5zq7DibLGjAwKuOfkhFNR/JEllmCBGIuN2n54/H
	 QtZ2zsVl+RCa6ugcDK/LBAt+EAA9Z06kz9Uxb81N7RiIxkikR0rYstNzHrPfG9Qs5cQF7
	 iHMWbVvNzeL4eDWje+GBVZreNftamXNLEIVkZ70GYw5vnqMUJK4XVszs8W8NC2iTa6+aU
	 7gVbZDIjLyxF9ddEA9k97B2doAg29wP+Wdv1hz3WuClbBHCYlajfZ3LO3IBsreHMz2enZ
	 1nCTYHMgLlU7gGr9hduDab+hehSWbeNfNapf9hGCzyILQKnXFQzm5oOn2AgqWt6dq8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770483;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ocOsN4f9a3MbPYVbq0GPqlRuut6cc5ca9GOAx6ppVYw=;
	b=j5lN4TR+z+DRUF1efqxX9IFT/FK5yFRMJLuPFIXd4wngtVQ6ctgxv8X0bcN1hckaqfsF
	 wuZvXCHyv6YXo6oywhoMd5lmu8KddvOM/B/FPaAQMnEGwgrsUCmosQMJ9aUAq0aUjtzgn
	 zipTvOtj30VngR/O3ZMivs3WqAn+aSfek83x0ObibdzNiN6qBj77Em26RQ9wv/0PYtUsc
	 BaYn4cgyeEOo2Bzrw+TiyHN8hwhxxTQHe/feeoir6LpqmacMCCq204hROWWvsXcq75dRm
	 1XrzRAKycIOtWY/uUTxEAmzjwIIQ1Q/yAUeLFH6E2tnLMGNQgfvGTMlJ8hXYstO7Hmg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794770483;
	bh=ocOsN4f9a3MbPYVbq0GPqlRuut6cc5ca9GOAx6ppVYw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTQIIYkji2KALoda1iyuXUE2U9w4tA2CvE8HDekL7tf83NA097TtzYgzZBSmLk3sW
	 WWyUGvj0UU4owpYXCC8DQlWtKr5V8HNUoBEcXoaNcSNEGeC1rCS255EKGSekZBzCmk
	 r4OaCR2xtSakwDhrHsUM4qBpR231TvjbQODqze54cls0OeTe5/nQJy9O4P9HwFxFIk
	 SlRwfk/Q5AvMY+J7KOfkiLE9WCzXS5SLFck6eTvDt3GcrLKW2jZWqdQQlkRjZlpJ9g
	 QQfLG/dx9z53q1QRM7P76/HRFtJcvvKzWBZ/H0wTuXzFkctaYh0RmesUnJhuxlg9Ny
	 N3I1ZsdJLyE5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47BD6405C3;
	Sun, 15 Nov 2026 19:21:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F3CE109
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85C6340061
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48XTp7awYwZZ for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 19:21:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B642B40048
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Fx2g/42o
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B642B40048
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:21:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Fx2g/42o2jHxbm2GghjFEirzOPLTntzMkyScy/SLLW9aSHckTxDLXmZovr+ZGAW8fCGy2b65ro6NweE+vIt5jOwF9jfQGnc+1Lj/SwAwHyOLF3IWpt59yoMhFYUhF/6hdw+3iLyA1YBdy+H+LtH2cONenEnqKDIK7jpPamPSSntW/qkGK07mVTPzibVrpPUMiRfeEIvldtCkbBG5jxYbEx8z3QelncFg8fyLnfJRDLolCPpfKKjvXJ/clafl03PeD9hkS8rk0uiPyME3mWNFB8MtMVkU/1HLPIM/iCMn6JTOTodq64dfAP7Vdi4wWKxxgoH3vZKYCm5+teucPlqY6Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VOebLbQU0nLmulGGh0pnJ43NDCHnDKMpOAhOJ3u8/tI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -122132186; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Nov 2026 19:21:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSfmv-000000002KV-2jYX;
 Sun, 15 Nov 2026 20:21:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261115123005.1448809-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sun, 15 Nov 2026 13:30:05 +0100")
References: <20261115123005.1448809-1-ju.o@free.fr>
Date: Sun, 15 Nov 2026 20:21:17 +0100
Message-ID: <87bj7p6guq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_syslinux: fix
 test by selecting BR2_i386=y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Buildroot commit [1] changed the default CPU architecture from i386
 > to Arm AArch64. The test configurations which were relying on the
 > default i386 architecture are now failing.

 > This commit fixes the issue by adding BR2_i386=y to the test
 > configuration.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158062
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158063

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
