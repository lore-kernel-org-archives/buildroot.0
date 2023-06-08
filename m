Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AA0C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 08:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8E02405D0;
	Thu,  8 Jun 2023 08:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8E02405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QmctcXkQ0Ya; Thu,  8 Jun 2023 08:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03143403E0;
	Thu,  8 Jun 2023 08:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03143403E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A11411BF3BD
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 08:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87B49403E0
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 08:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87B49403E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xJvpx4xwewa for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 08:50:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F41EC400FB
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F41EC400FB
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 08:50:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30e412a852dso228390f8f.0
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 01:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686214223; x=1688806223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BvwAk08T69YSpc1GLI70f9nX/rTLWR7hL71YVkEcyf0=;
 b=PjLb3U4X28TpheUsv7NgKjykQPJndqRyGJ2e4YnGyoG1YUOKhfPkYngwAEfDC7WoM0
 zOjFSLGtc2eRflsSCspUtm/G37K2D0906fBMIWJ7mxNHLVZ5CMv5/CtITVrVc87coWji
 OLmmg6QsP1vGHxVO+AO0H0VMMK5TkrggQUcr75t5CEzHD+q5SSFzZVsnHYnGQdkycl2D
 vA6hyvtMhqdgthxjMy+8GOKtKSrsy2F59xDyqN32f8fgHc0c/jFs84kBsxMlj69pw+oB
 KRziQdj+ZVZWSI5sXCvmyyhjrpgSH03DvX4iN2idpJWn7kApkr4SiaS13r6AhaIsjjl0
 4dMQ==
X-Gm-Message-State: AC+VfDzx6J7DPr3oZ9eJM51BSZO/suJ+0kMsUiXRmyM2ylZOlbe4wfDT
 F5u61BcJpVQ2lwZlopXEqKxEhXs9yam/K8AUy9s=
X-Google-Smtp-Source: ACHHUZ42hbsUlN7Ib0naASs5LyD9q+fegrrtOx19TgYCLv70PIPLVwfcY9WsOJ2iZYVPC8TU2w273Q==
X-Received: by 2002:adf:fa4d:0:b0:306:3286:69a2 with SMTP id
 y13-20020adffa4d000000b00306328669a2mr6608920wrr.48.1686214222703; 
 Thu, 08 Jun 2023 01:50:22 -0700 (PDT)
Received: from P-NAN-LIMA.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 e40-20020a5d5968000000b002fda1b12a0bsm928123wri.2.2023.06.08.01.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 01:50:22 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 10:50:15 +0200
Message-Id: <20230608085015.1075425-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686214223; x=1688806223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BvwAk08T69YSpc1GLI70f9nX/rTLWR7hL71YVkEcyf0=;
 b=BQ5smDnX7qALe5M2D6ATIsyoZvjprDNkMREF5W89xV8V/EdCk6xtabZ3WlofLQEy9x
 6rI/wv1T+T/J99v9OHl4CTN/+EDTKydAx0unsh3tPvNNT1RM6G7EepNf9CCqCVXPGMq0
 Klrv+4dPzv76TXchgZ++pClXESJG1+wT1XISCUlIebHUHi9vkYsrJGQiCIQZmXpuc3D1
 vyJYahUtA9npNPToCXwlDs4Kos+kjwvHlMmkxEsVrzqMlSiB38qcM4SZ4Gi7IAFwzWZ2
 05N0ZFl7jvDjo/AorcUGu5kIOuAXvltIoYNdFyovdvMwru4471B6eFsRORPDrKuYrpMM
 vRJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=BQ5smDnX
Subject: [Buildroot] [PATCH 1/1] package/rust-bindgen: new host package
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
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

host-rust-bindgen will be required to build several different rust-based
packages, includign a Linux kernel with rust modules and mesa3d's
rusticl which is the rust-based implementation of OpenCL.

The Cargo.toml file at the project root is a "virtual manifest". Since
we only want to install rust-bindgen, we can specify RUST_BINDGEN_SUBDIR
= bindgen-cli to use the Cargo.toml from this directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/rust-bindgen/rust-bindgen.hash |  3 +++
 package/rust-bindgen/rust-bindgen.mk   | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 package/rust-bindgen/rust-bindgen.hash
 create mode 100644 package/rust-bindgen/rust-bindgen.mk

diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
new file mode 100644
index 0000000000..fe94bbc096
--- /dev/null
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e1cdbaa8e0ed96f647e49807aecfc44d9239d438c2b1c084edb9a3cca0b1f68f  rust-bindgen-0.65.1.tar.gz
+sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
new file mode 100644
index 0000000000..b9c7647716
--- /dev/null
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# rust-bindgen
+#
+################################################################################
+
+#When updating to a version >0.63.0, pay attention to the command line
+#arguments --blacklist* and --whitelist* which are deprecated from 0.63.0
+#onwards but are still used when compiling the Linux Kernel as of the time
+#of this comment
+RUST_BINDGEN_VERSION = 0.65.1
+RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
+RUST_BINDGEN_LICENSE = BSD-3-clause
+RUST_BINDGEN_LICENSE_FILES = LICENSE
+
+# The Cargo.toml at the root directory is an "virtual manifest".
+# Since we only want to build and install bindgen use the Cargo.toml
+# from the bindgen-cli subdirectory.
+RUST_BINDGEN_SUBDIR = bindgen-cli
+
+$(eval $(host-cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
