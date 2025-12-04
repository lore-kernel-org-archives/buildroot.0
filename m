Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C4CD2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B57664078C;
	Thu,  4 Dec 2025 20:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaGfz9KMORsJ; Thu,  4 Dec 2025 20:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A42407C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880759;
	bh=DGw3gTwVJ4i0kIKj6hiRb7dM7MDWzsxXBFmtnjnyi5g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oEo9QBaSCCrhSXp/mB+pKFSZsVBLNPC9qwxMPr2yt0y/zWTzqj2NKLVS3OsHA0f5I
	 X6u0XfWnf7xN4IkOd9QKJSDmTkQB7AN/HmnMPVLN3urmszwNUrXiTjqv1ZDYbkUmRj
	 wL8smwlRj3Kw/EXPtH8C5T18DvhzjsgdUFb7A+Tt8tlvL2jz3nMClnJu2fpGp8zvCg
	 ZYaKL5bS13jK+PP78NoZQSIzsvGxFCHrByrvrArUFR8Ii2y/DeZRTWuMgJdEqnGpr+
	 QidGjue6vEOkcHk16wE5JQAaMwKb9KjqgyEA8mLzpwD87Ye/joytTEKIP1Nxbgwf5Q
	 V0fdme92lutLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A42407C8;
	Thu,  4 Dec 2025 20:39:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D81641A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B36407CA
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqAsNccsOBNJ for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8FA14078C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8FA14078C
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98863864DB; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:11:39 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e8828d1b7820c1952c06648c803669889f25dff0
X-Git-Newrev: aeae779ce793653873a7523dad5726b191b2d5bc
X-Patchwork-Hint: ignore
Message-Id: <20251204203917.98863864DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-starlette:
 bump to 0.48.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aeae779ce793653873a7523dad5726b191b2d5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release Notes: https://github.com/Kludex/starlette/releases/tag/0.48.0
Github namespace changed, so change the link in Config.in.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 62cfbc1409aca2a9a6d19419189f05bed947f516)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-starlette/Config.in             | 2 +-
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-starlette/Config.in b/package/python-starlette/Config.in
index 90f590689a..64f8345a92 100644
--- a/package/python-starlette/Config.in
+++ b/package/python-starlette/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_STARLETTE
 	help
 	  The little ASGI library that shines.
 
-	  https://github.com/encode/starlette
+	  https://github.com/Kludex/starlette
diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 4937d93ad0..bcc71c09c5 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  5ae93b12a6b5527fc97c5ba3921bc552  starlette-0.47.3.tar.gz
-sha256  6bc94f839cc176c4858894f1f8908f0ab79dfec1a6b8402f6da9be26ebea52e9  starlette-0.47.3.tar.gz
+md5  9e56e4be3ee2a746ee6375fd9e81f61c  starlette-0.48.0.tar.gz
+sha256  7e8cee469a8ab2352911528110ce9088fdc6a37d9876926e73da7ce4aa4c7a46  starlette-0.48.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 04f40460b7..a643623e03 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.47.3
+PYTHON_STARLETTE_VERSION = 0.48.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/15/b9/cc3017f9a9c9b6e27c5106cc10cc7904653c3eec0729793aec10479dd669
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/a7/a5/d6f429d43394057b67a6b5bbe6eae2f77a6bf7459d961fdb224bf206eee6
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
