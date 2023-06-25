Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FB2EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 16:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3D78404A0;
	Sun, 25 Jun 2023 16:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D78404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABEopEwqxmHk; Sun, 25 Jun 2023 16:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F07114016D;
	Sun, 25 Jun 2023 16:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F07114016D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE4D31BF3A8
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 16:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D50AD607C0
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 16:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D50AD607C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJUlyviIIV-h for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 16:53:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6495860758
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6495860758
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 16:53:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3580A4C0333
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 18:53:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58216)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qDSzc-0002L6-1U
 for buildroot@buildroot.org; Sun, 25 Jun 2023 18:53:40 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 18:53:40 +0200
Message-Id: <20230625165340.306760-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687712020;
 bh=bk8wt9Ksi1a3UEaYEFDHcEXgXAtISSgMs+gsNBY0Ro4=;
 h=From:To:Subject:Date:From;
 b=S0JQd9BOrzBhlvAKmO8cTyhSOnkfLislWf3zgACwTRj4wrv99t9RxkUOmuCNF6DHv
 MMuzfxRqikleHDBUOQCVQJo8545YCSZWVnF/6R5YLnEPrxZkexpxMLKdwbuSiWlx0q
 2gOVK1eWV3bplhKhtYK4I4qPe4KbMsxyDHSnIX4bagRCYC4txH/gPxvs0k9+QUYX8x
 CO7AbrVyGuq3cb5bMKcRxy/DkM1TW7CHkG8igiLGFEiuZF2eHMqhSLx/ejlh+ezS1i
 SjTCwpuurH273nejORsNS7RuVqmtNW7o7HRrhdnlILR63OvUivEXcka9zOJRdvSU/S
 29hCTCNjEadng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=S0JQd9BO
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xorgproto: bump version to
 2023.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2023-June/003408.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xorgproto/xorgproto.hash | 6 +++---
 package/x11r7/xorgproto/xorgproto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index 10655f9dd1..37ad9c7c04 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-June/003404.html
-sha256  6545e41aceba43c13497ac8084dad5db6deef580a5ea7d0bd7872cfd1be72a13  xorgproto-2023.1.tar.xz
-sha512  342128ca2e9a6806a7ff33f426434bee29626a13a592b9544654a010cb7be208b0862e3cd063773a0003ca0ec7d48361cfcc384fe207efe9ecb6ec3f2b8e7d56  xorgproto-2023.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-June/003408.html
+sha256  b61fbc7db82b14ce2dc705ab590efc32b9ad800037113d1973811781d5118c2c  xorgproto-2023.2.tar.xz
+sha512  af0a8c8094fc6a490a886a8c048175762b6334798f2e48b6f6e19a7bb39ddbef05fa1237c4e9d9f1d870d24f5ca7a7c463044c41ceebd108f8ab0816677a582d  xorgproto-2023.2.tar.xz
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 899f505f1c..f6e5a5a434 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2023.1
+XORGPROTO_VERSION = 2023.2
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.xz
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
