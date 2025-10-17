Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3A7CCD19A
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 10:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EAD54039C;
	Fri, 17 Oct 2025 10:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FLY1_df760o; Fri, 17 Oct 2025 10:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 524304039D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 524304039D;
	Fri, 17 Oct 2025 10:38:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA92EC
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0578181354
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoJe5iaZqwYX for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 10:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A68DC81347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A68DC81347
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A68DC81347
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:38:14 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B007331E0B3A; Fri, 17 Oct 2025 12:38:12 +0200 (CEST)
Date: Fri, 17 Oct 2025 12:38:12 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aPIclP1XjOZaVi3z@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1760697492; bh=ERcn6dV8ltxopZ/UqMdRzZDnNc+bBCvmL8Z77gfZd4A=;
 h=Date:From:To:Subject:From;
 b=Vgs3fSS7sL8rQsv45SMJXoZbEZW5LeEWWpdbFPvPUw8h87PhjZnOzwhty8NzRxWsJ
 tTc6wlCsC4zpCPbq7RCUS2PEsKjO8HGsBRXnNMyY/sYekakDh5ydOs1hIs7z1BpcIH
 CN1fOztXw/Du5KfN1gB3t1gC0Lmdg3VI14h8MtlUUkUwjamQaCehe1ExIh+lDpJXqx
 q6y0mY2TkQdgbS1RPzIiGQYAgHchqaaG4goCIrZGT5/F0pV0teffhhzl7ARQvN5r2Q
 mxVy/vczt/KaVhFANUJy+PGHMUGeo1tzuDXuNRIVAJfnAIOtZkQTiGFvB3ZVMzg7vH
 hp/SAHYKOPoMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Vgs3fSS7
Subject: [Buildroot] [PATCH v2 3/6] package/cbindgen: new host package
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
index 02af438337..cc304ad1cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3398,6 +3398,7 @@ F:	board/stmicroelectronics/stm32f746-disco/
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
