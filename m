Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F3C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 13:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F5241DF8;
	Sat,  6 Jan 2024 13:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58F5241DF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r21E-kHXaKGa; Sat,  6 Jan 2024 13:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A3EB41DDE;
	Sat,  6 Jan 2024 13:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A3EB41DDE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6691BF322
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14AE583DAE
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 13:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14AE583DAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cz2AOu9R90DE for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 13:39:26 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBB0383D99
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 13:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBB0383D99
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3374e332124so413382f8f.2
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 05:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704548363; x=1705153163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=upHnH4qTCoQXX5MnD1xOzbXU7F2YdE3AJBSzetjP6lw=;
 b=TOjAAuVITnCsm+ZGMy9nxnLSYRfvhKFisrgXoEohPmQbetxYh2MOfMhA/NWcumsP/M
 ywa8DLbHXlsy7VPQgMGx4uUd1ihvCohJNJJNYNEO9ewDzCZo4IfPpR1BniFeJaE6i+fP
 1rARt9JWl4OtaIGJAHmDXWJ4UsKtJR46z7VY4doykayu1IwXP2PTpbDxXTdH3RXk8bcJ
 NndG5naIGwAuOQ/6iSFvvBykiZfY4TREE3eKxQy+QM8RGufAEItnlcT+S+1/XIA9m0b6
 MS93s3C/S7NHTMcA1XdaQhnCTZ+JoEvzZPUmwcvi4wEi+ChsZ7Rsh01XiFBm4eI8KiMz
 nX8Q==
X-Gm-Message-State: AOJu0Yxna/L1EAFLrvCnq9RT/DN9T/mgoFbzpjip/qoSDrFOfTlzA9Js
 b2jPHqIAfizSPK1gid5khlTD5/Ye45M=
X-Google-Smtp-Source: AGHT+IEkBtm2UeyTx2OPmBM7q3v6odF9SWLSj/kL26PYjdLkQXRLUG7ZL+/0IzzSCybid55yAcb4sg==
X-Received: by 2002:a05:600c:4f8f:b0:40e:3523:2a43 with SMTP id
 n15-20020a05600c4f8f00b0040e35232a43mr496706wmq.183.1704548362775; 
 Sat, 06 Jan 2024 05:39:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r16-20020a056000015000b003373ef060d5sm3380015wrx.113.2024.01.06.05.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 05:39:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:39:19 +0100
Message-ID: <20240106133919.1586012-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704548363; x=1705153163; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=upHnH4qTCoQXX5MnD1xOzbXU7F2YdE3AJBSzetjP6lw=;
 b=fXf4+7TJSe2+wQiLVeF2UD6WSPqREew8BoHVSSxjNui/cEDpgPr6dHtAS2Knj43Cfy
 0d8kvYDH2GHt611XcIKqkb/UF6T0MJENHAm34xYwrRlmeUagNwIjHhxf3SxJFLGCqtBA
 a1i0okS94fMz/FEuTRpYb02YYtnQennh8dX4pfPwOK0OX7fgtjO0Q+dqZRUjVBL8m6Ya
 eIACSOQCmtslZA4HHYU8DeciOHsRjBnpPIyq4wsCAqo4iovfSRG3Re6iWWthDZEOi/e3
 Sul5Ka8jOnXy8l+Kvbty/KjU06YBLerlJlk6uzNzUIvD+eqN+cWO308cTQF96TTEhtmw
 syGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fXf4+7TJ
Subject: [Buildroot] [PATCH 1/1] package/nushell: fix sparc64 build
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on sparc64 raised since bump to version
0.85 in commit 470f0fb1ec0bd2ba03340f2aea34891ca8d7739d:

error[E0308]: mismatched types
   --> /home/autobuild/autobuild/instance-7/output-1/build/nushell-0.85.0/VENDOR/uucore/src/lib/features/fs.rs:121:16
    |
111 |     pub fn number_of_links(&self) -> u64 {
    |                                      --- expected `u64` because of return type
...
121 |         return self.0.st_nlink;
    |                ^^^^^^^^^^^^^^^ expected `u64`, found `u32`
    |
help: you can convert a `u32` to a `u64`
    |
121 |         return self.0.st_nlink.into();
    |                               +++++++

For more information about this error, try `rustc --explain E0308`.
error: could not compile `uucore` (lib) due to previous error

Fixes:
 - http://autobuild.buildroot.org/results/f9f0287a8e39c65895014ca513ed25071f020add

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-uucore-add-support-for-sparc64.patch | 57 +++++++++++++++++++
 package/nushell/nushell.mk                    |  7 +++
 2 files changed, 64 insertions(+)
 create mode 100644 package/nushell/0001-uucore-add-support-for-sparc64.patch

diff --git a/package/nushell/0001-uucore-add-support-for-sparc64.patch b/package/nushell/0001-uucore-add-support-for-sparc64.patch
new file mode 100644
index 0000000000..2cc05c172e
--- /dev/null
+++ b/package/nushell/0001-uucore-add-support-for-sparc64.patch
@@ -0,0 +1,57 @@
+From 9f4330f94cc471d880df7d9089ee1105b27fd321 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Jan 2024 10:26:54 +0100
+Subject: [PATCH] uucore: add support for sparc64
+
+Add support for sparc64 in uucore to avoid the following build failure
+with nushell:
+
+error[E0308]: mismatched types
+   --> /home/autobuild/autobuild/instance-7/output-1/build/nushell-0.85.0/VENDOR/uucore/src/lib/features/fs.rs:121:16
+    |
+111 |     pub fn number_of_links(&self) -> u64 {
+    |                                      --- expected `u64` because of return type
+...
+121 |         return self.0.st_nlink;
+    |                ^^^^^^^^^^^^^^^ expected `u64`, found `u32`
+    |
+help: you can convert a `u32` to a `u64`
+    |
+121 |         return self.0.st_nlink.into();
+    |                               +++++++
+
+For more information about this error, try `rustc --explain E0308`.
+error: could not compile `uucore` (lib) due to previous error
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f9f0287a8e39c65895014ca513ed25071f020add
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/uutils/coreutils/commit/d158f1a396d19cc2aed68131b80ec3b7325d108e
+---
+ src/uucore/src/lib/features/fs.rs | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/VENDOR/uucore/src/lib/features/fs.rs b/VENDOR/uucore/src/lib/features/fs.rs
+index 20cc9e13d..3b9170bc3 100644
+--- a/VENDOR/uucore/src/lib/features/fs.rs
++++ b/VENDOR/uucore/src/lib/features/fs.rs
+@@ -121,6 +121,7 @@ impl FileInformation {
+             not(target_os = "solaris"),
+             not(target_arch = "aarch64"),
+             not(target_arch = "riscv64"),
++            not(target_arch = "sparc64"),
+             target_pointer_width = "64"
+         ))]
+         return self.0.st_nlink;
+@@ -137,6 +138,7 @@ impl FileInformation {
+                 target_os = "solaris",
+                 target_arch = "aarch64",
+                 target_arch = "riscv64",
++                target_arch = "sparc64",
+                 not(target_pointer_width = "64")
+             )
+         ))]
+-- 
+2.43.0
+
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index 779a3c4393..7b538da4e2 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -10,6 +10,13 @@ NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
 NUSHELL_DEPENDENCIES = host-pkgconf openssl ncurses
 
+# 0001-uucore-add-support-for-sparc64.patch
+define NUSHELL_PATCH_CHECKSUM_FILE
+	$(SED) 's/b0390ae7bca8b31f0db289a5d064bba36d45e4d137674e9df2c6ab6256f926f4/f8ce2ad571e1482f6833cb147eafeb724776e7887ebabf339a5f3e79860583cb/' \
+		$(@D)/VENDOR/uucore/.cargo-checksum.json
+endef
+NUSHELL_POST_PATCH_HOOKS += NUSHELL_PATCH_CHECKSUM_FILE
+
 # Add /usr/bin/nu to /etc/shells as in package/bash/bash.mk
 define NUSHELL_ADD_NU_TO_SHELLS
 	grep -qsE '^/usr/bin/nu$$' $(TARGET_DIR)/etc/shells \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
