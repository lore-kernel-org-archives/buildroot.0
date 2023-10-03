Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF29E776DB
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 18:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B0794012F;
	Tue,  3 Oct 2023 18:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B0794012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHPxMEyZCc7R; Tue,  3 Oct 2023 18:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7E27408AF;
	Tue,  3 Oct 2023 18:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7E27408AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D27B1BF95F
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 18:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4662960EF6
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 18:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4662960EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGyYIHYxUC12 for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 18:58:45 +0000 (UTC)
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42ABD60EF1
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 18:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42ABD60EF1
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id nkbRqzDuOG819nkbRqzfZM; Tue, 03 Oct 2023 20:58:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 20:58:41 +0200
Message-Id: <20231003185841.3613075-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMUeRFba8qvQtz/+PZBSS/ciEvzkvdOahNPbzKKrDpBjgq/eCUe9GFcKq/33ShwjtyUXTVUQuWVn1kWiMpJTgSw9f7Q8mrUfj8vPgJb2vdvF2ntVFWZU
 Gc26sS9X6jlBlwQRtkH0WcW2EhXzYkxbE0ah9eqHt1i4viYxjXhahMqo67tBVxGDqAw5JX9N4cGu7oYKXxQwZZdmZVI6PW4T0qm2KQ9SjxnFlIux5cjx7xZp
 s5cveWxrJ26AYTJO5AZj6dyFcQw87baOQjFtkuMCBhhEpB7zuY7VRB8jbmvBxDZoIfJnV2VLhZFjfnAtAydXqQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696359522; bh=cTm4HlYWKzPNrjDlwWWG4BBrZZVWXef3GIeiVgFQ0hI=;
 h=From:To:Subject:Date:MIME-Version;
 b=PciUzQgukca+fhWVNHHXDxSTMY9vuXCNAQOw9hVBpzYUsXPeKQQeKCurLCojrye+s
 yWjqNOKKXgv7OVJU0icLyOwKO+cw1qH9a4WG0qSu2xdizRLUav+lg2a2+4SBTM0EJV
 Cs/pWBE4EH+b/krs3g5bfHuXqwdTS5FxQfeeop/2TtxDfH/S8gry3/5z30mJKjDRml
 cdy3aiDhzQigM551lLUyszdoEIOE0vYNqV3Jvtp/xQD6AAIIKVoCkdJkHHvURxfiEU
 b+RPZ8OFvWlj4gxvcLYJTM2hCXNeFXeArbdO+jZwoS11Bb6wBK1vMX21cXRb1SUAMx
 ounuTyhGXJugQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PciUzQgu
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.94
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index a3b98b0f8c..50889f8d13 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_93_RTM/src/SHA256SUMS
-sha256  15f54bb72048eb105f8c0e936a04b899e74c3db9a19bbc1e00acee2af9476a8a  nss-3.93.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_94_RTM/src/SHA256SUMS
+sha256  463ae180ee9e5ee9e3ad4f629326657e236780cc865572a930a16520abad9dd8  nss-3.94.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index abdce32efb..51694c77bf 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.93
+LIBNSS_VERSION = 3.94
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
