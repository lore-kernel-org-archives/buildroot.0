Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05554CD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D089461583;
	Sun,  3 May 2026 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omxVc327xv-E; Sun,  3 May 2026 14:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00CC3615AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819899;
	bh=ixhkSxx2HXv8kXU2uBjDgxo/ujInme7bsnCsUFH/bGI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JCnBWtL6hCH8nI0J1VH30RWXED17eriJsEb3ZiJzrJYVyuNIgm8ZgEUBIkwwHJJxL
	 vDMNfnnjbwr5/jyj4xIPggrzAUG3CS+AMrCuEGFK2v7tnNDmqDx4TLArKQdz4+5yO7
	 17+Yy2Jb79q6Z4SfeO75Cj31AAjFVJFP+Cihb+3IPLyyRejNsdHsC/crrGLnVVyYG1
	 7A/56ig3aZvgVnh/eUg7f3ON5ikdPoN7bDZybQqembfeYVABDvUvPotdWMoJxknhc1
	 TOpDcgYXKa/bDUPVSbsg24VFBlmFD5GPy+6iNwzAPHrYiGBWY7jlvGVK+ybCL+NpZ0
	 0nhmZ1laYIWUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00CC3615AC;
	Sun,  3 May 2026 14:51:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0947C392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D2E461317
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brd1mtGgAQlc for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 716F961304
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 716F961304
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F3BA83FC1; Sun,  3 May 2026 14:50:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eaddc7dae675dd2b1e87372b7e3ec0dff649660a
X-Git-Newrev: b3e7ed676f37c69982d97a74ad247e36d0caf702
X-Patchwork-Hint: ignore
Message-Id: <20260503145048.2F3BA83FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-smbus2: bump to version
 0.6.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3e7ed676f37c69982d97a74ad247e36d0caf702
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/kplindegaard/smbus2/releases/tag/0.6.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-smbus2/python-smbus2.hash | 4 ++--
 package/python-smbus2/python-smbus2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbus2/python-smbus2.hash b/package/python-smbus2/python-smbus2.hash
index b0c9802204..223797c573 100644
--- a/package/python-smbus2/python-smbus2.hash
+++ b/package/python-smbus2/python-smbus2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbus2/json
-md5  d832ad65cbf7f58685c0e5647ecc6494  smbus2-0.6.0.tar.gz
-sha256  9b5ff1e998e114730f9dfe0c4babbef06c92468cfb61eaa684e30f225661b95b  smbus2-0.6.0.tar.gz
+md5  c401511f61d5296d4750ef7af4c121f2  smbus2-0.6.1.tar.gz
+sha256  2b043372abf8f6029a632c3aab36b641c5d5872b1cbad599fc68e17ac4fd90a5  smbus2-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6ee9cf18c3a75dd76fb549a4b607ae34eedc31a796c48157895e2ad28d66ce79  LICENSE
diff --git a/package/python-smbus2/python-smbus2.mk b/package/python-smbus2/python-smbus2.mk
index fb1d4fc02c..9676670360 100644
--- a/package/python-smbus2/python-smbus2.mk
+++ b/package/python-smbus2/python-smbus2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBUS2_VERSION = 0.6.0
+PYTHON_SMBUS2_VERSION = 0.6.1
 PYTHON_SMBUS2_SOURCE = smbus2-$(PYTHON_SMBUS2_VERSION).tar.gz
-PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/4e/36/afafd43770caae69f04e21402552a8f94a072def46a002fab9357f4852ce
+PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/87/37/b3f7b501502c4915ba3819d1dc277bf3f5fae4a9d067caa4f502aaddd889
 PYTHON_SMBUS2_SETUP_TYPE = setuptools
 PYTHON_SMBUS2_LICENSE = MIT
 PYTHON_SMBUS2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
