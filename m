Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727B9D11183
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 11:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD91409CA;
	Thu, 27 Nov 2025 11:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0BtJMLD813G; Thu, 27 Nov 2025 11:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01878409CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01878409CE;
	Thu, 27 Nov 2025 11:27:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52CB7DE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 11:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CB9160749
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 11:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9B9MALUShfDK for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 11:27:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 155AA6065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 155AA6065D
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 155AA6065D
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 11:27:45 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id OaA2v5McVwf0DOaA2v83kt; Thu, 27 Nov 2025 12:27:42 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 27 Nov 2025 12:27:41 +0100
Message-ID: <20251127112741.1286591-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHbZpmxPaOw+OiX6b8RnSc7ucW+7Rdp2JiysUkuS6i14PCTsBSxQmFz9oVU436knaXfn6OWgac1NcVk51+EuN0qZicioy+/N7KdlZWN4bWpcy3xW8o8m
 5aPZx26Iq7x4B9AV0ZT00bey85kMx5SXgfmXW7IN1/KIK3bCNnQ641bcue0JMUeZoSjYKevv0QvPduvh38oxofcMoBj/owNvdxnxiJMkat80Bk/mUKS59H/G
 zktIudaj+cPlMRDNmoUgf5fg/p6WZQo3Jb/Sd1r8OQlGUlsiUQucOi0Wv164ZhwXtS9IoOgHPd1VSIBBrIXnYRqIHVcs70Jgz7MER70B+Ro=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1764242862; bh=M2GXhF2Bi6gBARb8ai47eHnw/rVo+iBESrKGQl5a3XY=;
 h=From:To:Subject:Date:MIME-Version;
 b=lVeVgWoJzN+vIXa0HD6NhVCZb4g1DboPiOFHJGtFFK3wK8ToXXrFzlHNwmDbs5w2v
 vfqYtmx0hxQF8NCr3O/1np2AI3xOBLsdnX0iBy8f5HYcLF/A20/SZPyrJ14Rlzid41
 EnZJwkUbRogcrM2Sn0ZZa3vzfNJs7GzmZ9u3sRIbej4hZJGqQ7OeTbr/GNNjPrdbLp
 gdyfltL8x+j+f6vPBcjRSuEUObXE2YYDL3WJDSTrgAAPTEeEdIstWjYhNUfK8WKjtE
 rOnmGKP1GUGeFj7Pcor4/bdXldh0gD12tq9oLHiRM+9ESRAIXS+gow990oYVuHwFSj
 gEiGWnhwpMxyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lVeVgWoJ
Subject: [Buildroot] [PATCH] package/liburing: fix wrong tarball hash
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

Switch to github since git.kernel.dk is not always reachable and actual
tarball sha256 has changed.

Fixes:
https://autobuild.buildroot.net/results/ddf/ddfd0bb8f5623a1ce7aa4168c5759b2c54a933da/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/liburing/liburing.hash | 2 +-
 package/liburing/liburing.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index f06dd187a7..c6cbb2a7de 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  78bcc0dc0d004a238d8b5f597adbb4ec74926352a3983b872db7f0efdb72565d  liburing-2.6.tar.bz2
+sha256  682f06733e6db6402c1f904cbbe12b94942a49effc872c9e01db3d7b180917cc  liburing-2.6.tar.gz
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index fc3993b38c..7236cb162a 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LIBURING_VERSION = 2.6
-LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
-LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
+LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.gz
+LIBURING_SITE = $(call github,axboe,liburing,$(LIBURING_VERSION))
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
 LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
 LIBURING_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
