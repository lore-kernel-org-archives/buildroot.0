Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2894CC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 18:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5D47600D1;
	Wed,  3 Aug 2022 18:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D47600D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KK3OMy6yCZ2C; Wed,  3 Aug 2022 18:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E3A060590;
	Wed,  3 Aug 2022 18:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E3A060590
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF60A1BF5A7
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 18:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97F7281551
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 18:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97F7281551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_ubTMhZffQr for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 18:54:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D94B58144C
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 18:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D94B58144C
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1EC4486D99; Wed,  3 Aug 2022 18:40:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 20:53:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa4dba4aa202de20e3821eace5513aad81c23275
X-Git-Newrev: e27ef7658265a62e74bf9f0e66e5e5432f453f6a
X-Patchwork-Hint: ignore
Message-Id: <20220803184005.1EC4486D99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbw: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e27ef7658265a62e74bf9f0e66e5e5432f453f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/mbw/Config.in |  8 ++++++++
 package/mbw/mbw.hash  |  3 +++
 package/mbw/mbw.mk    | 12 ++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 63bb80fc9d..e2d7fc3b04 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1183,6 +1183,7 @@ N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/libxcrypt/
 F:	package/liquid-dsp/
+F:	package/mbw/
 F:	package/pixiewps/
 F:	package/python-beniget/
 F:	package/python-gast/
diff --git a/package/Config.in b/package/Config.in
index 61783ba400..d593277e80 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -122,6 +122,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/lttng-babeltrace/Config.in"
 	source "package/lttng-modules/Config.in"
 	source "package/lttng-tools/Config.in"
+	source "package/mbw/Config.in"
 	source "package/mcelog/Config.in"
 	source "package/memstat/Config.in"
 	source "package/netperf/Config.in"
diff --git a/package/mbw/Config.in b/package/mbw/Config.in
new file mode 100644
index 0000000000..e4f56c8387
--- /dev/null
+++ b/package/mbw/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MBW
+	bool "mbw"
+	help
+	  MBW is a memory bandwidth benchmarking tool.
+	  MBW determines the "copy" memory bandwidth available
+	  to userspace programs.
+
+	  https://github.com/raas/mbw
diff --git a/package/mbw/mbw.hash b/package/mbw/mbw.hash
new file mode 100644
index 0000000000..74e38992de
--- /dev/null
+++ b/package/mbw/mbw.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  3c396ce09bb78c895e4d45e99b1ae07f80e3ea5eee59d78ed2048a7f2ae591ae  mbw-1.5.tar.gz
+sha256  1afb2b8258506742238b9ceb8a865d7030c5889c56ba2911a0c0c042aa1335d1  mbw.spec
diff --git a/package/mbw/mbw.mk b/package/mbw/mbw.mk
new file mode 100644
index 0000000000..755a9f5293
--- /dev/null
+++ b/package/mbw/mbw.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# mbw
+#
+################################################################################
+
+MBW_VERSION = 1.5
+MBW_SITE = $(call github,raas,mbw,v$(MBW_VERSION))
+MBW_LICENSE = LGPL-2.1
+MBW_LICENSE_FILES = mbw.spec
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
