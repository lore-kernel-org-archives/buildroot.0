Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10AFC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A186C414E4;
	Mon,  9 Jun 2025 14:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-CUPIslP-yT; Mon,  9 Jun 2025 14:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF93340BF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF93340BF4;
	Mon,  9 Jun 2025 14:08:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C51831F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7066610B7
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKVLBQooPnSS for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:08:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B77B560B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B77B560B16
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B77B560B16
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:08:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1596261086; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Jun 2025 14:08:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uOdAc-00EFlG-0C;
 Mon, 09 Jun 2025 16:08:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20250608105628.13576-1-ju.o@free.fr>
Date: Mon, 09 Jun 2025 16:08:14 +0200
In-Reply-To: <20250608105628.13576-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 8 Jun 2025 12:56:28 +0200")
Message-ID: <87msah9fe9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=0yjo1/vyumXxerEszaqBR6KHSnhmI2yoVG3hj0YFEQkQlJ7XVpnlBbQeT6ZsDlkYyeS6sSR28xoucE2uOSDdiDZhCYuBNJhg4S34Pf4shkb+wA44XtUgkGSn2uUAIdwAvMyogWmJtsRlOC+V6Gc1XwzfviCBUyLOpZ+wkzMbDmUs7sIrUgXLnzT5uO+5vM+bC8fc6/bFp+U60biELFc9RuZ6tWMxA4ZL+jAoYpWVzUfdPArOs5xF0l2mpc2EQvmUIbUCcCw3ZOst/z67QfMCYQ/d1R6mhcLQKlTtTl2JIHEUHBkwKRKdaOXWM4M+7HJuhWz0i8OQ1TZZvQ/THb8otw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=oqaIKAbOcVepD3FYOApmZnnBPTMxYyDsdF9zop0Lzlw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=0yjo1/vy
Subject: Re: [Buildroot] [PATCH 1/1] system/Config.in: add missing MMU
 dependency for catatonit
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > BR2_INIT_CATATONIT config, introduced in Buildroot commit [1] selects
 > BR2_PACKAGE_CATATONIT but forgot to propagate the MMU dependency.

 > This commit fixes that.

 > Fixes:

 >     WARNING: unmet direct dependencies detected for BR2_PACKAGE_CATATONIT
 >       Depends on [n]: BR2_USE_MMU [=n]
 >       Selected by [y]:
 >       - BR2_INIT_CATATONIT [=y] && <choice>

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/6dc177bee8b7fe1ae1607bd7c0819b0dc63397d7

 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
