Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B53DEB64D8
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 05:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ACAA404E9;
	Tue, 20 Jun 2023 05:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ACAA404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykqflv7kG7uy; Tue, 20 Jun 2023 05:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A958B40498;
	Tue, 20 Jun 2023 05:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A958B40498
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 590801BF3D7
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 05:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BBAB40498
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 05:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BBAB40498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJmgxAFMQQfg for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 05:43:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 683A84018F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 683A84018F
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 05:43:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50D6AA4C06CF;
 Tue, 20 Jun 2023 07:43:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qBU9F-0005tI-0B;
 Tue, 20 Jun 2023 07:43:25 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 07:43:25 +0200
Message-Id: <20230620054325.2652382-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687239805;
 bh=2khd5GuIBhpf/D+wHblxJ1l/0lF68x2IRbuMlWq4Mr0=;
 h=From:To:Cc:Subject:Date:From;
 b=tkyEPK2XDKp5aP55/v29cdYQKcYrMZc4h6vIrV4CPrMmwHJcVxIJL32BWOZ0IZkHI
 G2jGxN51SOxZ93GF6e5J29UruAZcOu5+Sjjgbifi03UwK0JLvV+znqvSexoubfTWKd
 9zEcdQwfTFZstlc99g1jX0V38q5vnWajQT2vkW63Mx8yKbnqy63YcY62taR5GjMaQp
 a0zkwkBfIki4ePfe+1XTn5ke20nAkysMLq9tNGGJWhauL+gDCQwepaARiJqwAeOtMS
 /gWSqwHYN2nmuaqGdMAdAPtz7XJta2ifwpv2E+HFcyMHVfZp+yv8K49PNLfi2ajq1O
 0yhwKB3Z4JDfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tkyEPK2X
Subject: [Buildroot] [PATCH 1/1] package/lightning: bump version to 2.2.2
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.gnu.org/archive/html/lightning/2023-04/msg00004.html

Fixes:
http://autobuild.buildroot.net/results/c50/c50fa2d861c634eb0800cf551fc4a7e5fa5752bf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lightning/lightning.hash | 2 +-
 package/lightning/lightning.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
index 97b391674c..6f7c24d19c 100644
--- a/package/lightning/lightning.hash
+++ b/package/lightning/lightning.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98671681d5684770ccb06a07fa3b8f032a454bdb56eafc18e6fab04459ea3caa  lightning-2.2.1.tar.gz
+sha256  0aca8242dead17d62117bcfcb078e6a9ea856cc81742813c9e8394bcce73b3e2  lightning-2.2.2.tar.gz
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 4a8c7e5efd..c23ae9745e 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIGHTNING_VERSION = 2.2.1
+LIGHTNING_VERSION = 2.2.2
 LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
