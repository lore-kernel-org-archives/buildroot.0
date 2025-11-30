Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF673CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 16:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F5E403EB;
	Sun, 30 Nov 2025 16:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVEolARlEAvX; Sun, 30 Nov 2025 16:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7DFA409DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7DFA409DD;
	Sun, 30 Nov 2025 16:29:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A8D351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 16:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2536380AC4
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 16:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zN-WRV7ayVG5 for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 16:29:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 137C780A5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 137C780A5E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 137C780A5E
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 16:29:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1462124010; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 30 Nov 2025 16:29:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vPkIl-0000000EFaV-3lKl;
 Sun, 30 Nov 2025 17:29:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20251129150114.2732552-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 29 Nov 2025 16:01:14 +0100")
References: <20251129150114.2732552-1-bernd@kuhls.net>
Date: Sun, 30 Nov 2025 17:29:31 +0100
Message-ID: <87cy4ziivo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=y4KOxP6T/tQ9IrLDKhDAbSbd3zk5Iq0G8jQEDYTt5bh7Fn4I6fRsMIfE9+Fv0ORBCtcteC7nRWXe2Deo0FysN+vS8iUAOuI1DarYF452GLCzYYwCYsr43nNPrSEQ/nYYoroermAUeutzQq2ig17R4ucGIt36ObzDb5tzACvriIVsXmTDLaMcmcRcPo58p6jznHgJsrTDuPl297NHeZEAamaMhEldYOZFnsOsdklECApB4/T15Viud2SNLbtsmerBPlqRaxPpGXCgKqltsoNHtbzdnFZPf4fxyRt8iQNXQ8TV6lvFULsqARGrWv1NOESrI3vkYIGgmyiNV5xn2oFEsw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=HLClw5420QP8BGliUmh/ptReX304bH9CgHVArZyIMQ0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=y4KOxP6T
Subject: Re: [Buildroot] [PATCH 1/1] package/sbc: fix build with gcc-15.x
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

 > Fixes:
 > https://autobuild.buildroot.net/results/2d1/2d16eb4bb0c7f095d0d52af8553c498f6f9a295c/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
