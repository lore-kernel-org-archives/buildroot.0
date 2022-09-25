Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BDEC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0409416EA;
	Sun, 25 Sep 2022 20:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0409416EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeMXtJUOS32R; Sun, 25 Sep 2022 20:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82D0B41678;
	Sun, 25 Sep 2022 20:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82D0B41678
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 878701BF321
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62F424058F
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F424058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVxDSM5qDxR9 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 20:40:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5137440517
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5137440517
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 20:40:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 1A05A20007;
 Sun, 25 Sep 2022 20:40:35 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Sun, 25 Sep 2022 22:40:26 +0200
Message-Id: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664138436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=F6ZlD0oIg2zPbGYkQFHWJNmBWF6ESDtiw/4IL/Kuxj0=;
 b=GPzUvCK7X5lxmFOJLwrF0u6KDnBPZqNddMywLqKh0rXmASCdvlsSB+xPP8GDd9/dO/0S3h
 mFOrZR+jNg5LtChfynTowFAeMNei0asM2lCTmYSiVP7Yb+3/a/Rq93dYyrmXuvIp14/i9B
 QlMcRZqeDwNVqD26tOgIwHi58EJDcPYdmH/GpJ7WzRO2tWpZvgO7NBM5/zH1mGcibUOhtW
 ppqu76IH/jKQVsV4zWphKrDL/dNzdS4CsI8Wtq8PgAEZZnwHYLXGU+n+Wpwd3bP15KwehL
 tbSP6gGkjrFCjVxOYoWznCy1h3f6BUdTLwcTT8IQ8cjmTTtk4wns1fKSkfO9HQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GPzUvCK7
Subject: [Buildroot] [PATCH RFC 1/4] DEVELOPERS: add Thomas Petazzoni for
 nodejs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 564149de0f..f82472bbb5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2902,6 +2902,7 @@ F:	package/msmtp/
 F:	package/musl/
 F:	package/musl-fts/
 F:	package/ne10/
+F:	package/nodejs/
 F:	package/pkg-python.mk
 F:	package/pkg-autotools.mk
 F:	package/pkg-generic.mk
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
