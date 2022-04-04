Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A196C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 00:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82D5A4155B;
	Mon,  4 Apr 2022 00:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9T5hEnenvOn; Mon,  4 Apr 2022 00:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E82F41554;
	Mon,  4 Apr 2022 00:41:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7478B1BF9AA
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 00:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61D7041554
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 00:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPC6zIL_pFj3 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 00:41:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 079A741552
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 00:41:47 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 9so9515991iou.5
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 17:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iaNYxqipvQXdjQzFF6tMUD1jowM1FLKPoMNh1mVfXno=;
 b=TbpOJmuwX5axm8WhmElbgCnwNgQ3wTSDTAXPfhBmO9lg4dL91wUxVCj4SG+vzV3mTA
 QQyQScHB6MdlGBML5XDazvM9U76FA/3mSB49mvLTyt1bIlg45sgCR85eIq3tCDqsTmR0
 0nRBEXzfjBs/S5W7VZPJ0ZcA4ZLy7zWpZDC6KNgt/peHIr3ys16/Ylr2zhBvvnraxYwp
 XZEmE+Ocr6r/kCsOtluTVBX2WNMjhNzVFN9WQRktKtOg8AXzDZrWu5rgCSBruXWCehDj
 MN69iL9oWBjevjPsxOARgOVgkI2prT45vxF1tOuveziAqTcwQUsTv8HjBzBUJ7W0TLfz
 Uj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iaNYxqipvQXdjQzFF6tMUD1jowM1FLKPoMNh1mVfXno=;
 b=d+8RhxB7DLCtzR6SsMl2pwYMTSAQgtywQW1uHWjEg5ezy+GujEStDAJYTuwu6ULKW9
 sUFNXqpB+efVXBhc4Eet34A5D8MZ4OqITDHn30WIeuKhOqdFZJIsCTT0V1wyLQcybjAg
 a56V/I25jT+GqDUJNwkb4kyy28VW4jptL2X+aFWR7zwuqpiEQWS6JMRathLGWWnMxzuw
 ADk3BDUviBZnsWSoR/+T5JJwbtxZBCUrCSM62+6nGrC6K1Ua55RDhLXutP0XJVc6QAl8
 uYUvh1lLeLCmcREfNP3nBug6Q0MM/dk9inOFSpXg3+7yMONvBqhYVscskr3OVXsC0xvI
 7Dhw==
X-Gm-Message-State: AOAM533gOTNQTEXjW3KIzHq6SOjrpqMWfLo11YS01oYjLwVVNl8CJZWc
 xl5S4SqkxoorXLt40qhW04wAKlwpfPC3yA==
X-Google-Smtp-Source: ABdhPJx4JzzHZoih93THReUKxYg2VVfPvBHfNZ8aGFwFW5YZzd1bE/qJugCuyHP2TJDR2A9cRdiiew==
X-Received: by 2002:a05:6638:3006:b0:317:9daf:4425 with SMTP id
 r6-20020a056638300600b003179daf4425mr10963633jak.14.1649032906845; 
 Sun, 03 Apr 2022 17:41:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 w2-20020a92c882000000b002c81bffee08sm5019193ilo.55.2022.04.03.17.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 17:41:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 18:41:38 -0600
Message-Id: <20220404004138.563732-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: support additional host architectures
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are host toolchains available for non-x86/x86_64 architectures,
add them as supported along with their toolchain hashes.

Note that the gcc riscv64-unknown-linux-gnu arch needs to be mapped
to the rust riscv64gc-unknown-linux-gnu arch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 24 ++++++++++++++++++++++++
 package/rustc/Config.in.host   | 11 ++++++++++-
 package/rustc/rustc.mk         |  4 +++-
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 9f8788a295..bac2f21c5c 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,6 +1,30 @@
+# From https://static.rust-lang.org/dist/rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  0a80900aa160de4292b1174e25f183bd88f6c2fbb3056a59fcb4d658c70084cb  rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
 sha256  110ca4967351d8535f3d39e24f40e2941c20346c5765d3530270e134ae50568e  rust-1.58.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  01d2e69ed06fbc05a779a7d09f99d0b54a0d10fef9a7dcd0ea07866d57900ca2  rust-1.58.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  0b8fafb75e06ba9d4ca58f2cde3179a677908aed8be64e798fc107135839c480  rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  00216feea0a6468e9ce57c7d3ad50e22fe888dfc9aabc34128e1f4b02c5a09b9  rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  f6f870875d9adbe5a8b7bb6f61c44b6c54381e5dff50b4d2cdce50d18a8a541e  rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  45bf988d0337095a4d30bb237d552e3420b4381e208624f0d956e1caf6b90207  rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  488e30e926d1835c0140a01bff4d3fe6499be1e89e5c740b2ceace892ab4c2e6  rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  48cf31128a54551330f9c094f69d274adaab1ac506869dd65353aaea5bcbf33f  rust-1.58.1-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
 sha256  f71b077caf0becbd0af9fd22bc1fa31c4fdf7a21fe046da8a15a7bde1286da25  rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 80d1d1a3d8..4ea66c2d2d 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -1,7 +1,16 @@
 # All host rust packages should depend on this option
 config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "aarch64"
+	default y if BR2_HOSTARCH = "mips"
+	default y if BR2_HOSTARCH = "mipsel"
+	default y if BR2_HOSTARCH = "powerpc"
+	default y if BR2_HOSTARCH = "powerpc64"
+	default y if BR2_HOSTARCH = "powerpc64le"
+	default y if BR2_HOSTARCH = "riscv64"
+	default y if BR2_HOSTARCH = "s390x"
+	default y if BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "x86_64"
 
 # The pre-built Rust standard library is only available for a number
 # of architectures/C libraries combinations, with different levels of
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
index 0513dd0b40..b2cc131ee9 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -11,7 +11,9 @@ ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
 RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-$(LIBC)$(RUSTC_ABI)
 endif
 
-ifeq ($(HOSTARCH),x86)
+ifeq ($(HOSTARCH),riscv64)
+RUSTC_HOST_ARCH = riscv64gc
+else ifeq ($(HOSTARCH),x86)
 RUSTC_HOST_ARCH = i686
 else
 RUSTC_HOST_ARCH = $(HOSTARCH)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
