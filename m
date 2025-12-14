Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA76D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 731DD406D1;
	Sun, 14 Dec 2025 21:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNsUrEIrv91D; Sun, 14 Dec 2025 21:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4E7940715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747315;
	bh=d/wSv9zCyCxXIcsdo4wqYxxwTBuF2wcAHEqlwocbfX8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S6qIShwSy8ENwS9JFaDGUFJ1hwHpGvcBkKm223fh479c8STyFujuim8iaa8JLjFS7
	 TCRDeFD/FeXNKwKlQ7byEq5s/v/mQFJS9doJ31rV+8yJoOelKh3eDILmuLsivGx2fl
	 JzZcZl67vgTmWAgjN/gPWbOQILsvnRrm/H76M+F4yXGGonb0mdw4rp2qV+dFY9bQyI
	 +8QOhHBXDTGtirYKjOj/82yzM+dqo3cK5mgAUWhqsHysMhncxslLRL7IB4chjK1wHp
	 0cxoL1kEca2QmJAjNfbCP6ecArW8XLvxahlvBpMmQYXmhf9OTuUlRjDMjpWSpsFzWO
	 NOrwFy4xCXqSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4E7940715;
	Sun, 14 Dec 2025 21:21:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09F5D2D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98E9760877
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgkCk4HQSgqb for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A34B5607D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A34B5607D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 926598355B; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a24dd62277111f5fc0fae06093574cdd96ed0a5
X-Git-Newrev: 70d868991bb29a6e8870cbf63b6fd0b712097a9e
X-Patchwork-Hint: ignore
Message-Id: <20251214212139.926598355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-contourpy: bump version to
 1.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=70d868991bb29a6e8870cbf63b6fd0b712097a9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/contourpy/contourpy/blob/v1.3.3/docs/changelog.rst

Updated license hash due to copyright year bump:
https://github.com/contourpy/contourpy/commit/ebb716818af775fb969099617e0d68386217d503

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-contourpy/python-contourpy.hash | 6 +++---
 package/python-contourpy/python-contourpy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-contourpy/python-contourpy.hash b/package/python-contourpy/python-contourpy.hash
index aef7c3de74..2d5acb2375 100644
--- a/package/python-contourpy/python-contourpy.hash
+++ b/package/python-contourpy/python-contourpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/contourpy/json
-md5  06a4ae6ab30b855514797cac7073ed08  contourpy-1.3.1.tar.gz
-sha256  dfd97abd83335045a913e3bcc4a09c0ceadbe66580cf573fe961f4a825efa699  contourpy-1.3.1.tar.gz
+md5  3592ea8e491e04fc7a87721e0beb7b0e  contourpy-1.3.3.tar.gz
+sha256  083e12155b210502d0bca491432bb04d56dc3432f95a979b429f2848c3dbe880  contourpy-1.3.3.tar.gz
 # Locally computed sha256 checksums
-sha256  c7d0a153bffaa104044463ebc633793d451722efd3138b5ffd2527b40f1505a2  LICENSE
+sha256  34170979fc64f4f5e6dfa66ef27dec314ffffc5852000c60f4836ec1dfbf156e  LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
index 08c45f3805..4fe04f5f71 100644
--- a/package/python-contourpy/python-contourpy.mk
+++ b/package/python-contourpy/python-contourpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONTOURPY_VERSION = 1.3.1
+PYTHON_CONTOURPY_VERSION = 1.3.3
 PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
-PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/25/c2/fc7193cc5383637ff390a712e88e4ded0452c9fbcf84abe3de5ea3df1866
+PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/58/01/1253e6698a07380cd31a736d248a3f2a50a7c88779a1813da27503cadc2a
 PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
 PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
 PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
