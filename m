Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD73CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 08:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03EB541AB0;
	Sun, 24 Aug 2025 08:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwMIB--WFEm4; Sun, 24 Aug 2025 08:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EBD641B74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EBD641B74;
	Sun, 24 Aug 2025 08:05:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 927A61D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 844C461719
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HYBH4amcjfp for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 08:05:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.128;
 helo=smtpcmd11128.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 760126169C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 760126169C
Received: from smtpcmd11128.aruba.it (smtpcmd11128.aruba.it [62.149.156.128])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 760126169C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:05:12 +0000 (UTC)
Received: from localhost.localdomain ([95.168.107.28])
 by Aruba SMTP with ESMTPSA
 id q5ivuKRIbtr9dq5ivuLWlz; Sun, 24 Aug 2025 10:05:10 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 24 Aug 2025 09:57:39 +0200
Message-ID: <20250824075739.386831-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPWhGqC2+KGmmRDAxZWzFSdgwTALMfeiCgW7PlyhtWQmPEJjz0l4TmVUnQHNLfibXUH0fANiOHRS8QgNFvKIPdEvGREA5fjKW1n0j6bXMPL3kATeHBjj
 y6gIRQ5AfgDibq7XmQWq9GXKWvSCe0nQsczYP9kJMa6AoHFTsuWo61rov2vWfnQiFRjFChmge5r+Nu818UDEWkHoK7q89wc/xjaQIGcY+/YbOxMf0DS09QYw
 JyTvXREDGBMoB+kA3eXQGuVrsOmaAlseLlB/Uk9DKp7tyA6Q0Gz2XKGmpxJvKuc5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1756022710; bh=pvUnpiayK0yufv8eQ/0ctMfo75gSDTzV9E+UTxblQZQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=MQJANIx7v/f1blThuHXomGMQ+1HVmvZrA7fpcmYnOY8kiXfAjeFCXIqRu1dH3JuwK
 yWTDqvTa6uUoOwKANLNCWJZclnF9wPtKDEStX2NJ1yQhb6kX/7/+Dc+hsw6+nRGh0L
 Y2QdM9P21nGHpF1pdTkaRZVVvPCH6RS7Te5/reaN7oqeW/TespYN5aPVHlQ483Ezbu
 i43q+5kAtAhC5VxRzypQ7Zr3lJuVNDusSmp7aDS1M43J0FyVR8lhbONLO0rBWfUgtK
 bAKkfPYKd3O3vfjdpyOlurSliqKAcO7RM6XngtzXTUpMJH3QDsG0Kx2BZCyw1o4oza
 AWk9RHIfruLbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=MQJANIx7
Subject: [Buildroot] [for-next] package/harfbuzz: bump to version 11.4.3
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

Release Notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.4.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 3085b8aded..463a37d22b 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7aafab93115eb56cdc9a931ab7d19ff60d7f2937b599d140f17236f374e32698  harfbuzz-11.4.1.tar.xz
+sha256  6660415ad48fa1a46e4fa75fcdb70ff819c452153f08677d34ffb29eda66415d  harfbuzz-11.4.3.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 50ce2b6ada..103ab7a6f5 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.4.1
+HARFBUZZ_VERSION = 11.4.3
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
