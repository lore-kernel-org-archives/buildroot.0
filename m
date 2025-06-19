Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3520AC77B7A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 19:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6DF960E42;
	Thu, 19 Jun 2025 19:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZoCSQkgKf9S; Thu, 19 Jun 2025 19:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CA3160E34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CA3160E34;
	Thu, 19 Jun 2025 19:51:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1832AE2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 19:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F25D240A62
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 19:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcHSQh8S0D1M for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 19:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5267140A5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5267140A5D
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5267140A5D
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 19:51:35 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SLILuxAPv8eo9SLILu5kHU; Thu, 19 Jun 2025 21:51:33 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Jun 2025 21:51:30 +0200
Message-Id: <20250619195132.1986901-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMw3zORZb9EsRndQwuzkHnt4YjOY6UsNQ1R8JpHqqIQ7qohT4r6cMjlbgZCP0FMc3Y2KEzIhBN/YX26BBFbEWgLyHEwp8S/uH4rqTurBtIYi4ZYBgKbW
 uQJx5htzZvafP7iAQIheif7g57viSm34sVPYm4NM7ulSJJy+Wn2jkrpVIw/CpDjG08jRR71Xrby4C1ywgpmYD6Nq3FiQmrAHbHSktoTglhJARZy8tvMO7kuX
 yYmEfkRY0MDqWl1VzSaXEib2FRl4gtHRuwN3twPs9XNt71Ei3M2dPRSkXdaKe1mB/uoNddObVw3P8v6szni0ag==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1750362693; bh=2etuyavnj0MzI+hi1+KFL9EekNWB7Fg50qkR7s8TdVw=;
 h=From:To:Subject:Date:MIME-Version;
 b=K2sOgm7z92zkQ5z9fp7IRFboQVZhU0/IHKj1CIe59g6Owv+PkzEtCA+PtDzRE208n
 drNh25iA8JF9V9Arcw10oyoJ6+u8Czs2SF58BSGFLP9D6PXnsg7gsy1ISumIW7u4hy
 TUrE1HW1xKnIgKS75a7DeKGuMYpulXXrSSZEpehyYsFpSnL9VoVrOB9w+3mzybwbfR
 EjfnaAaeve9tvV3ZxsfGGCvumfZZwyxkLgndxlW1lG23BX4nuNxBLx6t3qFIfe+N4a
 xU6YH0sYW5Dll99VPzn0blYoWkGFvtaiop5/xeSvs6AXGR6voQvabj2viC9v//ZWHA
 YZDSWHgQRDWnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=K2sOgm7z
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.113
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

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_113.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 00bc5baa45..7fcb75e6ba 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_112_RTM/src/SHA256SUMS
-sha256  33ae72d43b275957252adc8639e84229d3ae692a57b6191b059d9456b8568a68  nss-3.112.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_RTM/src/SHA256SUMS
+sha256  acef06b512d3bd81c87a63b3c8653d258bb689d2191fc0e64decf5a1efa01c0f  nss-3.113.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8d7fc94207..e7b90a75a6 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.112
+LIBNSS_VERSION = 3.113
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
