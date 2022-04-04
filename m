Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057ECC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 01:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF6A408B1;
	Mon,  4 Apr 2022 01:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2RGEXfGNcHG; Mon,  4 Apr 2022 01:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B4F340887;
	Mon,  4 Apr 2022 01:43:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5E21BF343
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 01:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0755F4087D
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 01:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCCLe_CxvLds for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 01:43:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8C4240871
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 01:43:05 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id x9so5868724ilc.3
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 18:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w0E141WmeAlbU/BF1s9ihac+Fyqz7k+GUr2s6m6jrP4=;
 b=ael+aL0OW0wLrfZF62e95mkhrg9w83f6pD7NKkuElylcf9s+0gpmCanzu8mhy1VRV7
 7YsPQmaFeH6yxj8SKfkSFOH5KFZ2zGmfvN7geOEJ1HtirLNggXUT4IJH7YGJPyv+Pzu7
 Z7zqEWpq9J/uGqIdy5OaTLQOPENTRTxhOtDdfJs+4rWZFc2qvwkhhm0P9fXNS4rzZlkf
 MMAh9J0kqQPx3UMVOUjt4+YOvMSPelbVETrhJ8v4mTTIezoErgt1v8sCb/Ju68fVYk7t
 5+vPA68zAEUU1R5SOHcKBVLRP/serX1q4VxgYIO9w0eCvZbIcwH3C5XSLdRgjVWlDwFT
 G6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w0E141WmeAlbU/BF1s9ihac+Fyqz7k+GUr2s6m6jrP4=;
 b=KpLu/lsfIqaeZxtijMe8G4jz11kSQUQlaNZoJAn2WUK0LGVAI1IPQO1707N/TuHgAd
 ECsrHfLLm5S96IvI4C8nfqJ0CpZGqa/DpyVVnwB95LG7tMKf5iB9KOXGyeLxZjNAlm2d
 qBB2wN+pNS+H1X82oQNCw639InXJ/NAI4q48kqm3+rOO6nQ4rabV45XsaQjHcRwq0Y5w
 ECNTRF5NJ3E7fK/PeDJyl9ALXuQFm1ks2DZ3O/gA6h2Dnjuz3/YLaXQKgd/Wq1QQCvao
 XX0gI7Bu6+hMbU88GIgEiVEaYX6av20t8guDcmH8az+6yYjS+VUnR/wIbjuLpaJNtSI7
 GPXw==
X-Gm-Message-State: AOAM530s2XrCeq94O74aL46336GITqTUY2LwUg0yTe5142pK1tBwmyyz
 Whx2Gwc/W49I+mQRpMEatLp+XnCJXdXL3Q==
X-Google-Smtp-Source: ABdhPJy6//6j0+WQDzwLzo+v1b5nev66/Um+Oxi1BBeKdkEI6aEBdXAJQ47NDX7kNinmEXTjF8VpsA==
X-Received: by 2002:a05:6e02:1568:b0:2c9:cb97:973 with SMTP id
 k8-20020a056e02156800b002c9cb970973mr4318061ilu.132.1649036584725; 
 Sun, 03 Apr 2022 18:43:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 x14-20020a92dc4e000000b002c9e982fbc2sm5016637ilq.1.2022.04.03.18.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 18:43:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 19:42:52 -0600
Message-Id: <20220404014252.566711-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/protobuf: add additional supported
 host architectures
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move supported host architectures under
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS and propagate the reverse
dependency.

Add additional supported host architectures based on current
src/google/protobuf/stubs/platform_macros.h

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/collectd/Config.in         |  6 +++---
 package/kismet/Config.in           |  4 ++--
 package/protobuf-c/Config.in       |  4 ++--
 package/protobuf/Config.in         | 16 +++++++++++++++-
 package/python-protobuf/Config.in  |  2 +-
 package/riemann-c-client/Config.in |  4 ++--
 6 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 67413ffde0..43eef3bf66 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -725,7 +725,7 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
 	bool "riemann"
 	# riemann-c-client -> protobuf-c
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	select BR2_PACKAGE_RIEMANN_C_CLIENT
 	select BR2_PACKAGE_LIBTOOL
 	help
@@ -759,7 +759,7 @@ config BR2_PACKAGE_COLLECTD_WRITELOG
 config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 	bool "write_prometheus"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_PROTOBUF_C
 	help
@@ -768,7 +768,7 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 
 comment "write_prometheus needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_COLLECTD_WRITEREDIS
 	bool "write_redis"
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 961d5f230e..7bde6c92af 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -3,14 +3,14 @@ comment "kismet needs a toolchain w/ threads, C++, gcc >= 5"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_KISMET
 	bool "kismet"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_PROTOBUF_C
diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index a32e6cd9e8..d96cd7b382 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PROTOBUF_C
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# host-protobuf only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
@@ -12,4 +12,4 @@ config BR2_PACKAGE_PROTOBUF_C
 
 comment "protobuf-c needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 46c820b9cf..47e987fa2b 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -14,6 +14,20 @@
 # and we can live with requiring gcc 4.8 on PowerPC to build protobuf.
 #
 # host-protobuf only builds on certain architectures
+config BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "aarch64"
+	default y if BR2_HOSTARCH = "arm"
+	default y if BR2_HOSTARCH = "mips"
+	default y if BR2_HOSTARCH = "mipsel"
+	default y if BR2_HOSTARCH = "powerpc"
+	default y if BR2_HOSTARCH = "powerpc64"
+	default y if BR2_HOSTARCH = "powerpc64le"
+	default y if BR2_HOSTARCH = "sparc"
+	default y if BR2_HOSTARCH = "sparc64"
+	default y if BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "x86_64"
+
 config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm
@@ -22,7 +36,7 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	default y if BR2_sparc64
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 
 config BR2_PACKAGE_PROTOBUF
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index 1af82112b4..7de463520d 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PROTOBUF
 	bool "python-protobuf"
 	# host-protobuf only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python implementation of the Google Protocol Buffers.
diff --git a/package/riemann-c-client/Config.in b/package/riemann-c-client/Config.in
index e9982b2fb0..6c3c35caf8 100644
--- a/package/riemann-c-client/Config.in
+++ b/package/riemann-c-client/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 	bool "riemann-c-client"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Riemann-c-client is a C client library for the Riemann
@@ -14,4 +14,4 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 
 comment "riemann-c-client needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
