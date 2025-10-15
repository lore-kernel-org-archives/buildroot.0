Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD07CCCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EAF8410B0;
	Wed, 15 Oct 2025 07:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJdyC2VUTPzg; Wed, 15 Oct 2025 07:03:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6B2441026
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B2441026;
	Wed, 15 Oct 2025 07:03:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E2EE4C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FADD41026
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiisnXKBAp5i for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:03:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F5EB404CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5EB404CB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F5EB404CB
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:03:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 540896927; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Oct 2025 07:03:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8vXa-003ZCA-27;
 Wed, 15 Oct 2025 09:03:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20251014183658.646665-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 15 Oct 2025 09:03:18 +0200
In-Reply-To: <20251014183658.646665-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 14 Oct 2025 20:36:58 +0200")
Message-ID: <877bwwtznt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=j9FElovNfOM6+DZZaigp+5llkUFqUB2id1KN8qD/zyFK155Dp9lPzL5oGSEeXWssHPEkViMY8fUeSUGa2C/ptNoWNeLM7jwZpowT7m+dewBJXKtpcEZIrukZ3AptLDksgv/5RUWjjxRmIc1TDD4jJUgXytyN5D+eQLugFB0K4eUoo0R3AymHJPqoZI7ciUBlcX6iRbicCS/LXRUpWDhnJbmGBhQbwmpMVpRktgHqpkVPca2gN2MVWUzo/XSBqMmEt1eKpnm7IjbzVGVYXpU7sEzYQJV5QAXgAbppUkFoKIVcVyP2uP9Rrn176qWZYp1ggHsCJTSXdVIfH/ifI7xsRw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Hg/Aj9YnY9F150BN9x2JI/HLmeoY0ESeinj7Wfv85VM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=j9FElovN
Subject: Re: [Buildroot] [PATCH 1/1] package/ipset: bump to version 7.24
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
 > https://ipset.netfilter.org/changelog.html

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
