Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1A0C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFD2940273;
	Sat,  4 Nov 2023 20:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFD2940273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YrovjxZB1Il; Sat,  4 Nov 2023 20:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB2374031C;
	Sat,  4 Nov 2023 20:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB2374031C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B13DD1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97374418F2
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97374418F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkoU-dCk2Ndu for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75FBF418F0
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75FBF418F0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60BFD86705; Sat,  4 Nov 2023 20:13:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:06:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a307fbac92181caf333289c031ec9eb7680203b
X-Git-Newrev: a13c6c707bcfdb60751428544bd316979470a914
X-Patchwork-Hint: ignore
Message-Id: <20231104201329.60BFD86705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procs: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a13c6c707bcfdb60751428544bd316979470a914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

procs is a modern replacement for ps written in Rust

https://github.com/dalance/procs.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/procs/Config.in  |  8 ++++++++
 package/procs/procs.hash |  3 +++
 package/procs/procs.mk   | 12 ++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index de4cd7168e..019516396e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2634,6 +2634,9 @@ F:	package/agent-proxy/
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
+N:	Saeed Kazemi <kazemi.ms@gmail.com>
+F:	package/procs/
+
 N:	Sam Lancia <sam@gpsm.co.uk>
 F:	package/lrzip/
 
diff --git a/package/Config.in b/package/Config.in
index 7e2fccc8b1..9a189a2183 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2733,6 +2733,7 @@ menu "System tools"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
 	source "package/procrank_linux/Config.in"
+	source "package/procs/Config.in"
 	source "package/psmisc/Config.in"
 	source "package/pwgen/Config.in"
 	source "package/quota/Config.in"
diff --git a/package/procs/Config.in b/package/procs/Config.in
new file mode 100644
index 0000000000..946fa68c63
--- /dev/null
+++ b/package/procs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PROCS
+	bool "procs"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  procs is a modern replacement for ps written in Rust
+
+	  https://github.com/dalance/procs.git
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
new file mode 100644
index 0000000000..1c2fb5c3d5
--- /dev/null
+++ b/package/procs/procs.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  643b7ba4b769ee9f336d441ecdac779c3d52e5719a15c14bb0acb3609ce1cd99  procs-0.14.0.tar.gz
+sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/procs/procs.mk b/package/procs/procs.mk
new file mode 100644
index 0000000000..a074ee1311
--- /dev/null
+++ b/package/procs/procs.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# procs
+#
+################################################################################
+
+PROCS_VERSION = 0.14.0
+PROCS_SITE = $(call github,dalance,procs,v$(PROCS_VERSION))
+PROCS_LICENSE = MIT
+PROCS_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
