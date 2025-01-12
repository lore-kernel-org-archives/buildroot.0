Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45336C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135DA84BFF;
	Fri, 28 Feb 2025 16:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9fUWdAYgbZv; Fri, 28 Feb 2025 16:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A03F84E38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A03F84E38;
	Fri, 28 Feb 2025 16:56:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 100E268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D89E542D5B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rirUVvDjro2W for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AA9442D99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AA9442D99
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7244687C2C; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 12:03:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b74a5a1e929dd15e01108d94db51a3a1ea74d3f6
X-Git-Newrev: 0fb0ade539a0856790d08bedac4a9d70b8e5607e
X-Patchwork-Hint: ignore
Message-Id: <20250228163007.7244687C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-tempora: bump
 to version 5.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fb0ade539a0856790d08bedac4a9d70b8e5607e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Replace python-pytz runtime dependency with python-dateutil.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tempora/Config.in           | 2 +-
 package/python-tempora/python-tempora.hash | 4 ++--
 package/python-tempora/python-tempora.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tempora/Config.in b/package/python-tempora/Config.in
index 3f4481422a..1e496faa27 100644
--- a/package/python-tempora/Config.in
+++ b/package/python-tempora/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_TEMPORA
 	bool "python-tempora"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  Objects and routines pertaining to date and time.
 
diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index 9d3487d67b..15bdaaf783 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  e4ca48a06f4c8b9aa21b8081937353f2  tempora-5.7.0.tar.gz
-sha256  888190a2dbe3255ff26dfa9fcecb25f4d38434c0f1943cd61de98bb41c410c50  tempora-5.7.0.tar.gz
+md5  ca7fb7c9523fb5232b734a19dae05c6a  tempora-5.8.0.tar.gz
+sha256  1e9606e65a3f2063460961d68515dee07bdaca0859305a8d3e6604168175fef1  tempora-5.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index aeb2e4687c..3b6c644b53 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.7.0
+PYTHON_TEMPORA_VERSION = 5.8.0
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/5d/52/b4ff0ca21695a4f8ac0f158d884587b5eba08b0e95356b0ea210e00446ac
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/c3/f2/bbd6d2178791eaf8bac06857cb0ee39840e69f7b64ecb0c414bf8f46daff
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
