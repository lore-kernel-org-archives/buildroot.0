Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005F5CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 21:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A676C60C11;
	Tue, 19 Aug 2025 21:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBuSmrKAtGSk; Tue, 19 Aug 2025 21:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD1AA60BDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD1AA60BDE;
	Tue, 19 Aug 2025 21:32:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65E95E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57BD44096C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLXR9V2NbKdC for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 21:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.68;
 helo=smtpcmd0768.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3CF3408F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3CF3408F4
Received: from smtpcmd0768.aruba.it (smtpcmd0768.aruba.it [62.149.156.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3CF3408F4
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:32:26 +0000 (UTC)
Received: from localhost.localdomain ([95.168.120.45])
 by Aruba SMTP with ESMTPSA
 id oTwOujEf3t6p9oTwOuvLkv; Tue, 19 Aug 2025 23:32:25 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 19 Aug 2025 23:32:22 +0200
Message-ID: <20250819213223.905321-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOV3e1OoKL7QDKzjAOAS6qYKJMncvrV7a02vEIGMDo4c7S/OlZ5v8rHJr3kLeyR8l97R4gOfiuTOU3s4W7Nb1HHIn7QYKXSnai03iGe+Yp97tMDWwTJu
 aSw8lHHDENq9Ru9WvVr2SYVxL1lLtZBV2q1JYD+ZrXPlIZNtZK63VDkU7stBZf6fFSrImyV5nGhkFiWtPVGpjqHBqRFI1zYs78/uPLsVip/Fw6LTWmCvkuR7
 JwDcB6G+ZeNk7Lem2eztuNq6tKEjLp50MlEoCPYk9jDE9TM91LPdH/WyIL21myMQXi9Mwr/EE8hJaygi8Sp9lw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1755639145; bh=27mYcJCKNd0ZlqI/D/PbMp7dV7kiOXK6YwpOyDgupbQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=UT3K+Y/KrZAKDn3HgYbIiLqy+L/XwXYd7PpfFlxDLaf3IsEVazzGzo3uXl+l4uoVu
 5W9MwrT3OZzI0yYrF6eGjgShT/gbhvpO/ePamMQH+q2IiCHsZQjA1pcnOLXU1rQYtK
 8x0jV7muNInPcs7nTfzzRdgzqrh5eoNkWy00QjJuYfKGn11TYpMPh0tE9fDfVb4gyI
 FdfJIirFD74BXBW6yyPh5Yki1y3vGnFyHh2BNLQp7PRPVLaVi0yf4wxuQyxJTaTbn1
 BzRMg5FDHa199nD7+5DPJ+WEUbDmWsgsKrZPQrHIJ3NzyEkQ0YxL1dVVGPUFOOiQi9
 IiHpx8c7ydC8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=UT3K+Y/K
Subject: [Buildroot] [for-next] package/harfbuzz: bump to version 11.4.1
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
https://github.com/harfbuzz/harfbuzz/releases/tag/11.4.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 91fd8afe6f..3085b8aded 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1fbca6b32a91ae91ecd9eb2ca8d47a5bfe2b1cb2e54855ab7a0b464919ef358  harfbuzz-11.3.3.tar.xz
+sha256  7aafab93115eb56cdc9a931ab7d19ff60d7f2937b599d140f17236f374e32698  harfbuzz-11.4.1.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index d8a20bcb09..50ce2b6ada 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.3.3
+HARFBUZZ_VERSION = 11.4.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
