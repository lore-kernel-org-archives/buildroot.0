Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F722C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9F881F8F;
	Tue,  2 Jul 2024 07:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQWeFeJT90JE; Tue,  2 Jul 2024 07:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4359820B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4359820B3;
	Tue,  2 Jul 2024 07:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 122FF1BF97C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1CBC81FE6
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGWyPmILF8zu for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9823981FC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9823981FC8
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 943D08397C; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:02:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b411dc60181c50d0ac2d9eb506a8fd5bd1a4ac4f
X-Git-Newrev: f33b2227416ccefe7aff4f612644cd932af1f110
X-Patchwork-Hint: ignore
Message-Id: <20240702070531.943D08397C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.111.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f33b2227416ccefe7aff4f612644cd932af1f110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from hatchling to pdm-backend pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 224eccbccd..2be006a97d 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  5e9226e70e1553a630599cf584ed53de  fastapi-0.110.0.tar.gz
-sha256  266775f0dcc95af9d3ef39bad55cff525329a931d5fd51930aadd4f428bf7ff3  fastapi-0.110.0.tar.gz
+md5  32df7b178fb59e180d34729be33d5024  fastapi-0.111.0.tar.gz
+sha256  b9db9dd147c91cb8b769f7183535773d8741dd46f9dc6676cd82eab510228cd7  fastapi-0.111.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index c1844960b9..262b166907 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.110.0
+PYTHON_FASTAPI_VERSION = 0.111.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/61/53/326977db62bf34bbdfc64acb9414e1881af7ea14e8a062fd1c11a8697616
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0e/1f/f4a99e92c583780787e04b05aa9d8a8db9ec76d091d81545948a006f5b44
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
 PYTHON_FASTAPI_CPE_ID_VENDOR = fastapi_project
 PYTHON_FASTAPI_CPE_ID_PRODUCT = fastapi
-PYTHON_FASTAPI_DEPENDENCIES = host-python-hatchling
+PYTHON_FASTAPI_DEPENDENCIES = host-python-pdm-backend
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
