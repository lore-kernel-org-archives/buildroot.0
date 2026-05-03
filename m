Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCDFCD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A34061530;
	Sun,  3 May 2026 14:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irOAjsYcCEoS; Sun,  3 May 2026 14:51:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C85561560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819888;
	bh=LBPegXB9rfxOOhYPCxvWy43f6HNbNg9plWl39vXcQC0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GI1/2HWOHXPjIBdktOA9xT5aIg4lk6a8tQHE/mcd6Hmq2z22uTe8WbftcAI88KNzK
	 kWMAVkgB4o0P8pAi6iSvS4jf4Oju34NckVTtGed68124FMxstfxH5PX/Z6UnErya6F
	 QLlBiwfvof38FV0FEi9lh/QjPjGXcBzN+EOeYA3MxDjxoOaY7/XwcoJ9GKZZ5KbwtV
	 enETRv5l+r06y6BFWFv+S+MBT0j3KhOMUFo0ZMR8gIfMLuewhZgE11tQMFRXVcO0Qk
	 UPAS3toXXOSkg5W7nUGNhK0lzbE8BEji10egdxD0w/L7Z4avBK8VbdQhpueF1d0iaS
	 js5XOme0UlTeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C85561560;
	Sun,  3 May 2026 14:51:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E134190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 019C184268
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gay9iYG1_5NV for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C5158409F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C5158409F
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0573283E54; Sun,  3 May 2026 14:50:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb361087e10e11bc91d7ddceb3ca16186f3d960c
X-Git-Newrev: 4a02827055c924586729e6c2c92234f95551a95b
X-Patchwork-Hint: ignore
Message-Id: <20260503145046.0573283E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplejson: bump version to
 4.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a02827055c924586729e6c2c92234f95551a95b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/simplejson/simplejson/blob/v4.1.1/CHANGES.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index 748af3ccca..a8614cb260 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  2b51376ed91109e4041a056a8f59ee73  simplejson-3.20.2.tar.gz
-sha256  5fe7a6ce14d1c300d80d08695b7f7e633de6cd72c80644021874d985b3393649  simplejson-3.20.2.tar.gz
+md5  bd06bf5c6db9fdef4b220d0aebb03c43  simplejson-4.1.1.tar.gz
+sha256  c08eb9f7a90f77ae470e19a07472e9a79ebc0d1c2315d86a72767665bd5ba79f  simplejson-4.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index c42acc4196..1dc2eacdf7 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.20.2
+PYTHON_SIMPLEJSON_VERSION = 4.1.1
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/41/f4/a1ac5ed32f7ed9a088d62a59d410d4c204b3b3815722e2ccfb491fa8251b
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/0e/2a/54837395a3487c725669428d513293612a48d82b95a0642c936932e5d898
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
