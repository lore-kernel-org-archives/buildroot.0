Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E672DC369B9
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 21:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF76617AB;
	Tue, 15 Apr 2025 21:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uf6TQvXLX51; Tue, 15 Apr 2025 21:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1CF561782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1CF561782;
	Tue, 15 Apr 2025 21:48:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 324F46B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 178E360EC4
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaWEwAHlfcrC for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 21:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DB5A607CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DB5A607CF
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:48:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C27484BC9; Tue, 15 Apr 2025 21:48:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 23:46:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86f173a74408a35536429198ec10970ee762bafb
X-Git-Newrev: 83f865963a47b4706209997650f7dc053696b6a9
X-Patchwork-Hint: ignore
Message-Id: <20250415214847.4C27484BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-qrcode: bump to 8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=83f865963a47b4706209997650f7dc053696b6a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since 8.0:

- Added support for Python 3.13

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: fix _SITE url]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-qrcode/python-qrcode.hash | 4 ++--
 package/python-qrcode/python-qrcode.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-qrcode/python-qrcode.hash b/package/python-qrcode/python-qrcode.hash
index ceeaf05f49..549e077c2b 100644
--- a/package/python-qrcode/python-qrcode.hash
+++ b/package/python-qrcode/python-qrcode.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/qrcode/json
-md5  29561c9082864010f884d2fc5b3e62de  qrcode-8.0.tar.gz
-sha256  025ce2b150f7fe4296d116ee9bad455a6643ab4f6e7dce541613a4758cbce347  qrcode-8.0.tar.gz
+md5  71039efd5939238780bcd6861bf0bc50  qrcode-8.1.tar.gz
+sha256  e8df73caf72c3bace3e93d9fa0af5aa78267d4f3f5bc7ab1b208f271605a5e48  qrcode-8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  40dfb903c94ee3f789500131311186548ecba5cefd3557623d7700e2522ab994  LICENSE
diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
index 8222ceac8e..f50d49704f 100644
--- a/package/python-qrcode/python-qrcode.mk
+++ b/package/python-qrcode/python-qrcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_QRCODE_VERSION = 8.0
+PYTHON_QRCODE_VERSION = 8.1
 PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
-PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/d7/db/6fc9631cac1327f609d2c8ae3680ecd987a2e97472437f2de7ead1235156
+PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/61/d4/d222d00f65c81945b55e8f64011c33cb11a2931957ba3e2845fb0874fffe
 PYTHON_QRCODE_SETUP_TYPE = poetry
 PYTHON_QRCODE_LICENSE = BSD-3-Clause
 PYTHON_QRCODE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
