Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14410C7115D
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 19:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94F89805D0;
	Thu, 19 Jun 2025 19:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YmV1iX4l57k; Thu, 19 Jun 2025 19:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3F8E82090
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F8E82090;
	Thu, 19 Jun 2025 19:51:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFD01E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 19:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E09EC60E32
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 19:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XofxG6P-y5Sn for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 19:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5251B60E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5251B60E23
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5251B60E23
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 19:51:36 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SLILuxAPv8eo9SLILu5kHc; Thu, 19 Jun 2025 21:51:33 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Jun 2025 21:51:31 +0200
Message-Id: <20250619195132.1986901-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619195132.1986901-1-giulio.benetti@benettiengineering.com>
References: <20250619195132.1986901-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMw3zORZb9EsRndQwuzkHnt4YjOY6UsNQ1R8JpHqqIQ7qohT4r6cMjlbgZCP0FMc3Y2KEzIhBN/YX26BBFbEWgLyHEwp8S/uH4rqTurBtIYi4ZYBgKbW
 uQJx5htzZvafP7iAQIheif7g57viSm34sVPYm4NM7ulSJJy+Wn2jkrpVIw/CpDjG08jRR71Xrby4C1ywgpmYD6Nq3FiQmrAHbHSktoTglhJARZy8tvMO7kuX
 yYmEfkRY0MDqWl1VzSaXEib2FRl4gtHRuwN3twPs9XNt71Ei3M2dPRSkXdaKe1mB/uoNddObVw3P8v6szni0ag==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1750362693; bh=w5nGCL6Vqd9YiWimeTDswWNq67oDnF9fSkyX2/nQ/0o=;
 h=From:To:Subject:Date:MIME-Version;
 b=ELSrQe8nn35ZuBs6Ma6Lx9NfMND/479hrcAlZFu73CLcnqCur8R22zroax4CW0jGA
 X42HD+F3XCkaSuCK6sXpkSVmAT5NA8prMYDUtkDJWwpYq3KXCUtQK5ekfuLHAj5dvW
 6kv4umEbiQaf7NvdYohZVIoR4Td/vRC8tSY8IZWGm4vXZ3134VOv6eQFyH1aVdVlfY
 k8XBsbd7aIcCSl3xYHusGpk25nz8OLNfzs/lXGMGbVw2c5QzdFmjgHmLI5hDhd9L4V
 Ux+jxYyWp0ZRDicF02c/tBQ7egEA22TR2Q3PXTA73niPALhfS2mhcPmmsYLcPGaHtu
 xO8SV32Jv3V+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ELSrQe8n
Subject: [Buildroot] [PATCH] package/libblockdev: security bump to version
 3.3.1
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

This version fixes CVE-2025-6019, see:
https://github.com/storaged-project/libblockdev/blob/3.3.1/NEWS.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libblockdev/libblockdev.hash | 2 +-
 package/libblockdev/libblockdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index dd6f8b1a27..38450c656d 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c4738e1abedefffe886521f9f0e7a9306c6f50f7691d88e011438c88608bdfa7  libblockdev-3.3.0.tar.gz
+sha256  a2e2e448a19d420480b8cce5e0752197482a65cb62a9ed55d88b237da36600d1  libblockdev-3.3.1.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 265cee2e28..ecee8dee24 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.3.0
+LIBBLOCKDEV_VERSION = 3.3.1
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
