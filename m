Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77808F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46E9061417;
	Sun, 15 Mar 2026 22:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fv4AW4Kj_X4Y; Sun, 15 Mar 2026 22:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D6261423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613183;
	bh=HO6cApir/wIgkzJYpZzLH20DGvmP+xsRDY6ip5JG0IU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JavZFtK4WydrplfSoTjdhXtQum81hSMcToJs2m+c8svVo3LJUDO+I7qT2kgmO8iYK
	 w75E/nwef6uV+rznFIiD/V0cpDeSUuSnGzDLeVKe626cPERDlhzB1okgsRvxAL/5Ul
	 4Vmw0OiDrMxHOMHrkbefCIt7PSwK8iGzB9oYqdzSGIfo1an6U22rYhPljYrFrF1TeW
	 FhAaVuv+p64c0GlXUnE19AUpresrdZ7cFpYZgBEltb2n4JhR688gqIVcQOIyd2TkcZ
	 NnRsXIXAasfQftRrhqhbHKh8OYEfyKkkyPQv0AMjE2sA8334wHdqlQr8T617wRxU+4
	 HZS9BqHC21mJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D6261423;
	Sun, 15 Mar 2026 22:19:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 141071B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07265610A8
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEF0XmtKv-Ha for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0046F6112B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0046F6112B
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4218683D9E; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e4e331d18d1d1cb0924d856ab3fa4aaf4d2caea
X-Git-Newrev: 635c145c16c11f90109f49b842c5a1b4184760d1
X-Patchwork-Hint: ignore
Message-Id: <20260315221805.4218683D9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wheel: security bump
 version to 0.46.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/635c145c16c11f90109f49b842c5a1b4184760d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pypa/wheel/blob/0.46.3/docs/news.rst

Version 0.46.2 fixes CVE-2026-24049:
wheel Allows Arbitrary File Permission Modification via Path Traversal

Fixes:
https://www.cve.org/CVERecord?id=CVE-2026-24049

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: mark the commit as "security" and add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 40836a5d1c..7ec38ec86b 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  dddc505d0573d03576c7c6c5a4fe0641  wheel-0.45.1.tar.gz
-sha256  661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729  wheel-0.45.1.tar.gz
+md5  61fb0c9633fe7492933a8f338db23508  wheel-0.46.3.tar.gz
+sha256  e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803  wheel-0.46.3.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 417db7c167..b68a1c102b 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.45.1
+PYTHON_WHEEL_VERSION = 0.46.3
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/8a/98/2d9906746cdc6a6ef809ae6338005b3f21bb568bea3165cfc6a243fdc25c
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/89/24/a2eb353a6edac9a0303977c4cb048134959dd2a51b48a269dfc9dde00c8a
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
