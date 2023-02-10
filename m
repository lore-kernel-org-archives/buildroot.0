Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD1AC05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C0F0607CA;
	Fri, 10 Feb 2023 22:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C0F0607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dze_hXSgZ3xa; Fri, 10 Feb 2023 22:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7697B61212;
	Fri, 10 Feb 2023 22:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7697B61212
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C34501BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CB5D415AC
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CB5D415AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nm7YQBMMrdE1 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43BD9401B2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43BD9401B2
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bu23so6526016wrb.8
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3x9q2w0W/90XfomSx/r1KvMncbHRRM4UxWB3NC6n6g0=;
 b=Y+R6BB+f6wWqTpSPAu1jVqmTUpMpPnxPMmlzQPn/EoD0GKJzlLal4U8877Jc5TbDXS
 +muN5DvM2JjzkTTPW171sJdN5+tXRpBxwRHQ7okqTJ2hYD/K7bnd2rBCh/Pf+KbzGCDl
 Dc3Zz6HmdAOpfnFlWZ4PMf0glgBSAFF1fUbwng/nfzW09LJSn8DzV8zKb8FpvOsv9QI3
 1ypAtlPP6l1hO51b9WXfiZFY6zls6vUnu3UG1F3NK6tvzS6pgnljLlSrb1xv3QNdKEBz
 Y2NgqDyhaIJLJLcmW/q6vUK5f9Gam5gGJvZeSD/58L66KWo/x/sCTJifFdBZg+1TyZOX
 M/mg==
X-Gm-Message-State: AO0yUKWWksjH//dmdIFNJ8Z1YitKMkEFPeeDloEwazm088kFkfG+1DSG
 iS78ruj+PYHEWJrJy4KuDiz6Nn4sRsrxYVRo
X-Google-Smtp-Source: AK7set/sbBkN5cdy3EAe3DGHa+BUqk2JTHccGJ1a5gKLlOVp/wmzGTKFo/FkTseiVEl/q3oZ0Le8fQ==
X-Received: by 2002:adf:d087:0:b0:2c3:da50:2cc3 with SMTP id
 y7-20020adfd087000000b002c3da502cc3mr14885637wrh.30.1676069250533; 
 Fri, 10 Feb 2023 14:47:30 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:30 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:14 +0100
Message-Id: <20230210224717.3293906-8-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230210224717.3293906-1-romain.naour@smile.fr>
References: <20230210224717.3293906-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3x9q2w0W/90XfomSx/r1KvMncbHRRM4UxWB3NC6n6g0=;
 b=bW1Vy64sS++d8rj66qtCkD85jlci/E+2vqMmq/cJ/H7uBNLBKvC2gQI43mSUx0o7lv
 txBXTscX/eLWmmJiExbxWgb3hAEljAZoK87715CJ4kDfatDoJxzqWreLWkXaq2feMiyk
 RtD1dDWZFvHCRUciXsrBUtr5wxrk5U7MVUSh72byK6yGjOlY78zjo68c5Z/wVLmLgxwy
 dYd/HO3UMyDHbbhEaKQ71D2H00mjPCkXNYRyXKMnNn08/TYxMmp8is50qBc4KfP1grlj
 RJZFx6sQRua/dlCiUkbkIaONZ3iF3TpQu27DBwYWLR4H4Hn9SZg1yEfAMC4+Qxuibt67
 oWgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=bW1Vy64s
Subject: [Buildroot] [PATCH v3 07/10] package/llvm-project/llvm-cmake: new
 package
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

This is a small host package containing shared cmake modules
that are needed by various projects during configuration.
For example llvm 15 needs it.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v3: - force llvm-cmake version to 15.0.3 since LLVM_PROJECT_VERSION is
      still at 11.1.0
    - Keep cp as install command since there is no CMakefiles.txt
    - Add License information sinec it come from llvm-project
---
 package/llvm-project/llvm-cmake/llvm-cmake.hash |  2 ++
 package/llvm-project/llvm-cmake/llvm-cmake.mk   | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.mk

diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
new file mode 100644
index 0000000000..862c5d92e8
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  21cf3f52c53dc8b8972122ae35a5c18de09c7df693b48b5cd8553c3e3fed090d  cmake-15.0.3.src.tar.xz
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.mk b/package/llvm-project/llvm-cmake/llvm-cmake.mk
new file mode 100644
index 0000000000..b305797891
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# llvm-cmake
+#
+################################################################################
+
+LLVM_CMAKE_VERSION = 15.0.3
+LLVM_CMAKE_SITE = $(LLVM_PROJECT_SITE)
+LLVM_CMAKE_SOURCE = cmake-$(LLVM_CMAKE_VERSION).src.tar.xz
+LLVM_CMAKE_LICENSE = Apache-2.0 with exceptions
+
+define HOST_LLVM_CMAKE_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/lib/cmake/llvm
+	cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/llvm
+endef
+
+$(eval $(host-generic-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
