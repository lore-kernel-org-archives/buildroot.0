Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2D8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 15:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9497A611CF;
	Thu, 24 Feb 2022 15:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCeyVlZWHCNn; Thu, 24 Feb 2022 15:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD7961067;
	Thu, 24 Feb 2022 15:45:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 076DD1BF309
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E88AD60E96
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ke1RyuQae2_h for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 15:45:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAC5561067
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 15:45:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so47192wmg.2
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9bakziITROy4+Te5llkIJ/dp2TKzJ3f3eyL/nXwjD4=;
 b=XFPS6gDeROzSpyMvHetRT1yakCeOK4t85GzmMPFaxf+26IdtG/WS8vpbWq50tUYk+I
 88V6+SBiaZrI+obzpkaexdmdtAOrLAteIW1sATz0/nRQEvE4vJ+QUndGfbPz/b51XIXf
 qaiPXQ4OMkhVqGT99tT0ATWGV4z7Wvvipuf9SMewR7BA9FuUIjQYCg5LgEeRxqhTmk8Q
 3OxlPji0EOUEHiNl5YGvUyOg67j5eKr2X6aMBxgc3ES/AGpPPSp23eEuUu9eMcwl3sf2
 PumnELQdz9VvvK4/wE2OIXqJNYwvyeVpBSLmR3tstErmeA4vm6tx8kggIi5+GAK0eETp
 VxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9bakziITROy4+Te5llkIJ/dp2TKzJ3f3eyL/nXwjD4=;
 b=hOt0I4tfWFu6xIZ8JPLTPiTWZkoXt60mBQFHfBWbKURzuViQlmuklwWbOxn/Tpa8cO
 oq7swms71n34TtREfYITbdwPFRGC6lLAz6HgWcQShHxxpPTJ8j9+6j+8b6KLgr2RDcvT
 bGLe5ElO13VK6szQKS4FPW4VX9D7MYDLPHUU/zErLRM0weHAZAi1iOfVrdkxe30eKCNY
 3WXu/dPAgfDx5MdyyA9znb5wFfqrRlZGc8YA/NV2xbEpAg41E/qfcqGb3IWTjfqLfSVc
 rjd4Dqsj1d1/9YOB4SeFahp1af+EwtQwDRjHI1UKCGKvbTzCqQrSU5UEkSKbtk4i3kQH
 8O9w==
X-Gm-Message-State: AOAM530ySl89vqUvumHSQdVxILHPp7vQrqAsdvFtsmsXxc/rgrsKN/7b
 skHqXxoCVVNDBdfS+YZ8OxOf6sbb1lQ=
X-Google-Smtp-Source: ABdhPJz9QYoYfbCQQ9TiRizFZi1eSz/uJFqiWfz5WWgfr9pwl79Y1/+72tSEPRk2sXYtkrwS9rOsEA==
X-Received: by 2002:a1c:f213:0:b0:381:118:40e6 with SMTP id
 s19-20020a1cf213000000b00381011840e6mr4397102wmc.13.1645717519118; 
 Thu, 24 Feb 2022 07:45:19 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a7bc4d0000000b0037bbe255339sm3118063wmk.15.2022.02.24.07.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:45:18 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 16:45:13 +0100
Message-Id: <20220224154513.220976-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224154513.220976-1-romain.naour@gmail.com>
References: <20220224154513.220976-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 2/2] package/rust: install rustc and rust-std
 built by Buildroot
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
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The test TestRust is currently broken with ripgrep package with
the following error:

error[E0514]: found crate `core` compiled by an incompatible version of rustc
  |
  = help: please recompile that crate using this compiler (rustc 1.58.1) (consider running `cargo clean` first)
  = note: the following crate versions were found:
          crate `core` compiled by rustc 1.58.1 (db9d1b20b 2022-01-20): TestRust/host/lib/rustlib/x86_64-unknown-linux-gnu/lib/libcore-6cfcec236d576603.rlib

error[E0514]: found crate `std` compiled by an incompatible version of rustc

The problem is not really a cross-compilation issue (we are building
for an armv7 target on x86_64 host) but a problem with rust-std libraries
(rlib).

We can notice that "rustc 1.58.1 (db9d1b20b 2022-01-20)" is the same
version as the prebuilt rustc used to bootstrap the build:

TestRust/host/bin/rustc --version
rustc 1.58.1

TestRustBin/host/bin/rustc --version
rustc 1.58.1 (db9d1b20b 2022-01-20)

Indeed we are using host-rust-bin to bootstrap the host-rust compiler
package built by Buildroot. The problem is that the
libcore-6cfcec236d576603.rlib file come from host-rust-bin (rust-std)
and is not removed before installing host-rust built by Buildroot.

We actually spent a lot of time to build host-rust with rust-std
and forget to install this important library HOST_DIR.

Looking at the host-rust build directory we can notice two installer
script "install.sh" (the same scripts used to install host-rust-bin):

TestRust/build/host-rust-1.58.1/build/tmp/tarball/rust/x86_64-unknown-linux-gnu/rust-1.58.1-x86_64-unknown-linux-gnu/install.sh
TestRust/build/host-rust-1.58.1/build/tmp/tarball/rust-std/armv7-unknown-linux-gnueabihf/rust-std-1.58.1-armv7-unknown-linux-gnueabihf/install.sh

The "tarball" directory is generated by the "python x.py dist" during
the install step, we have to keep it.

Replace "python x.py install" by theses two install scripts.
Installing rust-std with the install.sh script replace the rust-std
libraries installed by host-rust-bin.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202544

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust/rust.mk | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 46487fe4b7..4a6b04dc8c 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -67,9 +67,30 @@ define HOST_RUST_BUILD_CMDS
 	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
 endef
 
+HOST_RUST_INSTALL_COMMON_OPTS = \
+	--prefix=$(HOST_DIR) \
+	--disable-ldconfig
+
+HOST_RUST_INSTALL_OPTS = \
+	$(HOST_RUST_INSTALL_COMMON_OPTS) \
+	--components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME)
+
+define HOST_RUST_INSTALL_RUSTC
+	(cd $(@D)/build/tmp/tarball/rust/$(RUSTC_HOST_NAME)/rust-$(RUST_VERSION)-$(RUSTC_HOST_NAME); \
+		./install.sh $(HOST_RUST_INSTALL_OPTS))
+endef
+
+ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
+define HOST_RUST_INSTALL_LIBSTD_TARGET
+	(cd $(@D)/build/tmp/tarball/rust-std/$(RUSTC_TARGET_NAME)/rust-std-$(RUST_VERSION)-$(RUSTC_TARGET_NAME); \
+		./install.sh $(HOST_RUST_INSTALL_COMMON_OPTS))
+endef
+endif
+
 define HOST_RUST_INSTALL_CMDS
 	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py dist
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py install
+	$(HOST_RUST_INSTALL_RUSTC)
+	$(HOST_RUST_INSTALL_LIBSTD_TARGET)
 endef
 
 $(eval $(host-generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
