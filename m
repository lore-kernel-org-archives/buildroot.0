Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF798C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7091E60B8F;
	Sat,  4 Nov 2023 21:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7091E60B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJe2hH4ENZkJ; Sat,  4 Nov 2023 21:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9521660BB3;
	Sat,  4 Nov 2023 21:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9521660BB3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8EF51BF868
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DB8C40273
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DB8C40273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYFoWUTAJ6MW for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:00:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 594F54033F
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 594F54033F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 377DB85E0E; Sat,  4 Nov 2023 21:00:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:55:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4430f52215e9c888c24de622839a5169d18920d0
X-Git-Newrev: 5a0f41e56dd48ddd605d92e0571f86d1f4b40149
X-Patchwork-Hint: ignore
Message-Id: <20231104210013.377DB85E0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eza: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a0f41e56dd48ddd605d92e0571f86d1f4b40149
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

eza is a modern, maintained replacement for ls, built on exa.

https://github.com/eza-community/eza.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/eza/Config.in |  8 ++++++++
 package/eza/eza.hash  |  3 +++
 package/eza/eza.mk    | 12 ++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 019516396e..75d2ade9e9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2635,6 +2635,7 @@ N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
+F:	package/eza/
 F:	package/procs/
 
 N:	Sam Lancia <sam@gpsm.co.uk>
diff --git a/package/Config.in b/package/Config.in
index 9a189a2183..a7aee1816d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2636,6 +2636,7 @@ comment "Utilities"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
 	source "package/easy-rsa/Config.in"
+	source "package/eza/Config.in"
 	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
 	source "package/gnupg2/Config.in"
diff --git a/package/eza/Config.in b/package/eza/Config.in
new file mode 100644
index 0000000000..b0a49afefb
--- /dev/null
+++ b/package/eza/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_EZA
+	bool "eza"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  eza is a modern, maintained replacement for ls, built on exa.
+
+	  https://github.com/eza-community/eza.git
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
new file mode 100644
index 0000000000..39923ceb48
--- /dev/null
+++ b/package/eza/eza.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2dac8aa41433eeaa07c4eabdf557b7e134c3fda9ba9edb8ab57959354856e20c  eza-0.14.0.tar.gz
+sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
new file mode 100644
index 0000000000..a327de0dcc
--- /dev/null
+++ b/package/eza/eza.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# eza
+#
+################################################################################
+
+EZA_VERSION = 0.14.0
+EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
+EZA_LICENSE = MIT
+EZA_LICENSE_FILES = LICENCE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
