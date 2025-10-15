Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0DCCCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE10A84051;
	Wed, 15 Oct 2025 07:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuLjfQk3rqmX; Wed, 15 Oct 2025 07:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18CFE8404E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18CFE8404E;
	Wed, 15 Oct 2025 07:02:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E62F11BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D72FF6151E
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5IiWPczjyHw for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:02:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CDA66612D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA66612D1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDA66612D1
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:02:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1123878212; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Oct 2025 07:01:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8vWI-003Yqw-0W;
 Wed, 15 Oct 2025 09:01:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Karoly Kasza <kaszak@gmail.com>
References: <20251014183039.644968-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 15 Oct 2025 09:01:58 +0200
In-Reply-To: <20251014183039.644968-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 14 Oct 2025 20:30:39 +0200")
Message-ID: <87frbktzq1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fg7tISiDPeQR3gdp4MfoCjsiK7NgsSRDTBeQ7SqFZbXqYz1/RMHNLDnrVA2MTRn1Sc2+52kbtPFWsWEbq3v3QpzidwTqmD9rWuKCJWRB8SHVHGvHLYVXJxW8ZWydNy90Al4JEC8CJWXYUZYSEonF49Psnk2exXO+yLfjOTTrBuKGiDehMUfXcbs2taIdp7cXYlnlZP8NJPx45WaJLPgSdB6aWiQrSXqFPGrx8abYCz/ij8hz3+nbJ/KS5Rcnbw93cSP9WQH0pwI33wdJRThaq3g52vF0URv96WsB1Bah55RrU9e6p3vdXG1Hw4/Q2sLQKcWWMf3nwvBcE8Tzf4bamA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=OvRng4cy1KAJ7YGa1EBA/QrIBKlh3/ZywG/la4GEvbw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=fg7tISiD
Subject: Re: [Buildroot] [PATCH 1/1] package/irqbalance: bump to version
 1.9.4
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

 > Release notes:
 > https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.4

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
