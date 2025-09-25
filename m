Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82366CAC5A5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 02:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3772661329;
	Thu, 25 Sep 2025 02:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8VcI_cbC-yX; Thu, 25 Sep 2025 02:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C599612CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C599612CE;
	Thu, 25 Sep 2025 02:56:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B48E3177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B26940889
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5H03ZWexDbq1 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 02:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B0A440087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B0A440087
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B0A440087
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:56:29 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 38EA531E05C8; Thu, 25 Sep 2025 04:56:27 +0200 (CEST)
Date: Thu, 25 Sep 2025 04:56:27 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aNSvWwgL7W9aVt-A@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758768987; bh=nUXnvOX2PHoM1FrSQE/V7sZ8ttDir4+PBWAS7aFy9mE=;
 h=Date:From:To:Subject:From;
 b=ouvbklwx94x7+4/HyxA2H4lXZ018Kums3RwwhjTkhkBikyyixHZxDaBP0SS5Y6lXV
 oaULTTbw+n4Q7XbizjBXcLIxGMfQSbvnxzHEttOBCRTO5cgNvhKyOsrkcQJP7w+fam
 kO5T5M2Cf4DZlLzinve8ha/ZvtKvlc1XHF1ugOHO6grrIsQLdiluhzk3uigBpLuEM/
 z78Tjy37D7sx0r7CcBlGRIx6TxyZ94BNkUECZniDhHxghx/d2AKi68Upfd4R8fF1uT
 6oZGdGMmQl+bCkdmMtpWgssApwwciQ72qpDfBI3qxg7fWdH+ChglZjLlXxPwA0Z2kU
 PfN/IN9mGPOsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ouvbklwx
Subject: [Buildroot] [PATCH 3/5] package/cbindgen: new host package
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

cbindgen creates C/C++11 headers for Rust libraries which expose a public C API.
This is a requirement to build firefox.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                     |  1 +
 package/cbindgen/cbindgen.hash |  3 +++
 package/cbindgen/cbindgen.mk   | 13 +++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 package/cbindgen/cbindgen.hash
 create mode 100644 package/cbindgen/cbindgen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a15640906b..7915470fcc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3404,6 +3404,7 @@ F:	board/stmicroelectronics/stm32f746-disco/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
+F:	package/cbindgen/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libaom/
diff --git a/package/cbindgen/cbindgen.hash b/package/cbindgen/cbindgen.hash
new file mode 100644
index 0000000000..fc86c122a1
--- /dev/null
+++ b/package/cbindgen/cbindgen.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  61db56782dad6fbf1972ddbe13907bf57ef571dc4c10759eafcba11d49970840  0.29.0.tar.gz
+sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
diff --git a/package/cbindgen/cbindgen.mk b/package/cbindgen/cbindgen.mk
new file mode 100644
index 0000000000..917d2bd91f
--- /dev/null
+++ b/package/cbindgen/cbindgen.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# cbindgen
+#
+################################################################################
+
+CBINDGEN_VERSION = 0.29.0
+CBINDGEN_SOURCE = $(CBINDGEN_VERSION).tar.gz
+CBINDGEN_SITE = https://github.com/mozilla/cbindgen/archive/refs/tags
+CBINDGEN_LICENSE = MPL-2.0
+CBINDGEN_LICENSE_FILES = LICENSE
+
+$(eval $(host-cargo-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
