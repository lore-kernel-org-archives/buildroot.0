Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE5FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 22:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B275E40A42;
	Fri, 11 Feb 2022 22:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXhG66JwM7ej; Fri, 11 Feb 2022 22:42:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CFAB40A41;
	Fri, 11 Feb 2022 22:42:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E930C1BF34E
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 22:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D35C640A16
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 22:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1P5E7HopEz1 for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 22:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1A1E40A41
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 22:42:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3A77B82B88; Fri, 11 Feb 2022 22:34:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 23:41:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 807bf505f42997f98f8acb7c7046ca5f97df08bb
X-Git-Newrev: c26eab78ab17bcc507b28a7e9eb70a08ffe88ef3
X-Patchwork-Hint: ignore
Message-Id: <20220211223443.3A77B82B88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyrex: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c26eab78ab17bcc507b28a7e9eb70a08ffe88ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop package which is not used by anyone and can't be built since drop
of host-python in commit 2743ce00ca61fde1537b64a165a69d497052be58

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                             |  1 -
 package/python-pyrex/python-pyrex.hash |  3 ---
 package/python-pyrex/python-pyrex.mk   | 15 ---------------
 3 files changed, 19 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0e759bc168..eb073c41f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1934,7 +1934,6 @@ F:	package/python-ipy/
 F:	package/python-iwlib/
 F:	package/python-posix-ipc/
 F:	package/python-pycairo/
-F:	package/python-pyrex/
 F:	package/python-pysftp/
 F:	package/python-tinyrpc/
 F:	package/python-txdbus/
diff --git a/package/python-pyrex/python-pyrex.hash b/package/python-pyrex/python-pyrex.hash
deleted file mode 100644
index e8963558fc..0000000000
--- a/package/python-pyrex/python-pyrex.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  5f87df06831d0b3412eb4bc9d3fc2ee7bfae1b913d7da8c23ab2bf5699fb6b50  Pyrex-0.9.9.tar.gz
-sha256  5c1aec55fc8c399ec23968ddb2117eec8f7a53f002c15472a8b0aa7426790700  LICENSE.txt
diff --git a/package/python-pyrex/python-pyrex.mk b/package/python-pyrex/python-pyrex.mk
deleted file mode 100644
index 6284a5f228..0000000000
--- a/package/python-pyrex/python-pyrex.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-pyrex
-#
-################################################################################
-
-PYTHON_PYREX_VERSION = 0.9.9
-PYTHON_PYREX_SOURCE = Pyrex-$(PYTHON_PYREX_VERSION).tar.gz
-PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex
-PYTHON_PYREX_LICENSE = Apache-2.0
-PYTHON_PYREX_LICENSE_FILES = LICENSE.txt
-PYTHON_PYREX_SETUP_TYPE = distutils
-HOST_PYTHON_PYREX_NEEDS_HOST_PYTHON = python2
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
