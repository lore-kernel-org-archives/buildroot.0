Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347E8C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF63A60666;
	Fri,  2 Aug 2024 21:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Do0PYJupS-lE; Fri,  2 Aug 2024 21:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC6E26069C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC6E26069C;
	Fri,  2 Aug 2024 21:56:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E21D31BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF91B40227
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzNwPgNk64H6 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAFBC400C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAFBC400C6
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1DA57FBFF; Fri,  2 Aug 2024 21:56:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 23:55:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb974003c136f7e0eea6bea057011db55fa922c0
X-Git-Newrev: d95b4db8633a9b928f9a12e428125c91551a3eae
X-Patchwork-Hint: ignore
Message-Id: <20240802215648.A1DA57FBFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fd: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d95b4db8633a9b928f9a12e428125c91551a3eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A simple, fast and user-friendly alternative to 'find'

https://github.com/sharkdp/fd.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS           |  1 +
 package/Config.in    |  1 +
 package/fd/Config.in | 12 ++++++++++++
 package/fd/fd.hash   |  4 ++++
 package/fd/fd.mk     | 12 ++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 092397adcb..4d26885a1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2869,6 +2869,7 @@ F:	package/biosdevname/
 
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
+F:	package/fd/
 F:	package/parsec-tool/
 F:	package/procs/
 F:	package/mxt-app/
diff --git a/package/Config.in b/package/Config.in
index e04cdae1e5..e21987717f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -182,6 +182,7 @@ menu "Development tools"
 	source "package/cxxtest/Config.in"
 	source "package/diffutils/Config.in"
 	source "package/dos2unix/Config.in"
+	source "package/fd/Config.in"
 	source "package/findutils/Config.in"
 	source "package/flex/Config.in"
 	source "package/gawk/Config.in"
diff --git a/package/fd/Config.in b/package/fd/Config.in
new file mode 100644
index 0000000000..10f295cb20
--- /dev/null
+++ b/package/fd/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FD
+	bool "fd"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  fd is a program to find entries in your filesystem. It is a
+	  simple, fast and user-friendly alternative to find. While it
+	  does not aim to support all of find's powerful functionality,
+	  it provides sensible (opinionated) defaults for a majority of
+	  use cases.
+
+	  https://github.com/sharkdp/fd.git
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
new file mode 100644
index 0000000000..90d2c38694
--- /dev/null
+++ b/package/fd/fd.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  91da5cc2b99d4754fa5096cda1eeac98f312f712bfca6a41f9972b2287a4c4f9  fd-9.0.0-cargo2.tar.gz
+sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
+sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/fd/fd.mk b/package/fd/fd.mk
new file mode 100644
index 0000000000..316da418ea
--- /dev/null
+++ b/package/fd/fd.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# fd
+#
+################################################################################
+
+FD_VERSION = 9.0.0
+FD_SITE = $(call github,sharkdp,fd,v$(FD_VERSION))
+FD_LICENSE = Apache-2.0 or MIT
+FD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
