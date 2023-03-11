Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E24CC6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 13:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D92082033;
	Sat, 11 Mar 2023 13:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D92082033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLQcBimsKrsy; Sat, 11 Mar 2023 13:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8076C82160;
	Sat, 11 Mar 2023 13:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8076C82160
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9AC1BF33C
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 13:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A083822B2
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 13:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A083822B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tq0qwxGFByTl for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 13:09:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A4FA81FD4
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 13:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A4FA81FD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02601861BA; Sat, 11 Mar 2023 13:09:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 14:05:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c89f36821b8b37143efcd53558c9fda24788808
X-Git-Newrev: f9fe0cf8f64f8ea48f3ee4af28053d7bea52b61f
X-Patchwork-Hint: ignore
Message-Id: <20230311130921.02601861BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-glslang: add new host
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9fe0cf8f64f8ea48f3ee4af28053d7bea52b61f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for mesa3d 22.3.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  1 +
 package/python-glslang/python-glslang.hash |  3 +++
 package/python-glslang/python-glslang.mk   | 13 +++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1dc085b87f..7ef8f79a71 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -439,6 +439,7 @@ F:	package/pound/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
+F:	package/python-glslang/
 F:	package/python-mwclient/
 F:	package/python-mwscrape/
 F:	package/python-mwscrape2slob/
diff --git a/package/python-glslang/python-glslang.hash b/package/python-glslang/python-glslang.hash
new file mode 100644
index 0000000000..df9127939e
--- /dev/null
+++ b/package/python-glslang/python-glslang.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  592c98aeb03b3e81597ddaf83633c4e63068d14b18a766fd11033bad73127162  python-glslang-11.13.0.tar.gz
+sha256  adb783e734e906d1f46db5df29991dbde84bdb0ceab502ac2febb44fe3c2b5f4  LICENSE.txt
diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
new file mode 100644
index 0000000000..94f480e30a
--- /dev/null
+++ b/package/python-glslang/python-glslang.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-glslang
+#
+################################################################################
+
+PYTHON_GLSLANG_VERSION = 11.13.0
+PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
+PYTHON_GLSLANG_LICENSE = BSD-3-Clause
+PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
+PYTHON_GLSLANG_DEPENDENCIES = host-python3
+
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
