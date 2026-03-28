Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54E810D1489
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 21:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8638640CDF;
	Sat, 28 Mar 2026 21:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6tceWYmnHwM; Sat, 28 Mar 2026 21:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A728C40CFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774734130;
	bh=JEMSFRx8qW1DiriPXl6yu9b6grNq8S+KE6QfRAKrDyA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sZje/Yrm8ksUhTaeqPCqWFWkPZWh7mFLbvpiC7wnwhVpN7/rjOCIHqcwBoZ0WBEZf
	 eJQapu1ouBaB5DRz3//cvD1daM0sEI3fby9JaQHr/yRcfvSjuTd2BeJqq9/0oPuipz
	 xLnGSDbgOomJHps5PHb55fuZLhTVmDzGXgjtr8URwSejg0mTTSoULVy1EvbteE3EX9
	 Cg+JpIukFTkMtNBzg0xiw19XzFBK1wJIk0m5QJCz0sN+BcUAuEry68MQ5azM0vIIT5
	 3wemPP5eLJzg24L5vJCVrpAl9xs0SkGCJVQjqERcXISIecWZqJ3MOH2m0wY1j1TWL6
	 0SjJ/U/yFnyeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A728C40CFD;
	Sat, 28 Mar 2026 21:42:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F5CA1D3
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32A2540279
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 811Dohm0Y8SI for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 21:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FBBA40077
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FBBA40077
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:42:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 787237FD05; Sat, 28 Mar 2026 21:42:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Mar 2026 22:22:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6561290de5efbfb8b13ad5c814958ad25a9657e9
X-Git-Newrev: 9624acf9aae9292cc2d9c20f277db0e3b0bd8955
X-Patchwork-Hint: ignore
Message-Id: <20260328214207.787237FD05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss-ato: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9624acf9aae9292cc2d9c20f277db0e3b0bd8955
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The libnss_ato module is a set of C library extensions which allows to
map every nss request for unknown user to a single predefined user.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libnss-ato/Config.in       | 11 +++++++++++
 package/libnss-ato/libnss-ato.hash |  4 ++++
 package/libnss-ato/libnss-ato.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 66d00b929f..b74de1b142 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3362,6 +3362,7 @@ F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
+F:	package/libnss-ato/
 F:	package/libyang-cpp/
 F:	package/sysrepo-cpp/
 
diff --git a/package/Config.in b/package/Config.in
index cde044211a..4c2ea0864f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1633,6 +1633,7 @@ menu "Crypto"
 	source "package/libksba/Config.in"
 	source "package/libmd/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libnss-ato/Config.in"
 	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
diff --git a/package/libnss-ato/Config.in b/package/libnss-ato/Config.in
new file mode 100644
index 0000000000..6c6fc23857
--- /dev/null
+++ b/package/libnss-ato/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBNSS_ATO
+	bool "libnss-ato"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Library to map every nss request for unknown user to a
+	  single predefined user.
+
+	  https://github.com/donapieppo/libnss-ato
+
+comment "libnss-ato needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libnss-ato/libnss-ato.hash b/package/libnss-ato/libnss-ato.hash
new file mode 100644
index 0000000000..39220f4b03
--- /dev/null
+++ b/package/libnss-ato/libnss-ato.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  7fe56dcfaed74884fa1f9323d000135a4de2a32177a474ee2b9e4a217ae83994  libnss-ato-0.2.0.tar.gz
+sha256  3de3161d298c48e55d7416ad89130e13dd72263b93563f3fb79c899fa8450ce2  copyright
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  lgpl-3.0.txt
diff --git a/package/libnss-ato/libnss-ato.mk b/package/libnss-ato/libnss-ato.mk
new file mode 100644
index 0000000000..a7fb3600f8
--- /dev/null
+++ b/package/libnss-ato/libnss-ato.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libnss-ato
+#
+################################################################################
+
+LIBNSS_ATO_VERSION = 0.2.0
+LIBNSS_ATO_SITE = $(call github,donapieppo,libnss-ato,v$(LIBNSS_ATO_VERSION))
+LIBNSS_ATO_LICENSE = LGPL-3.0+
+LIBNSS_ATO_LICENSE_FILES = copyright lgpl-3.0.txt
+
+# Skip the default build system (avoid patching Makefile for 1 .c)
+define LIBNSS_ATO_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		-fPIC -Wall -shared -o $(@D)/libnss_ato.so.2 \
+		-Wl,-soname,libnss_ato.so.2 \
+		$(@D)/libnss_ato.c
+endef
+
+define LIBNSS_ATO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so.2
+	ln -sf libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so
+	$(INSTALL) -D -m 0644 $(@D)/libnss-ato.conf $(TARGET_DIR)/etc/libnss-ato.conf
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
