Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903D7CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B388405A;
	Wed, 15 Oct 2025 07:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q59g5GMEn_ze; Wed, 15 Oct 2025 07:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E2584050
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E2584050;
	Wed, 15 Oct 2025 07:02:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81F744C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 676246151E
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLw6EYZjo5Nf for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:02:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67509612D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67509612D1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67509612D1
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:02:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1335041656; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Oct 2025 07:02:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8vWr-003Ywp-2K;
 Wed, 15 Oct 2025 09:02:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Petr Vorel <petr.vorel@gmail.com>
References: <20251014183413.645875-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 15 Oct 2025 09:02:33 +0200
In-Reply-To: <20251014183413.645875-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 14 Oct 2025 20:34:13 +0200")
Message-ID: <87bjm8tzp2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=le11lM/j8Xl0jyw+5p9hfyfaCrzxWVsyC9yHC6GcgAq9m89FzyGcIIhjL9A4oJU0bhSHm/HscUYQF+M9zd+DoQ0s4jGcyjtW7RVTAfadxkb7oRDBiIoByhwjQ+epbcWZT6TFh2GUTgOfvmvKYMLibzeLNi9BzNfP/NlEcLPqljfjvTPVTurSJ5JerawRSjs6jbGNpZbEGpaCuvtA5a5czFHFLaMSVfBcIMqphLpyDXNhzIjpMoDPi59SDTcGwTuGVUdK+OQg1FYT/zSFdA0zVaAAB8nIm+y+d4tSr8FUcXbuOEpTMUWk9Y0ckbBa3qQXQAWp2vUnVNCg9XKc+MWR5g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=OlR8NJOXQefKmGox9dF5uAV29Rm92NJumiAfOSSo0ps=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=le11lM/j
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.17.0
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > Release announcement:
 > https://lore.kernel.org/netdev/20250929095042.48200315@hermes.local/

 > Changelog:
 > https://github.com/iproute2/iproute2/compare/v6.16.0...v6.17.0

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
