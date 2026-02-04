Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC946E9538F
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9966260A55;
	Wed,  4 Feb 2026 12:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jj5bjxF6N-nU; Wed,  4 Feb 2026 12:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9978860A5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770207358;
	bh=6Fyj4Hm89Q8a22Xj337/7SXTyU7veMpULAZ9EW2C0BY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QBvkt024O/b7NtMH7mFFhcuOVW4qn9YPBsbam+uIMt/cd4sSKDszM+vsbu1ZjBzBZ
	 356eL5Tn1cXWtDTeyev685hpjuWDxke12YTW4ySYkfHVdTwxnlVSh3AnkThtn6rRpf
	 ETnsDyul4q8dUBw3jgEmxjGMMZ8NJATwh0OVOGgJpG8RfEO0bUoWuQkb/WoET0qyAR
	 dMB07arnTz/k1+z8bajvSUMEH/9pIFFOxuABby+YiTXuwPkDIquqXlhLwUTDaLZ6VW
	 Sy7qHorw2yNalMJWhjW5Noe6GuzbM3xSfY4/QVPCgdeLGbAPWB1v31EOi0BK03CsPF
	 driYj3k2bGb6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9978860A5E;
	Wed,  4 Feb 2026 12:15:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6B0AF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8795981AD1
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d57l2y6X83bD for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E14881A6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E14881A6F
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E14881A6F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:15:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5FAE131E0B83; Wed, 04 Feb 2026 13:15:54 +0100 (CET)
Date: Wed, 4 Feb 2026 13:15:54 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYM4eqS91bacIELq@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770207354; bh=xwz5PWJFuOD3pQxUkt3ZCYIJ5z0ad66dAmsOJvg5f40=;
 h=Date:From:To:Subject:From;
 b=rouC39aHgne/3HG5updTVYb8vkHMcf8Fd8d3q6/1GkPsonwsT5+HK68lRU19Gq/oF
 L4sp2pwUQZ0RL0/D8o9Jr8v5b2wxjs5NXwm15GSKCTeQyt1xyRcE6Fo7CrZO2xmg1U
 hz/S/SrYSZDfPcCTULSqQKf+nqJ5ebY+I/e6ipymDojwoLAzt9ywBc8xvx3geOPNVJ
 c+lzHkQSM7YWYJ5ADA9TXe7b/BJFwRS2w8BbVqNjMgQVLLMoXBu5D0qSnmEkaep9tI
 i8fV/Aqs4qspeZvKp6V7wSZ7cvlvqLcI6BOYfOn4B6rf2nYZ7Et4zzDstEMiYD5Ri3
 +utJFXqbRNFRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH v3 2/5] package/cbindgen: new host package
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
 no changes
---
 DEVELOPERS                     |  1 +
 package/cbindgen/cbindgen.hash |  3 +++
 package/cbindgen/cbindgen.mk   | 13 +++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 package/cbindgen/cbindgen.hash
 create mode 100644 package/cbindgen/cbindgen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e964886da6..9012ab523e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3428,6 +3428,7 @@ F:	board/stmicroelectronics/stm32f746-disco/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
+F:	package/cbindgen/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
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
