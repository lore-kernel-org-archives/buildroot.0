Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F191CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0638141ABF;
	Fri, 15 May 2026 13:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRVmpDC8s0no; Fri, 15 May 2026 13:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 204F441AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851731;
	bh=8R8sG30PzyV1Dq3wD2iF62b4or1+3qY9bWd617uifnQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B+Gg9RoueG3sB0EynqC/FSDsOq7HzSUF7apYdoFRS1EhrGWwjP3/p1B5kl5mczB3a
	 v3yrIWUTKApTvIYOktBWcah4YNkHerOmV4RYOIadqNQ1ZYGMEPzMrGWoo7thscmz85
	 BBmDFKKDsWhMlzufS1i4rq8f7Sw5aF6C9vraJYDjKqwayqzK3DW4mpENE8KUXwsCVp
	 NSfqGre/HGhcd8NRV3lJvJyIYtfS3x6NuefFekLHHZP+4oJMZwCpx7GLTAQas7fdmp
	 GKHIuLEEybuCE2QgLj16zm0w+AoH+LGK3s0FCbyyEMeMOlrF6xbwfVMBjW9piqXhQt
	 G4xH862NOi/9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 204F441AA8;
	Fri, 15 May 2026 13:28:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFBD36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0D536156B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLlcpdEurou0 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8141261565
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8141261565
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3C4986356; Fri, 15 May 2026 13:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 15:18:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6118c243c99c7e85bc8598f5ba8194afa0a0442f
X-Git-Newrev: 3a221fe6525b2dc6d55a7c5c3a0a18af148aa16d
X-Patchwork-Hint: ignore
Message-Id: <20260515132816.D3C4986356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-requests:
 security bump version to 2.33.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a221fe6525b2dc6d55a7c5c3a0a18af148aa16d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/psf/requests/releases/tag/v2.33.1

https://github.com/psf/requests/releases/tag/v2.33.0
Fixes CVE-2026-25645.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b595f48fd9c4077cc0ae2847c2a9d3c00a13603c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 1bc440667b..4fda8ea71e 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  cb3d3c58f07cf23f12c345f2c96a6f12  requests-2.32.5.tar.gz
-sha256  dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf  requests-2.32.5.tar.gz
+md5  ebc3b42b51c6245524345d170e5d4c50  requests-2.33.1.tar.gz
+sha256  18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517  requests-2.33.1.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index e5aa7006ee..3af00a7b9b 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.32.5
+PYTHON_REQUESTS_VERSION = 2.33.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/5f/a4/98b9c7c6428a668bf7e42ebb7c79d576a1c3c1e3ae2d47e674b468388871
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
