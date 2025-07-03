Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A35C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 18:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B802983AB1;
	Thu,  3 Jul 2025 18:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HkyY2dW-L4G; Thu,  3 Jul 2025 18:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E475283AA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E475283AA0;
	Thu,  3 Jul 2025 18:34:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DAFB193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 18:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7406183AA0
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 18:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VavWJTjienwQ for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 18:34:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC02983A9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC02983A9C
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC02983A9C
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 18:34:12 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id XOl7uqvXpNbHHXOl7uaWdl; Thu, 03 Jul 2025 20:34:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu,  3 Jul 2025 20:34:08 +0200
Message-Id: <20250703183408.654229-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAVYx/SQxoVfux0dr98uHke00NyGu5eNB2/YRi6ed3He+o/Cgl74hjBEnOFWco+VZKzjYqXF05sBxODlX8H6Edw/dSwT7CAgC9NUq8tXFQAhitc61mpL
 o/CkU93wl2LU6f3C8qfc6zM0bvr5h60ISSZV71TxdExX3TrAC7G0Qqgk7awDNX3z+FLgtPvNyyh0U2Dw7o8YMfLlvNV/+fV2oNr9xG4AuaYiX+qHcz2ZVJkv
 CBzNEYimbdijBvuknMiz7vy++iiqodQDgLV9wjPqeEfbr18JWIQT/OheL/FJJaRrV7bPVOtHzj4aFTgKjjqejA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751567649; bh=X8qhcLSRpkm2ibaZM0SY5GhsgdnLZTUwnmG0KSRbwlQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=AvJ4OUgPNiTjD0/LHejR4/IKZWi/Gl7doAzQMVDtrp8CWdQJa2NLetRwYhmTHLbh5
 YQqF5ZIHwVkyUrpDIQowPPIbSMz4KfOWO3qh7SHhm5e2MTAsuWsq0JEaX5Bgs0y9bI
 mOVB7Qx/+L86uJMakN3mT4l6CAsibPg2X63VW0NLDR19Zd4/dzrNy7nScz4dF+CzHf
 Bv4LTMqcdL5LtGXmi6pIQMXWN5dTg8a9hZRvTk4lN0GZfwHTVikcwuc1y7tQ3Wh3RR
 VjQ6v1qAORZXMTOEJdoopanN0IQFGIGisYQksaRhZAnoQGBjLdoluaNTQKYnTw+n5P
 ObI7ea/K8Hrag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=AvJ4OUgP
Subject: [Buildroot] [PATCH] package/libnss: security bump version to 3.113.1
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
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_113_1_RTM/doc/rst/releases/nss_3_113_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 7fcb75e6ba..e0bbc82413 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_RTM/src/SHA256SUMS
-sha256  acef06b512d3bd81c87a63b3c8653d258bb689d2191fc0e64decf5a1efa01c0f  nss-3.113.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_1_RTM/src/SHA256SUMS
+sha256  b8c586cc0ac60b76477f62483f664f119c26000a8189dd9ef417df7dbd33a2cc  nss-3.113.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e7b90a75a6..d6a9e9e2b1 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.113
+LIBNSS_VERSION = 3.113.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
