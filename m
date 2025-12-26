Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2A3E8FDB5
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 184CC60A60;
	Fri, 26 Dec 2025 20:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mW9hRhnXJani; Fri, 26 Dec 2025 20:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75109606BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766780980;
	bh=q2pMr/lALtRmqfLJJ9BJsMrO6SNm1lYDXg1c4mwT2QU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LdkndJXvhtvSwlNDvJ6xHKYVCL5okwP5RUYAZ8hmSXRlFvMJPR9bcPS5u7/kzxIMH
	 1G1EFZZV8JJ9xVHRIOJrXPBvbbFFKfC4bgbe8Sixctx1Q6G8S/uQiH4x5yBJ7/v9JZ
	 ep+mgo2A7wS1XCAWZ3umDzW3MWhak0anpV58vUAToqJLUqSr++vcA8JWKRNTO/cVPs
	 6zH5s/I0dgc3N/ehT1FqM/eOzgDgYimPwN3AQxeXlea/TUMyRI2Cv/Hie/d00OS+p/
	 T/+HLS4hi3vAcvkrCys+R+Z7OdIhcg6gMv5e7A/3vTo9WPVt41WN5M87h7E243HFU6
	 c9g6qZJnAVM6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75109606BF;
	Fri, 26 Dec 2025 20:29:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DEC00EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3FBA81109
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEeZQDJH19dw for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:29:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E366E81160
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E366E81160
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B735987708; Fri, 26 Dec 2025 20:29:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 21:23:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08aeacbce5fa215905b8ff67a218e2290031837b
X-Git-Newrev: ba24ae14bd7b642d60196f55f364c9b10363f0b1
X-Patchwork-Hint: ignore
Message-Id: <20251226202932.B735987708@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvicorn: bump to 0.40.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ba24ae14bd7b642d60196f55f364c9b10363f0b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
* https://github.com/Kludex/uvicorn/releases/tag/0.39.0
* https://github.com/Kludex/uvicorn/releases/tag/0.40.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index dd8c2bbabe..9049083cf6 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  ee4fbbe43a1e58e6624adb2763161bee  uvicorn-0.38.0.tar.gz
-sha256  fd97093bdd120a2609fc0d3afe931d4d4ad688b6e75f0f929fde1bc36fe0e91d  uvicorn-0.38.0.tar.gz
+md5  9f7303c20d72660dc37ac54d697d0881  uvicorn-0.40.0.tar.gz
+sha256  839676675e87e73694518b5574fd0f24c9d97b46bea16df7b8c05ea1a51071ea  uvicorn-0.40.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index ba27cd8052..11d347a366 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.38.0
+PYTHON_UVICORN_VERSION = 0.40.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/cb/ce/f06b84e2697fef4688ca63bdb2fdf113ca0a3be33f94488f2cadb690b0cf
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/c3/d1/8f3c683c9561a4e6689dd3b1d345c815f10f86acd044ee1fb9a4dcd0b8c5
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
