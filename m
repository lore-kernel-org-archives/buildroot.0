Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDB1D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A0B83A52;
	Fri, 12 Dec 2025 07:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyAXHzoJFB-1; Fri, 12 Dec 2025 07:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A10083E6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526252;
	bh=V3rZ9JWG1tnoq1pzAS5bX7bOb7LFsamNEop/vgkUvxE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z2jiy3LdILYRBoDebadNi6kNdhQLs29+TLWXdVqehmVnGYYZm29iijgHo48lr+TwV
	 LkEuBiB/rQyliPJ9hw1tYya2YzHZapHykPRwY/a7VZSdEbtV5tnPtGJoxOa0Q/J2+b
	 /5hLKdNV3B2an0cUZ27cG32KKHDDua3862KfeEhXDqELvuIcG9LnfXGO5870YVInhf
	 dcQ/MdshkwlFMXzjI5q5hUynzTZJIvq8cbv6PUB1iuDjhnQmwajHqcB7tiLvUCR5iW
	 vOcCnMHSaJQi/RCphmUf3W+wLpd/Pqw4PCjrA5oXFv1GvultbBEum+zUFrwRpQpJKA
	 rkaVxq9xVAITQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A10083E6D;
	Fri, 12 Dec 2025 07:57:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F7C2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B0124115B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNkyvcsR5yvX for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450DB4111F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 450DB4111F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4443E86C93; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 23:00:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1c31dc5e6746be104345eaae93a12017a6447be
X-Git-Newrev: 6ed35083dc9611e5f93a3ece5c322e966015f5dc
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.4443E86C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to 0.123.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ed35083dc9611e5f93a3ece5c322e966015f5dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This introduces a new trivial runtime dependency (annotated-doc) since
0.120.0.

Changes:
* https://github.com/fastapi/fastapi/releases/tag/0.120.0
* https://github.com/fastapi/fastapi/releases/tag/0.120.1
* https://github.com/fastapi/fastapi/releases/tag/0.120.2
* https://github.com/fastapi/fastapi/releases/tag/0.120.3
* https://github.com/fastapi/fastapi/releases/tag/0.120.4
* https://github.com/fastapi/fastapi/releases/tag/0.121.0
* https://github.com/fastapi/fastapi/releases/tag/0.121.1
* https://github.com/fastapi/fastapi/releases/tag/0.121.2
* https://github.com/fastapi/fastapi/releases/tag/0.121.3
* https://github.com/fastapi/fastapi/releases/tag/0.122.0
* https://github.com/fastapi/fastapi/releases/tag/0.122.1
* https://github.com/fastapi/fastapi/releases/tag/0.123.0
* https://github.com/fastapi/fastapi/releases/tag/0.123.1
* https://github.com/fastapi/fastapi/releases/tag/0.123.2
* https://github.com/fastapi/fastapi/releases/tag/0.123.3
* https://github.com/fastapi/fastapi/releases/tag/0.123.4
* https://github.com/fastapi/fastapi/releases/tag/0.123.5
* https://github.com/fastapi/fastapi/releases/tag/0.123.6
* https://github.com/fastapi/fastapi/releases/tag/0.123.7
* https://github.com/fastapi/fastapi/releases/tag/0.123.8
* https://github.com/fastapi/fastapi/releases/tag/0.123.9

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/Config.in           | 1 +
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index 21997daf9a..0dd4499a3f 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_FASTAPI
 	bool "python-fastapi"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANNOTATED_DOC # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 34bfe22c87..7ef8628579 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  5d539db8065d3579430ed00577e8a86b  fastapi-0.119.1.tar.gz
-sha256  a5e3426edce3fe221af4e1992c6d79011b247e3b03cc57999d697fe76cbf8ae0  fastapi-0.119.1.tar.gz
+md5  b72bd92dd17ba585f8fc3cf37f95c6f2  fastapi-0.123.9.tar.gz
+sha256  ab33d672d8e1cc6e0b49777eb73c32ccf20761011f5ca16755889ab406fd1de0  fastapi-0.123.9.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 4a067494a7..207dc88d8f 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.119.1
+PYTHON_FASTAPI_VERSION = 0.123.9
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a6/f4/152127681182e6413e7a89684c434e19e7414ed7ac0c632999c3c6980640
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/2c/01/c3fb48c0135d89586a03c3e2c5bc04540dda52079a1af5cac4a63598efb9
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
