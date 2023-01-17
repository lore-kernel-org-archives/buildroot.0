Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911AEC3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 10:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDEEE606A9;
	Tue, 17 Jan 2023 10:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDEEE606A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmXdzwWBQLNk; Tue, 17 Jan 2023 10:59:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FA9960655;
	Tue, 17 Jan 2023 10:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FA9960655
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89A181BF20D
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 10:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 720E18174F
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 10:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720E18174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qeslaMdOC58 for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 10:59:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C6F8149D
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66C6F8149D
 for <buildroot@busybox.net>; Tue, 17 Jan 2023 10:59:52 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 086C04402B5;
 Tue, 17 Jan 2023 12:56:07 +0200 (IST)
To: buildroot@busybox.net
Date: Tue, 17 Jan 2023 12:59:45 +0200
Message-Id: <5ad733d655927dd855102810e494becce05f53a4.1673953185.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1673952967;
 bh=7wd4C31sLqE73wfFLev9Fadu01S9LZgfAA0pP8V6rnI=;
 h=From:To:Cc:Subject:Date:From;
 b=aSyGfjXFWwpiiHdbZm8S+ecjZui6RLjJkcpoVGAp1HEWZ24qNi2IQRPMOVV/Y7q7Q
 O+ii6gHGVRWrpnJhwcWXup/NmD9VfjuxIew32ChM+kn74ye24YDvt8QIV3ZagmWncw
 BBj9DR+i04sUPUREU//y7nIIRpJ2Cx2xrN/if0GQazrWTsJQDoburBaiy9iWqpmqZ1
 X4XWscX4E79p67sbaY1hBMDNbYMYk7/tSlyE/4HPPflJmxvlDcWvhV9yw8SbrWbUWV
 pB2lqQQRF/68O8o1Z4qKhQid5StnphYWYxir3I3pr3S1t6SBFuUJnmGO0pP38B1Jn0
 It+iB9HE/pMXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=aSyGfjXF
Subject: [Buildroot] [PATCH] package/sexpect: new package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sexpect is useful for shell controlled testing.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/sexpect/Config.in    |  7 +++++++
 package/sexpect/sexpect.hash |  3 +++
 package/sexpect/sexpect.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/sexpect/Config.in
 create mode 100644 package/sexpect/sexpect.hash
 create mode 100644 package/sexpect/sexpect.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd392..f2fc4acece43 100644
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
index 995dae2c5755..da47cbd4ed06 100644
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
index 000000000000..7fbdf9b99eb1
--- /dev/null
+++ b/package/sexpect/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SEXPECT
+	bool "sexpect"
+	help
+	  sexpect is another implementation of Expect which is specifically
+	  designed for Shell scripts (sh, bash, ksh, zsh, ...)
+
+	  https://github.com/clarkwang/sexpect
diff --git a/package/sexpect/sexpect.hash b/package/sexpect/sexpect.hash
new file mode 100644
index 000000000000..d5121176269e
--- /dev/null
+++ b/package/sexpect/sexpect.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f6801c8b979d56eec54aedd7ede06e2342f382cee291beea88b52869186c557c  sexpect-2.3.14.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sexpect/sexpect.mk b/package/sexpect/sexpect.mk
new file mode 100644
index 000000000000..7b878600e41f
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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
