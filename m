Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879DFE63F19
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A57782367;
	Sun, 15 Feb 2026 22:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tboc_rgvowtj; Sun, 15 Feb 2026 22:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55A4182357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771193865;
	bh=zreDjD2QM1jlhhbe1k5sD1XGXJr5q7GVvhCSt1i7X4s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9hy537IzjbxKWkyBLKmZY0pKDWuCs1YX/tMK1CIq4Z3AgRq0GeVqQgv6WlakWN2f
	 XepxpI4GNFm/Q+Jy73hHUJC+DdKnOpzz8GemJRrJF8RFAiWKxD7Ke1bjeiiNDiRugo
	 YmUlwc7/XTgrk60hhSR4oqzyfFK3Nl+I6X+H+/2YAgLV89by1e6/urxOVBsEjF3/Ew
	 /deIK+heB/K2n1T0GOXiHNU0URyzooBAndHZRHpXhOPfaH2tekNwsCRPd6wXsiybuX
	 TwsmgkeLSlGJMFHfh9aL/7X8MgGfA4Jt/xLPyJ4kbnXph6WttV26iG2yl654AhDjL1
	 1vqDheMi9d+nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55A4182357;
	Sun, 15 Feb 2026 22:17:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98FCC1EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CD5840870
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZ5Q3VNqF99b for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24A7B4086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A7B4086C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24A7B4086C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:17:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1864917705; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 22:17:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vrkQj-00000009e5X-2p1u;
 Sun, 15 Feb 2026 23:17:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260215141212.503466-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 15 Feb 2026 15:12:12 +0100")
References: <20260215141212.503466-1-bernd@kuhls.net>
Date: Sun, 15 Feb 2026 23:17:29 +0100
Message-ID: <87pl65odmu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YkCk01jRRo8l58JdVeDAO6lrnCuLYw2yOfuQVDJ8K2N1m1q8g1vJBtUwQzk3wDxtaUT755SYd4PK5VNftgc3tiNjPnleAEGxeKxrJiJyCgq1HuBrYJhxcrTRcIerY9YgV/WICsXSdLEeto67Tmv7e2yl41HtB9C40jJfKSXEuFwl6PFvyR2vU4Mk/numzUrep+k8VUzWkzwD9wYch1dq9h1yb+WJfg7aGcOa8JLSAfQC21U34icMgFJsXdd/6EgRAagmTGW9p6JGzL43IXewZU4m1vo9sYoywHf/kNI8/cv9dkz7bJlaH/pcQ0hmXHxSVPJEs3j6Kc0NtdH7btd8wg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ZiXPdIAyOi35Aup9d9df49uQxSc2De1x4F3QVtK3dEM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YkCk01jR
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.5.3
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

 > https://www.php.net/ChangeLog-8.php#8.5.3
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I have extended the description a bit to explain why this is a security
bump and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
