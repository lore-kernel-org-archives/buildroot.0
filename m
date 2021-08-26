Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6280C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 13:31:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CA4608FE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 13:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83CA4608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4293540702;
	Thu, 26 Aug 2021 13:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dP4xnvQDyBWS; Thu, 26 Aug 2021 13:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 922B2406C0;
	Thu, 26 Aug 2021 13:31:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2FB1BF391
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 13:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B748826F5
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 13:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjTfGYF83f1L for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 13:31:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3C7081ABA
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 13:31:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC7411814BD; Thu, 26 Aug 2021 15:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1629984665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language;
 bh=da55QiQEX7jMuyDSTh54rCXS1OYImRyeA86yzLuAnK8=;
 b=FIkK/Qx6jE4enmycW2icU5C0iWl0m/nqn9I6mfumlSD545tR1GiaObo0raD2m88nbv6HfX
 8nFM5/bDGfid6TlL5c5A0JvtLm7JvgVhho5Auvzhi30gAgkRirkL8fWuIbqkkYK9wZsb3/
 razCA7w4zbnt0I91lrN8fYR8f5ZGRUo=
To: buildroot <buildroot@buildroot.org>
Message-ID: <c323622f-97ff-8db9-f946-6d7cabef60dd@heine.tech>
Date: Thu, 26 Aug 2021 15:31:04 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] Feeds on buildroot.org page broken
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

(Angelo i put you in cc because you were the last one tinkering with this)

while changing the link to the ML Search I noticed that the nabble 
archive is also referenced in the buildroot.js for the feeds at the 
bottom on the page.

We could use the atom feed of lore for this too. But currently both 
feeds are broken because the CORS proxy we use is prohibiting use for 
non-demo code.

So both requests (also the one to the git feed) are returning 403.


My webfoo is not good enough to tell what would be a solution to this 
problem. Is there maybe a similar free service? Does anyone have an idea?


Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
