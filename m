Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A78BCD4843
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 20:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2120D60034;
	Wed, 12 Nov 2025 20:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRF80n-TV7tR; Wed, 12 Nov 2025 20:29:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AB0E6058D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AB0E6058D;
	Wed, 12 Nov 2025 20:29:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DDA5158
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0037A40092
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtDKLpU6va3B for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 20:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B67040090
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B67040090
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:29:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B0F483B08; Wed, 12 Nov 2025 20:29:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 21:24:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 766f6ddb7ef164524f829a35cba0fcfa7d4612e2
X-Git-Newrev: 5d8c1af6a562cf1d0b28f03240ce098f59151464
X-Patchwork-Hint: ignore
Message-Id: <20251112202924.2B0F483B08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d8c1af6a562cf1d0b28f03240ce098f59151464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds broot, a fast and powerful file manager written
in Rust and licensed under MIT license. It supports filters, regular
expressions, and real-time "show-as-you-type" search for quick and easy
navigation, even in complex directory structures.

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
[Peter: use select rather than depends on for rustc]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/broot/Config.in  | 11 +++++++++++
 package/broot/broot.hash |  3 +++
 package/broot/broot.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b14c6e3875..dbd3b1517c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -87,6 +87,7 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/cpp-httplib/
 
 N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/broot/
 F:	package/nnn/
 
 N:	Alessandro Partesotti <a.partesotti@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 930f368058..1152748d8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2950,6 +2950,7 @@ endmenu
 
 menu "Text editors and viewers"
 	source "package/bat/Config.in"
+	source "package/broot/Config.in"
 	source "package/bvi/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
diff --git a/package/broot/Config.in b/package/broot/Config.in
new file mode 100644
index 0000000000..247240925f
--- /dev/null
+++ b/package/broot/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BROOT
+	bool "broot"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Broot is a fast and powerful file manager written in Rust and
+	  licensed under MIT license. It supports filters, regular
+	  expressions, and real-time "show-as-you-type" search for quick
+	  and easy navigation, even in complex directory structures.
+
+	  https://github.com/Canop/broot
diff --git a/package/broot/broot.hash b/package/broot/broot.hash
new file mode 100644
index 0000000000..09dd907bf5
--- /dev/null
+++ b/package/broot/broot.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  2f9fc93d3e3b547108d66ac0baafb8f60a9506fc189b509821ab301d9ea75a19  broot-1.52.0-cargo4.tar.gz
+sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
new file mode 100644
index 0000000000..9b60d35857
--- /dev/null
+++ b/package/broot/broot.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# broot
+#
+################################################################################
+
+BROOT_VERSION = 1.52.0
+BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
+BROOT_LICENSE = MIT
+BROOT_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
