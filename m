Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D478AC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 946ED60093;
	Thu, 25 Jul 2024 15:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7v25AdkTrmM; Thu, 25 Jul 2024 15:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB3CF605C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB3CF605C8;
	Thu, 25 Jul 2024 15:30:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D67BD1BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C54AC80B47
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgTrEnt2pnSq for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE27A80B09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE27A80B09
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE27A80B09
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:30:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0QJsTikQxmtuX0QKshxd6; Thu, 25 Jul 2024 17:30:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 17:30:28 +0200
Message-Id: <20240725153029.613254-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725153029.613254-1-giulio.benetti@benettiengineering.com>
References: <20240725153029.613254-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEpr23CZfrKbxUOYnQ03WTr9m6uG1j4ipyCKoj5Y62dZbdKIifE0iW6R881r71xnDQ9S7YIvPiLmUgg22GPuRwDoAJmMfw+4Lq3Pk+cbko+12ZrcWUNw
 GdFRPaAdFXCXCHk1EjpZIx1/J9Fpj+fZWNwoMEFUS8rFkXZPEyeuPs0obPWn5RA5fEH8UqsEOUi+JBdXwY7XGTB5AW7ZuS+HIzQtibystpQNxk/PZMtd6Nyc
 WG65JiqSuDlk2QeGKrhiM2RkCXngpY3xLeLFM3DgwSo8uNXYSAy1eF84ib9iidVCKIjEtfkz5S9QcBXGpjHS90Vp5n1/zspBuVfGKPJnqRQsuSVFN0F2mVAF
 z8/TimFn
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1721921432; bh=PUWmL6h0Bf1zeRYlI25KB0ATlTlVfEYCj1he+ot5uuo=;
 h=From:To:Subject:Date:MIME-Version;
 b=G3OHZ9Nna2chaTPe/xhspmWCi/SVKow4cpBEidU0TJtH7mTIYL3Yy7MiQpuSqn81v
 QNAWUzOcdZ7J+2UnK+ur6OoNES7Yyc49qkopcXA39ih1syHqV99qfrbrV+NS40EkCZ
 DvSWrbPN3BaZbNKxSQYz+fwrYOokyOV1rHqqfbkynzCqRLp7CHr03C3e3I8dH2lDA+
 QvnOM2D2WnhRDdu7QVqk/X8FABn8ptilPyb1K/YlNrolaH/8zKiUlO8ecou4ZIUq+r
 CBkWwo9Tuxsgds/F8F/0N5YxgAxPfRdiQ4QZHWer7Llrn1xrR1mFtGhQ3dhc0cVGtA
 +px8psC1NKYyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=G3OHZ9Nn
Subject: [Buildroot] [PATCH] package/libtraceevent: bump to version 1.8.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtraceevent/libtraceevent.hash | 2 +-
 package/libtraceevent/libtraceevent.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
index c338491f26..d59e0a9188 100644
--- a/package/libtraceevent/libtraceevent.hash
+++ b/package/libtraceevent/libtraceevent.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  919f0c024c7b5059eace52d854d4df00ae7e361a4033e1b4d6fe01d97064a1b9  libtraceevent-1.8.2.tar.gz
+sha256  233d88adf5bae6b4511980f0f6314f348326b55fdb3dc9c4212c810e1ab06789  libtraceevent-1.8.3.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
index da0aa575d7..35e1152d37 100644
--- a/package/libtraceevent/libtraceevent.mk
+++ b/package/libtraceevent/libtraceevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEEVENT_VERSION = 1.8.2
+LIBTRACEEVENT_VERSION = 1.8.3
 LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
 LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
 LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
