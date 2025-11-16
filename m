Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8E3CCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 20:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8730860BA8;
	Sun, 16 Nov 2025 20:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBk5TauOu4tC; Sun, 16 Nov 2025 20:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FFEB60AA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FFEB60AA7;
	Sun, 16 Nov 2025 20:54:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22CB81A9
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B724066F
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfLZci_UHmWU for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 20:54:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB74C400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB74C400F8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB74C400F8
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:54:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1014452711; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Nov 2025 20:54:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vKjlK-000000012Er-3hRw;
 Sun, 16 Nov 2025 21:54:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251115225332.1826848-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 15 Nov 2025 23:53:32 +0100")
References: <20251115225332.1826848-1-bernd@kuhls.net>
Date: Sun, 16 Nov 2025 21:54:18 +0100
Message-ID: <87cy5hwvet.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Gz8i4IaajK3Ta7Az6xzTs/0vT85iSntJ2Nbin3NRji7pC9Vsb+ClgNsybHrKaJKUOCJzGfEZrf6+T8Fbc3PjgQY8WetZh4DnoEmf74SBHq/vMOdEMZEBGZ7YjUtpj01D3yZ/0PmpEL9XqmfvMhhTXidEn/lUaYKtfv+7c+nUqcOFjx9M10ntd5684kp/QDmOBbr0Z9a3JW1Kv4Fv2swcMU4rDt2wngqobpNiYFspbejwkK+LwyWZBSXTmxm6bN917un1UM266F/1ars6cVuzrmrNFH34LOTui0msnE73M9qigkG6rUwgZvBVtwSjOouH4jsZs2ajLAFGYC3G7TzM+Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=NIaiC7ohWmWpJ5UUMhLLJBZEFAVm1ex+gnJgNj4Mobs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Gz8i4Iaa
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: requires DES
 support in openssl
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
 > https://autobuild.buildroot.net/results/953/953210ed672559e63a96da729182af00ca02c011/

 > The build error occured already in 2024:
 > https://autobuild.buildroot.net/results/f93/f930c7b3219a57421c1b0a0ef3a4445c19b43e97/
 > so backporting this fix seems needed.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
