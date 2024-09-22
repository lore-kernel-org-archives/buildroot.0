Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCDACF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C8F781455;
	Sun, 22 Sep 2024 10:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81D_s2uSP7Zt; Sun, 22 Sep 2024 10:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D0E681BE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D0E681BE3;
	Sun, 22 Sep 2024 10:36:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26A9C1BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9EF740190
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvAZZNZ3TlC9 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76EA34025B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76EA34025B
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72CB780FD8; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a2dc345ef584fd209074616dc2981f994427a3c
X-Git-Newrev: d16bb45b68feb06ee72492e67b46b56fee1d693a
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.72CB780FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trio-websocket: bump to
 version 0.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d16bb45b68feb06ee72492e67b46b56fee1d693a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-async-generator runtime dependency.

Add license file which was previously missing.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-trio-websocket/Config.in                  | 1 -
 package/python-trio-websocket/python-trio-websocket.hash | 6 ++++--
 package/python-trio-websocket/python-trio-websocket.mk   | 5 +++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-trio-websocket/Config.in b/package/python-trio-websocket/Config.in
index 7d35fd0296..1b9093e5d2 100644
--- a/package/python-trio-websocket/Config.in
+++ b/package/python-trio-websocket/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_TRIO_WEBSOCKET
 	bool "python-trio-websocket"
-	select BR2_PACKAGE_PYTHON_ASYNC_GENERATOR # runtime
 	select BR2_PACKAGE_PYTHON_TRIO # runtime
 	select BR2_PACKAGE_PYTHON_WSPROTO # runtime
 	help
diff --git a/package/python-trio-websocket/python-trio-websocket.hash b/package/python-trio-websocket/python-trio-websocket.hash
index 3e6e832d90..b7e8302b58 100644
--- a/package/python-trio-websocket/python-trio-websocket.hash
+++ b/package/python-trio-websocket/python-trio-websocket.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trio-websocket/json
-md5  37b141910bdafa3c9b6731aa16646acc  trio-websocket-0.9.2.tar.gz
-sha256  a3d34de8fac26023eee701ed1e7bf4da9a8326b61a62934ec9e53b64970fd8fe  trio-websocket-0.9.2.tar.gz
+md5  3d9bb51b62f562dbdbc2ec067132c4a6  trio-websocket-0.11.1.tar.gz
+sha256  18c11793647703c158b1f6e62de638acada927344d534e3c7628eedcb746839f  trio-websocket-0.11.1.tar.gz
+# Locally computed sha256 checksums
+sha256  2d5e3fc506b6c87ad93b77b9aa76009a58fea72be5fb56e6803bc08cb2887999  LICENSE
diff --git a/package/python-trio-websocket/python-trio-websocket.mk b/package/python-trio-websocket/python-trio-websocket.mk
index 4522b87c9c..3e79bb7108 100644
--- a/package/python-trio-websocket/python-trio-websocket.mk
+++ b/package/python-trio-websocket/python-trio-websocket.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TRIO_WEBSOCKET_VERSION = 0.9.2
+PYTHON_TRIO_WEBSOCKET_VERSION = 0.11.1
 PYTHON_TRIO_WEBSOCKET_SOURCE = trio-websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
-PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/75/91/44a0a016025794ba9fef530a6fbe59987153e2cbea7e11fe2f3d8c618740
+PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/dd/36/abad2385853077424a11b818d9fd8350d249d9e31d583cb9c11cd4c85eda
 PYTHON_TRIO_WEBSOCKET_SETUP_TYPE = setuptools
 PYTHON_TRIO_WEBSOCKET_LICENSE = MIT
+PYTHON_TRIO_WEBSOCKET_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
