Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67ACC4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 20:32:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41CA860F46
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 20:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41CA860F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F7C1401F0;
	Thu, 29 Jul 2021 20:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZAp3ndJEecQ6; Thu, 29 Jul 2021 20:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16A4B40135;
	Thu, 29 Jul 2021 20:32:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B22D61BF317
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 20:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1A7B83B40
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 20:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMOWj-TqOXbc for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 20:32:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D62E83B09
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 20:32:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4CB481814B9; Thu, 29 Jul 2021 22:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627590417; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=1DYNf3jkMArPJgz7ejY2sVG2lS4StWkfXtgGPmqFuvY=;
 b=OF12+EPxMGfb2uGtAYJIbM4iQLxYiY84qgbMJ8EVh4BfjlSID4WIqLHH748YI9DgzIGcRL
 HE5ia74Tmn1scFLLf+UG8cPkSkjNoH3JarafP3W+medgHpbSoewftEmIpJmg5ZxRQsxz03
 8ehm2Mpq8mwGxdJrHvpCooq3KSuPsVI=
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 22:26:16 +0200
Message-Id: <20210729202618.59238-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/cwiid: update url
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
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The project URL is 404. Link to github instead.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/cwiid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 9dab5d1070..374a91ffd6 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_CWIID
 	  A collection of Linux tools written in C for interfacing to
 	  the Nintendo Wiimote.
 
-	  http://abstrakraft.org/cwiid/
+	  https://github.com/abstrakraft/cwiid
 
 if BR2_PACKAGE_CWIID
 config BR2_PACKAGE_CWIID_WMGUI
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
