Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37011C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4CF140C88;
	Tue, 22 Mar 2022 23:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ezUY1EbKCW3; Tue, 22 Mar 2022 23:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E57740AFA;
	Tue, 22 Mar 2022 23:24:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BFBD1BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8789D40AFA
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMfEbjGY5d-c for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A196C40194
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:41 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id h21so13522568ila.7
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VgBAsaKU5/mIsNorQ7IXfLtn6TPRwEDyGsJ0LpxSwTk=;
 b=o0ZHaH9o5lnVK4T3yl4SvYsuJ+QMZd7WUf5DWx6MwDSjfl14JMR2x3fiVBm26anB6j
 zVdQcMc3QzMrXt0wVk2McAysRtBrHj1T8zQE+zUSmFdulbhPscvOCkRaRH8bGoK0i8ea
 Ora2OqsWKoUaILWa9XDdUFzE8fZz1VJSXfQsfLsjMl6Dak79D8hZN0LmQQTXlRJ+qXsL
 ZKO8VjBiqrF6gDAVe28cIbAavgijtY/2zI+auzpXVcFPJ/uIkPyPXT/7ZDAiu+GYloVN
 8xbfPkrvwyeuXwbhZJOF2dLTYYEQTS8XceMt+o60kreajPJSmvDRgZTatnASI1vgAHb4
 H58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VgBAsaKU5/mIsNorQ7IXfLtn6TPRwEDyGsJ0LpxSwTk=;
 b=ri9h4A8ho2Ms8muDWs0v5uX5x1otFvIFpqNQkj5lS8xZqA7UwxL5N+rCCAijfJ72e0
 M9fPJpCSHqXjv8LWP8CegRCWukNv4CfGxrkIBe0jTxU/OSXS8MYwqYx1EFhCJo6CLJ2r
 HLDHJml03XUvRYUNtj8R0qt8f3HD1gQTWDKKQYQVSGK4BEV3rz++D+7DH9zT1w58YOX7
 XSix33FcN+u14L+I8BmamXTXvIgnQg6tD1yrL+6moyrzA77+NU3SuYAf+qqGfDI10XFb
 0XeLDCYmrX4BncCiOVv5dkKXkLLZYe/ZQAhBTASi4QOWJ93n5fsQhBuxlskPzsfeLtIQ
 b18A==
X-Gm-Message-State: AOAM5336/vBhYz8M07jIbqYwDQx55kdUlsSUZKcBiZT8qLRlSEkqEhj8
 Wo6SIL8y36IT6o5lLyVcAxCnL97djWg4ZJxh
X-Google-Smtp-Source: ABdhPJx60nobP3sN5y0HBhE+8dvR4RwZP91a3baWRHbu6pLB2r6tsgUiWYSIe8E5qZgrkOK3ou5Qhw==
X-Received: by 2002:a05:6e02:1ca5:b0:2c6:68c8:e44e with SMTP id
 x5-20020a056e021ca500b002c668c8e44emr13548449ill.79.1647991360488; 
 Tue, 22 Mar 2022 16:22:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:23 -0600
Message-Id: <20220322232224.2842266-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 10/11] package/clang: install a
 toolchain-wrapper for the host clang cross-compiler
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Romain Naour <romain.naour@smile.fr>,
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

In order to use Clang as a host cross-compiler for Buildroot, we
need to provide at least the path to the sysroot (using
--sysroot) and some other compiler flags.

This series looks to reuse the toolchain wrapper for GCC since
Clang support most of the gcc flags used in the Buildroot's
toolchain wrapper. The only flag -mfused-madd (deprecated
since gcc 4.6) for mips is not supported by clang. Since
Clang require gcc >= 5.x this flag can never be used.

host-clang refers to an existing GCC-based toolchain (internal or
external) for libstdc++. However, a Buildroot external toolchain
gets a different BR_CROSS_PATH_SUFFIX. Therefore, we can't reuse the
toolchain-wrapper that gets built for the GCC-based toolchain, but
instead have to compile an additional clang-specific wrapper, called
toolchain-wrapper-clang.

After building the clang toolchain wrapper, create the symlinks needed
to force package infrastructure to use clang througt the wrapper.

Initially clang install the clang-8 binary and create all other symlinks:

 # clang -> clang-8
 # clang++ -> clang
 # clang-8
 # clang-cl -> clang
 # clang-cpp -> clang

Use a post install hook to rename the clang-8 binary to clang-8.br_real
and recreate all symlinks:

 # clang -> toolchain-wrapper-clang
 # clang++ -> toolchain-wrapper-clang
 # clang-8 -> toolchain-wrapper-clang
 # clang-8.br_real
 # clang++.br_real -> clang-8.br_real
 # clang.br_real -> clang-8.br_real
 # clang-cl -> toolchain-wrapper-clang
 # clang-cl.br_real -> clang-8.br_real
 # clang-cpp -> toolchain-wrapper-clang
 # clang-cpp.br_real -> clang-8.br_real

NOTE: *.br_real symlinks are needed as the wrapper references them

Use the previously introduced CLANG_VERSION_MAJOR variable to create
theses symlinks.

Set BR_CROSS_PATH_SUFFIX to ".br_real" as for the Buildroot's internal
GCC toolchain backend to find the "real" clang binary installed in
$(HOST_DIR)/bin.

Borrow TOOLCHAIN_WRAPPER_BUILD and TOOLCHAIN_WRAPPER_INSTALL to
build and install the specific clang toolchain wrapper.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Arnout
 - Fixup commit description and clarified *.br_real
 - Simplified loop
---
 package/clang/clang.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 95b4964be3..3c75f8d6b1 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -112,5 +112,33 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
 endif
 
+define HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+	$(Q)cd $(HOST_DIR)/bin; \
+	rm -f clang-$(CLANG_VERSION_MAJOR).br_real; \
+	mv clang-$(CLANG_VERSION_MAJOR) clang-$(CLANG_VERSION_MAJOR).br_real; \
+	ln -sf toolchain-wrapper-clang clang-$(CLANG_VERSION_MAJOR); \
+	for i in clang clang++ clang-cl clang-cpp; do \
+		ln -snf toolchain-wrapper-clang $$i; \
+		ln -snf clang-$(CLANG_VERSION_MAJOR).br_real $$i.br_real; \
+	done
+endef
+
+define HOST_CLANG_TOOLCHAIN_WRAPPER_BUILD
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
+		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
+		toolchain/toolchain-wrapper.c \
+		-o $(@D)/toolchain-wrapper-clang
+endef
+
+define HOST_CLANG_TOOLCHAIN_WRAPPER_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper-clang \
+		$(HOST_DIR)/bin/toolchain-wrapper-clang
+endef
+
+HOST_CLANG_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
+HOST_CLANG_POST_BUILD_HOOKS += HOST_CLANG_TOOLCHAIN_WRAPPER_BUILD
+HOST_CLANG_POST_INSTALL_HOOKS += HOST_CLANG_TOOLCHAIN_WRAPPER_INSTALL
+HOST_CLANG_POST_INSTALL_HOOKS += HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
