Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31ACC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 09:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05CC54019F;
	Fri,  7 Jan 2022 09:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39VusvbYs5u1; Fri,  7 Jan 2022 09:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D11CF42487;
	Fri,  7 Jan 2022 09:03:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1882E1BF3D1
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 09:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14A4542954
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 09:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p84wgM9hemd6 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 09:03:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 664DB4294C
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 09:03:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t28so3009919wrb.4
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 01:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3D+CUAmaJOljNtx7wFOOF8sqKXiTND+Y9xWa1tYnoHc=;
 b=tCuxZuEI8xBPybZAWKxsJa7vj7uywaUlqmpBtTHG1d1rdBQfPOWVGCje4RvdFhvNDi
 z0R9OsOaaKF/I4kVx8ZwxpqhPpxHWMJLbyWag0fgNwBOUR1RhEDNfzmpxQgGIDE3403C
 NRnvi93M8cKJNUzRBTqNDzGsR2cYnJq6KWOvUZbG4MJmAoojqnE6fazU8t9quNF7yp3s
 EgC8bSCa13Fy2BK9+EML+f5fo84/KYiV7f1Hj2BkzwuT+xyEE466SNZWmDwTFZ65oazJ
 Fuxc0LKoNNTlM6Vv4E+6yXo8EtIvl9onmKHgE2Gr99iY7npxnRGdGIygJfYKRvlqNwaF
 tI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3D+CUAmaJOljNtx7wFOOF8sqKXiTND+Y9xWa1tYnoHc=;
 b=Wx6h6vXP3z+QyIW6Ye5HEJxcbIjdLwX8ThAkte4E/ye1RaQsdWi18DJk2spwKXhIMN
 M5aS5zG53VE7Crnf/GL4xrptkdgvd7sZsL+WYNCxkYiSY8Xu/G+hVV9Y0n4QiSbIoUcB
 9OqulUvmyiuIalR+2ZU1h7+deUUUrUKtCusznhEHGZDv/GevtGw2qxkCJIpkZ3UJin3y
 Ha/T7a5QpZKhplcX+PJOJRyAk06vABQF5Fesl0XGP0bapz8IZLymQA3ab8BxNZbM0Vva
 zy5+kxob/MamZZ576sqy0HtU6uxeBGyLZpfNvkGAhNREpWc8TE8lPktRVSgoq8MwmmMv
 K7fA==
X-Gm-Message-State: AOAM533nV+tub1HnmD/yU9BqiyLkx6DAKIDT+8v5obIpzdd2nKieSaEM
 a8tiAgr09vtXAbi1wxylInvp3T+k5LoOZw==
X-Google-Smtp-Source: ABdhPJysCNa/N7oi2wAzkzYGz9MvLD8F4wSzh7WjTIow63Ou/IBCgSP9gv6dw2pg0wPN6kk/NDjdDw==
X-Received: by 2002:adf:cd0c:: with SMTP id w12mr23052473wrm.538.1641546231045; 
 Fri, 07 Jan 2022 01:03:51 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id f6sm4212154wri.115.2022.01.07.01.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 01:03:50 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 10:03:48 +0100
Message-Id: <20220107090348.3947187-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv4] package/bat: new package
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
Cc: Romain Naour <romain.naour@smile.fr>,
 David Pierret <david.pierret@smile.fr>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: David Pierret <david.pierret@smile.fr>

bat is a cat(1) clone with syntax highlighting and Git integration.

Using the aarch64 ARM toolchain that use the prefix
"aarch64-none-linux-gnu-", we need to set CC_aarch64_unknown_linux_gnu
in the environment to provide the right toolchain prefix [1].
Otherwise the build fail because rust use aarch64-unknown-linux-gnu as
default toolchain prefix.

Indeed, the aarch64 ARM toolchain is not listed as supported toolchains
[2][3]. The build succeed when the aarch64 Linaro toolchain is used
(tuple "aarch64-unknown-linux-gnu-").

The problem occure during the package install step... For some reason
bat is rebuilt during this step. A similar behavior has been observed
for host-sentry-cli [4]. For now, only set CC_aarch64_unknown_linux_gnu
in INSTALL_TARGET_CMDS (hack).

Since we set CC_aarch64_unknown_linux_gnu, convert RUSTC_TARGET_NAME
aarch64-unknown-linux-gnu to aarch64_unknown_linux_gnu since bash
doesn't allow to minus characters in environement variables.

[1] https://github.com/rust-lang/rust/blob/c367798cfd3817ca6ae908ce675d1d99242af148/src/ci/docker/dist-aarch64-linux/Dockerfile#L29
[2] https://github.com/rust-lang/rust/blob/52d2c7ac948d6abdc18eb9e05a53d03ddcaffd98/src/librustc_target/spec/mod.rs#L492
[3] https://doc.rust-lang.org/nightly/rustc/platform-support.html
[4] https://lore.kernel.org/buildroot/20201210213122.035e149a@windsurf.home/

Signed-off-by: David Pierret <david.pierret@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Romain: Use CC_$(RUSTC_TARGET_NAME)]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
bat supports syntax highlighting for a large number of programming
and markup languages. He can communicates with git to show
modifications with respect to the index.
For conveignance use, bat can pipe its own output to less if the
output is too large for one screen.

v4: Convert to cargo package infrastructure
    bump to version 0.18.3
    remove "select BR2_PACKAGE_NCURSES"
    Improve the commit log about the issue between the aarch64-linaro
    and the aarch64-ARM toolchains ("aarch64-none-linux-gnu-" vs "aarch64-unknown-linux-gnu-")
    See: https://doc.rust-lang.org/nightly/rustc/platform-support.html

    This patch needs the series "Support for Cargo and Go vendoring" v3
    http://lists.busybox.net/pipermail/buildroot/2022-January/632561.html

v3: remove "env" and use CC_$(subst -,_,$(RUSTC_TARGET_NAME))
    instead of CC_$(RUSTC_TARGET_NAME)

v1 -> v2
Add selection of less out of busybox for command line option
compatibility

bat: bump to version 0.18 & switch to cargo infra
---
 DEVELOPERS            |  3 +++
 package/Config.in     |  1 +
 package/bat/Config.in | 11 +++++++++++
 package/bat/bat.hash  |  4 ++++
 package/bat/bat.mk    | 12 ++++++++++++
 package/pkg-cargo.mk  |  1 +
 6 files changed, 32 insertions(+)
 create mode 100644 package/bat/Config.in
 create mode 100644 package/bat/bat.hash
 create mode 100644 package/bat/bat.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ff661e9357..99637c7ae3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -673,6 +673,9 @@ F:	linux/linux-ext-ev3dev-linux-drivers.mk
 F:	package/brickd/
 F:	package/ev3dev-linux-drivers/
 
+N:	David Pierret <david.pierret@smile.fr>
+F:	package/bat/
+
 N:	Davide Viti <zinosat@gmail.com>
 F:	board/friendlyarm/nanopi-r1/
 F:	configs/friendlyarm_nanopi_r1_defconfig
diff --git a/package/Config.in b/package/Config.in
index a88f0a6849..98a4d4c5f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2595,6 +2595,7 @@ menu "System tools"
 endmenu
 
 menu "Text editors and viewers"
+	source "package/bat/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
 	source "package/less/Config.in"
diff --git a/package/bat/Config.in b/package/bat/Config.in
new file mode 100644
index 0000000000..515eaf591a
--- /dev/null
+++ b/package/bat/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BAT
+	bool "bat"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	# we need a full version of less
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LESS
+	help
+	  A cat(1) clone with syntax highlighting and Git integration.
+
+	  https://github.com/sharkdp/bat
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
new file mode 100644
index 0000000000..aa6c8d743d
--- /dev/null
+++ b/package/bat/bat.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256  9c345788eb916777a60e7ff32031f1c92edc5565031e0c057bce860982768744  bat-0.18.3.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256  64de710b6309a7db5e44ad0af382300c7fb6f6d116d8ae32f0164e05db033068  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
new file mode 100644
index 0000000000..9b619af172
--- /dev/null
+++ b/package/bat/bat.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# bat
+#
+################################################################################
+
+BAT_VERSION = 0.18.3
+BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
+BAT_LICENSE = Apache-2.0 or MIT
+BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index bf1436a86b..e2fe104cf3 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -110,6 +110,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
+		CC_$$(subst -,_,$$(RUSTC_TARGET_NAME))=$$(TARGET_CC) \
 		cargo install \
 			--target $$(RUSTC_TARGET_NAME) \
 			--offline \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
