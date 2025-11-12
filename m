Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D38CD3445
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 19:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C45C82F8B;
	Wed, 12 Nov 2025 19:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRLBUsX6wdD2; Wed, 12 Nov 2025 19:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F57282E9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F57282E9C;
	Wed, 12 Nov 2025 19:26:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39771230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AEE560E37
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2puGYEADFPic for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 19:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B46F60E46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B46F60E46
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B46F60E46
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:26:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1042566322; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 19:26:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJGUE-00HXY4-2z;
 Wed, 12 Nov 2025 20:26:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251112184357.3358550-1-bernd@kuhls.net>
Date: Wed, 12 Nov 2025 20:26:34 +0100
In-Reply-To: <20251112184357.3358550-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 12 Nov 2025 19:43:57 +0100")
Message-ID: <87y0obrr11.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=RXUz27sxiLG+uAYClAjWEujNpYRQf9MSYPvMAxYsYaKWUtgyZckvEnaZtv40CmDW4Ksa/JlxBe4r6kCUXuQWAk+zlDN4VlolYxRHst1aWmCnn7h3vNWFhwH4CtObe75svrJrC7ZQIqpIJ0bLqH3Z3KLWlpZUtgijhzSOrhLfp+p/SuFsDhQ4Lho2kDzCW4FlAKmc4XH6Om/kI50jaghIeucsuQ4BuNObkxCXYpfiERicv/9KzIG054/BHYTyzvhbdGbUPoy/iXnyt8aR5zAVLywFX04J/XOhDI8Tyr/BcGYf6JO9MslG0wMXyOk6Ndr/iKXZGUpyZyjeWYIud7+cdg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=mY7yPXPt7rm58vdtMl6a+M/q2QOCb8LmcGyi/1F4Lzk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=RXUz27sx
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.20
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
 > https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
 > https://forum.torproject.org/t/stable-release-0-4-8-20/20781

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
