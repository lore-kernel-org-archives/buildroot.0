Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F902F483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1FB060909;
	Mon, 23 Mar 2026 19:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Khh0BuRyXHV8; Mon, 23 Mar 2026 19:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F072608EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295300;
	bh=VKYHwPw3JOyo0QRk2t+NOpdLNdwqmSC3bLXL/bckSFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fuz84fU8K7f+NNqK14FlGnhMSZHBF1puAL9ZWQ/gOGEY2nEi7BVq2pWflRjVXD1hD
	 RF5LGB8UiA7iHkw/pbZlUVZmxdkjw+tvBOl2+va2qzVF/AB/TF4ZB57E3DrWofxknt
	 qhwAx68HBJsfTbyz87nT7raU5RK5BVrGMxstyO1QZ9j+g306VGZR2Dj9Mg7BgU6bTy
	 ZCbJ1BsCeCALbZcazBKkwwCJwpBFRSipTMFEaxXPKMxmLiebrrwTy6UVlt5fD4SxMO
	 pj40dg9y44jasLpWXNEZChqxzI09qX6zfwPFzVdQpcS6ZbV6GwcixqXwsPDSay2R+2
	 EjqJLGiaXObLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F072608EB;
	Mon, 23 Mar 2026 19:48:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79410F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B25640C88
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irPoHUWSBpYT for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B11E40CB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B11E40CB0
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9953084688; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 21:23:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17fb6420f7cdd524a24ef7d24cdfa592e1ea738c
X-Git-Newrev: 9f2ff71c749eb48ca950f331b5f9a25058456404
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.9953084688@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cxxopts: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f2ff71c749eb48ca950f331b5f9a25058456404
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This header-only library is needed for gerbera bump to 3.2.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/cxxopts/Config.in    | 10 ++++++++++
 package/cxxopts/cxxopts.hash |  3 +++
 package/cxxopts/cxxopts.mk   | 15 +++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4fdbf5fa44..26f093fa39 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -369,6 +369,7 @@ F:	package/bcg729/
 F:	package/bento4/
 F:	package/bitcoin/
 F:	package/clamav/
+F:	package/cxxopts/
 F:	package/dav1d/
 F:	package/dht/
 F:	package/dnsmasq/
diff --git a/package/Config.in b/package/Config.in
index a98b6d23d9..cde044211a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2137,6 +2137,7 @@ menu "Other"
 	source "package/llvm-project/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
+	source "package/cxxopts/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
 	source "package/dlib/Config.in"
diff --git a/package/cxxopts/Config.in b/package/cxxopts/Config.in
new file mode 100644
index 0000000000..0e7a52c0a5
--- /dev/null
+++ b/package/cxxopts/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CXXOPTS
+	bool "cxxopts"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Lightweight C++ command line option parser
+
+	  https://github.com/jarro2783/cxxopts
+
+comment "cxxopts needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cxxopts/cxxopts.hash b/package/cxxopts/cxxopts.hash
new file mode 100644
index 0000000000..fabef5c840
--- /dev/null
+++ b/package/cxxopts/cxxopts.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3bfc70542c521d4b55a46429d808178916a579b28d048bd8c727ee76c39e2072  cxxopts-3.3.1.tar.gz
+sha256  aa324fbe633a96546bebca975fbbab65caa175894bd00cfa13d7335e7363400c  LICENSE
diff --git a/package/cxxopts/cxxopts.mk b/package/cxxopts/cxxopts.mk
new file mode 100644
index 0000000000..1dc25c9083
--- /dev/null
+++ b/package/cxxopts/cxxopts.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# cxxopts
+#
+################################################################################
+
+CXXOPTS_VERSION = 3.3.1
+CXXOPTS_SITE = $(call github,jarro2783,cxxopts,v$(CXXOPTS_VERSION))
+CXXOPTS_LICENSE = MIT
+CXXOPTS_LICENSE_FILES = LICENSE
+
+CXXOPTS_INSTALL_STAGING = YES
+CXXOPTS_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
