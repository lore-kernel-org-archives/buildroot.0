Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE04D68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240B0611C0;
	Wed, 17 Dec 2025 21:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9SHDvEDi5mD; Wed, 17 Dec 2025 21:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 873B1611B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007916;
	bh=piGlcUaU3RUxAciWN7kfuQgUi2s8OvdIvcKyC5h5ouM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HYPUyCRw8OqARBOP3zxOfJ4owDY9Hct1ErsKROfFTW/9NefzRezcBDmImXBVq7twD
	 vVyVNjKIcyNgEhtHqs014mot0588mbXFSfOkF/+GAu93aAWIhSuDDXI5ZWnGGjNirt
	 QqGRTWgCLlr/oz+V4XhOe7xYGL3i4qoMJlbRTuiv5B6EmpOePLR5reqvFB9TqceKFT
	 s3u9LqZTFHY0Jj0qVCObV0fWW7FOzfumSw77BVi3ialAH7TDqohBJKyBr3vSRbq3fH
	 6TUXAGNUhQnnOkL1JEtnosncIm8Mxwl9LC6liM8T7gN/ouHCsPB6+s/wjLcFn7iKdU
	 HJWhBk2S8SvLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 873B1611B5;
	Wed, 17 Dec 2025 21:45:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C47375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 333AC40F72
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xP6p6k8eifPo for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DE3A40F81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DE3A40F81
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C7DB81E43; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:08:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca0dbff9f2482fcbba081be33cd870dcf89049f9
X-Git-Newrev: 8ae60abbe92de57c64aa4e2a5d07e32025a7e25b
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.5C7DB81E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: bump version to
 5.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ae60abbe92de57c64aa4e2a5d07e32025a7e25b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/ultrajson/ultrajson/releases/tag/5.11.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 153a49ca66..b4b0a4906e 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  7e61ead11ccf121cf4b1c121ec444e49  ujson-5.10.0.tar.gz
-sha256  b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1  ujson-5.10.0.tar.gz
+md5  dfe38201fc1cdbb6f9e0bdf135173a6a  ujson-5.11.0.tar.gz
+sha256  e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c12eb8b991fe2010e0  ujson-5.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  36866344f0a486541bd9800f1a407a056c0c214a82c658f059694daf3dc394d2  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index c6de382305..88e6c736b9 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.10.0
+PYTHON_UJSON_VERSION = 5.11.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/f0/00/3110fd566786bfa542adb7932d62035e0c0ef662a8ff6544b6643b3d6fd7
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/43/d9/3f17e3c5773fb4941c68d9a37a47b1a79c9649d6c56aefbed87cc409d18a
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
