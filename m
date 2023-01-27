Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB3EC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 12:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22F5D828EF;
	Fri, 27 Jan 2023 12:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F5D828EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUmPCaq0jUQO; Fri, 27 Jan 2023 12:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53836827FD;
	Fri, 27 Jan 2023 12:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53836827FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A95131BF263
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15EB641CFB
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15EB641CFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_q1BUmuyuoA for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 12:44:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AB4041CAB
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 12:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB4041CAB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27A8787EA3; Fri, 27 Jan 2023 12:44:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 13:42:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccd391bfd94fdcaed77a2fe31c577e428cefc0ee
X-Git-Newrev: 0c157330da49dcfe41fe7cef9fe4ec77636f326f
X-Patchwork-Hint: ignore
Message-Id: <20230127124440.27A8787EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sexpect: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0c157330da49dcfe41fe7cef9fe4ec77636f326f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sexpect is useful for shell controlled testing.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/sexpect/Config.in    |  8 ++++++++
 package/sexpect/sexpect.hash |  3 +++
 package/sexpect/sexpect.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 385a46ccf9..83fa9e403d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -294,6 +294,7 @@ F:	package/ebtables/
 F:	package/i2c-tools/
 F:	package/libcurl/
 F:	package/libpcap/
+F:	package/sexpect/
 F:	package/socat/
 F:	package/strace/
 F:	package/tcpdump/
diff --git a/package/Config.in b/package/Config.in
index b281a67157..eabb0d5201 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2568,6 +2568,7 @@ comment "Utilities"
 	source "package/rtty/Config.in"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
+	source "package/sexpect/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/sexpect/Config.in b/package/sexpect/Config.in
new file mode 100644
index 0000000000..bdf5c3bbf5
--- /dev/null
+++ b/package/sexpect/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SEXPECT
+	bool "sexpect"
+	help
+	  sexpect is another implementation of Expect which is
+	  specifically designed for Shell scripts
+	  (sh, bash, ksh, zsh, ...)
+
+	  https://github.com/clarkwang/sexpect
diff --git a/package/sexpect/sexpect.hash b/package/sexpect/sexpect.hash
new file mode 100644
index 0000000000..d512117626
--- /dev/null
+++ b/package/sexpect/sexpect.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f6801c8b979d56eec54aedd7ede06e2342f382cee291beea88b52869186c557c  sexpect-2.3.14.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sexpect/sexpect.mk b/package/sexpect/sexpect.mk
new file mode 100644
index 0000000000..7b878600e4
--- /dev/null
+++ b/package/sexpect/sexpect.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# sexpect
+#
+################################################################################
+
+SEXPECT_VERSION = 2.3.14
+SEXPECT_SITE = $(call github,clarkwang,sexpect,v$(SEXPECT_VERSION))
+SEXPECT_LICENSE = GPL-3.0
+SEXPECT_LICENSE_FILES = LICENSE
+SEXPECT_SUPPORTS_IN_SOURCE_BUILD = NO
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
