Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99521E73146
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5725E40945;
	Mon,  2 Feb 2026 08:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSXbaduZxRV2; Mon,  2 Feb 2026 08:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E5FA4091C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770020666;
	bh=3Bjj6xrPRYNCC3RUt5IHOwbDFoBVDZ/x0U3GVbKu/O4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kb7BOYPCPhgX7eLLlzwobTdxLob/kTl6L5hpBNhe4euGyx8ZxcxIa9NoqpPNM1Vu2
	 M+d3epSlgwrWacYjfuXjfbPlRA/Qqrya/cIGQPCtAhvino95H/9e2iU94C2TM07D90
	 1/eIAf6M+Ddnk0mOOSHQMS7MQR6puq9E4cnJo+5+g3qs+76hPjSBaK5tUQiLtozGKm
	 EsGq8/unPQ8ZJ9m1Lq5149I/gHPwnR5wZhAm66gqz94RQk/HAOPASNN2ByGLJEOiPH
	 NAYq8oc/Ja0zD4Y0WZGIWkw3nDNJw6Ct3CPu0dXM6E0sMh7POtw+wNZdhYOFE1L6ti
	 1fcZ44StCuFtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5FA4091C;
	Mon,  2 Feb 2026 08:24:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 431F4149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CDD9401D0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uc_vvexws-Sd for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16FE84018B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16FE84018B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16FE84018B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:24:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 159376985; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 08:24:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmpEI-00000005oK2-3q5F;
 Mon, 02 Feb 2026 09:24:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260201184202.3605253-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Feb 2026 19:42:02 +0100")
References: <20260201184202.3605253-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 09:24:18 +0100
Message-ID: <87pl6n7du5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=a69ZOdBNUryOLXLQol6bOWHkc/OsQ5hu50nzL1jcbqlhOPM8u/7FDa/A70rzXVW7TyVS7Db1bKT+ehbN3JL5BprbjpuZ0lqGpwQ7BcA70VgZ1/oH3UcY+T7PB0l0i75nbsuPcHzz30FRZpMGr5klN/kLKWqcHJEbzDRWpd4rWflENyehgOXRjfAQXp6C3kyIRO8bdkYT1cUROYuyp0J37PKGos2vzgtgy9KNzM+l+Huw9Vz1IzzOep6DeDJTBS3nUIbj+mRA2Qo/AeqVUpuIR7F7/X/l8+7CUvcaHLq0QqgPPsciRfeIUsAQlerSqp0tBC6bWHFxAcXXvBDaqvrnYw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ES8M5TomYiGch2aSfd+GrvSL1/emjKEUv0S5UfbCQsk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=a69ZOdBN
Subject: Re: [Buildroot] [PATCH 1/1] package/libgcrypt: bump version to
 1.12.0
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

 > https://dev.gnupg.org/source/libgcrypt/browse/master/NEWS;libgcrypt-1.12.0
 > https://dev.gnupg.org/T7643

 > Updated license hash due to upstream commit
 > https://dev.gnupg.org/rC67b8da4ef62734927e061327efa9a6f48616d114

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
