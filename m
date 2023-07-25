Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9BFC0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B5EA81F35;
	Tue, 25 Jul 2023 13:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B5EA81F35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9WV3vlGOn46; Tue, 25 Jul 2023 13:51:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA15681FC2;
	Tue, 25 Jul 2023 13:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA15681FC2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A96521BF980
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 835444052B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 835444052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZ195DitfMVl for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:16 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0D764016F
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0D764016F
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3163eb69487so4321485f8f.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293074; x=1690897874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uk1+PO7qspyE+Cjn5Si2hQ2uuDamV3ibu7rxTApBNKc=;
 b=hCg30I2tRQJ0uWo7EULVtUVIr632wnRuWXLZkaTcl5mGjzMlOVY4tNwSqcproennJ8
 U529MzePPjjTunCe1K8nDs/kqQMQ3YkJmRXO6GkgHg21nBnkY4uUc3mZmqUIq6IUiPR5
 t860kFe7Q7ccRJ4JF4tmvDbCkc7sTXuXD1wPaenQpxGjgBkRxuRE8FLop2rGCL+SnSun
 /mbGm2HBgp1PxRLn9LRs+WLtYMct4zkk8LPK3MUUZm9wRWqmtCqIvWiX+OuoAPEQ/qKC
 XWhB/ySb+G47PkyK5ryMKtN44/Dg0tKaop9eE2ZrQujsjv/EQ0YxsWLsv2Ptr+0JSQM4
 6mvw==
X-Gm-Message-State: ABy/qLZ9oMO4ZuJjg+/Cnpq8b8GQkL76b+z51D12j95DiLK03wRbS2wf
 UcKh98gJv7LUzeo5wmNirJo1A6h2r0OUcMIPQQI=
X-Google-Smtp-Source: APBJJlFJsac8XQroDAey0Oy/EssRZyZFZDEoIdtTJeEroyujQk+TEYtdPdzZ5HwXsPGbSP6sq/sbaQ==
X-Received: by 2002:a05:6000:1082:b0:314:c6b:b9a2 with SMTP id
 y2-20020a056000108200b003140c6bb9a2mr2145051wrw.13.1690293074491; 
 Tue, 25 Jul 2023 06:51:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:14 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:50:56 +0200
Message-Id: <20230725135105.536310-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725135105.536310-1-sebastian.weyer@smile.fr>
References: <20230725135105.536310-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293074; x=1690897874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uk1+PO7qspyE+Cjn5Si2hQ2uuDamV3ibu7rxTApBNKc=;
 b=IkdWo+2efIZLV5tFqx/Yb+9yIAzII1oSHnLfEMZ0TyxVM4v5WXmjL2uQkdkZePIBxr
 qNT+kGeokMKAekR7TDH+WFnb34qNRyp62NHEER3rGmMNR577DnrLxZKf6H3JfWVNEpob
 7BZ+dHz2f/YS5H30MwuBZGJ99tPHiOUw4cSWtGjLf2GFUjCN4AmAghHEqs3KzwABA/1m
 HBuVMYqIJx0tJY6JRs1S54yMxry+pSqhZhphVZzBq0lrPH+FxL3r9ik6BUyORlyCG1+X
 W8oJ387nYufRvYQbsDLdd8oD/DiyKgurSSTiBHa7ub25iYI43u81gaRRnnoZdMW+iEt0
 iSKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=IkdWo+2e
Subject: [Buildroot] [PATCH 1/9] package/rust-bindgen: new host package
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
Content-Type: multipart/mixed; boundary="===============1981152768742212607=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1981152768742212607==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@smile.fr>

host-rust-bindgen will be required to build several different rust-based
packages, including a Linux kernel with rust modules and mesa3d's
rusticl which is the rust-based implementation of OpenCL.

The Cargo.toml file at the project root is a "virtual manifest". Since
we only want to install rust-bindgen, we can specify RUST_BINDGEN_SUBDIR
= bindgen-cli to use the Cargo.toml from this directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v2:
    - remove comment explaining deprecated command line options from
      rust-bindgen.mk
    - Add rust-bindgen under Sebastian WEYER in DEVELOPERS file
---
 DEVELOPERS                             |  3 +++
 package/rust-bindgen/rust-bindgen.hash |  3 +++
 package/rust-bindgen/rust-bindgen.mk   | 17 +++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/rust-bindgen/rust-bindgen.hash
 create mode 100644 package/rust-bindgen/rust-bindgen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c690f1dac7..c9ac202de6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2602,6 +2602,9 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:	Sebastian Weyer <sebastian.weyer@smile.fr>
+F:	package/rust-bindgen
+
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
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
index 0000000000..117198f407
--- /dev/null
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rust-bindgen
+#
+################################################################################
+
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


--===============1981152768742212607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1981152768742212607==--
