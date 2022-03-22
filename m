Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C344C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB72A848F3;
	Tue, 22 Mar 2022 23:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FHcWNZW4iwz; Tue, 22 Mar 2022 23:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0580D848EC;
	Tue, 22 Mar 2022 23:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC801BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19F3C40C7D
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHbHXv5hs_xq for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5277C40194
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:36 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id n16so13501730ile.11
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=94qAAd2Y5fO09ardJgEIzrfq1c63MQkwFYgO2zX2KkA=;
 b=WK9gbRkLEH/z32yW5UMh0UoNt6Akzr6k50DzZGqx4T7Brw/asBbhlhFe8jTjAVx/3w
 bDOlIPEznwimjh3MkR7MhtlORPY8VHeBj6qBVG7pgSeQCJoWEMd7epUUlEj4k+HgLn0P
 WpjD9Mc0TqeNIA62KC5JBwcANJnMssIghe+noFkwgHsgipb+uya/FLF0rlCGpXW2c6SP
 TWm2mdSnWmOjlgUxTo2hPpDYSFn4yrH7nIcQLrP0bi5tOua7ch4R8vgR8uTWmLIklgxR
 6sL3gxqg0UPJIS0wTHAmmrF/Y8zDfNRNsx0EmklUK7zCjK5u1P35kkXbglVtq+DHhfBK
 ioiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=94qAAd2Y5fO09ardJgEIzrfq1c63MQkwFYgO2zX2KkA=;
 b=v4WwEZfyM8u52+Hg//NHL3rKzkaLZc+J+C+qtfBV1f24RxlQhYKj7wijxMtA1bxZA6
 eLfRjoQkhLubywc7yggb1plp6Jsrk86uEoZo9SP/DZsc25P/HsaB/QOw6fqpvnEWzfNu
 krXA4I/BYgcsA7XdMvmL+Pl4xjcnvCc+5nUelFm2J+B5d+GQWgQbbgSa/GDPJD606vps
 48sfUMGwA7ik+IlQHaM7mCPKBBuJBdYPGAeUmssT9VfQyb7Ux6+g6sg7+ISqhMkXgZ2r
 ROw7CptqvUJcbjQdCL8z5gFUDypAMerYN+6e40t8h3jOQVGFzQFe0xClNzXikdYADHC/
 NjkQ==
X-Gm-Message-State: AOAM533wfFtMwUrndy05NIXadmDjDGf7na0CkKKPEFcXKo4Yqd6aIb/2
 BtVQj8ZB3MKUd3ByERZ4BY9tD6lw+uDQOAwW
X-Google-Smtp-Source: ABdhPJwjBwM/k0M9gr2tyABpYuu7FJZZzZATUWSQosG822VCMlIq7I894fWJw7HpY5tmfg66ApplAw==
X-Received: by 2002:a05:6e02:214c:b0:2c7:7539:5a64 with SMTP id
 d12-20020a056e02214c00b002c775395a64mr13541149ilv.313.1647991355815; 
 Tue, 22 Mar 2022 16:22:35 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:17 -0600
Message-Id: <20220322232224.2842266-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 04/11] package/spirv-llvm-translator: new
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Samuel Martin <s.martin49@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../spirv-llvm-translator.hash                 |  3 +++
 .../spirv-llvm-translator.mk                   | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/spirv-llvm-translator/spirv-llvm-translator.hash
 create mode 100644 package/spirv-llvm-translator/spirv-llvm-translator.mk

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
new file mode 100644
index 0000000000..e6f9de3cad
--- /dev/null
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  a121579379ac3c7b63294b5274e0c4787b76003c89f7702a651384c3915464e9  spirv-llvm-translator-llvm_release_110.tar.gz
+sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
new file mode 100644
index 0000000000..fcc482027c
--- /dev/null
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# spirv-llvm-translator
+#
+################################################################################
+
+SPIRV_LLVM_TRANSLATOR_VERSION = llvm_release_110
+SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
+SPIRV_LLVM_TRANSLATOR_LICENSE = Apache-2.0 with exceptions
+SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
+HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm
+HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
+	-DLLVM_BUILD_TOOLS=ON \
+	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
+	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
+	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
+
+$(eval $(host-cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
