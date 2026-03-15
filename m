Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F64AF3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63543614B3;
	Sun, 15 Mar 2026 22:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbMsQLMBlf3g; Sun, 15 Mar 2026 22:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF2C614CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613206;
	bh=XbAxOMhe1lKfBkVwUkFOmOH+eQOMy7AjC+7P9gDA6ck=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L6uWv3tRxhAy6tKZA0qjdWIYCdGkI8dwtvXI5i7xpIcUZulAKqbbo6aacVadj8rCe
	 KURD5Jm18793yuRovZLajXHf9XnJvy9KIcPQhLHcSgn8ebhCa9EszAMVhtXsSyABxe
	 FJ3wU69hYPcnYyaBcA9VMp5cIr183ogLPAE0HbfcpUrIwcsH9dfmYC7aY0J4ke/TT9
	 bDHtsggRWLew1oB/rOeKe/+XEAIbtRTtl8t/JjLlmlRF8AfuNlJ8DAwB3V7NYefUcP
	 OZmhgQgJjIhGd+MyStSVFX0dR6SgClJjOy7JccN9fV+ZXUb3EaoACUbbmMFr3tmU3Y
	 Rd3R9+eoarDMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FF2C614CC;
	Sun, 15 Mar 2026 22:20:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FBFF1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD4DF61203
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Byoao5DOxrJ9 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C48186111F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C48186111F
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1233B7FE0B; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df796e693c3b7049e23536b5b403b55a06f4bc77
X-Git-Newrev: 3fb9b3b8f4e050b95d6e16391d3d74d6abb33af7
X-Patchwork-Hint: ignore
Message-Id: <20260315221805.1233B7FE0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvicorn: bump version to
 0.41.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3fb9b3b8f4e050b95d6e16391d3d74d6abb33af7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Kludex/uvicorn/blob/0.41.0/docs/release-notes.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 9049083cf6..334a678c19 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  9f7303c20d72660dc37ac54d697d0881  uvicorn-0.40.0.tar.gz
-sha256  839676675e87e73694518b5574fd0f24c9d97b46bea16df7b8c05ea1a51071ea  uvicorn-0.40.0.tar.gz
+md5  e705ea164c44f6cbc5ea6edb47a8745b  uvicorn-0.41.0.tar.gz
+sha256  09d11cf7008da33113824ee5a1c6422d89fbc2ff476540d69a34c87fab8b571a  uvicorn-0.41.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 11d347a366..bdcdb74bd4 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.40.0
+PYTHON_UVICORN_VERSION = 0.41.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/c3/d1/8f3c683c9561a4e6689dd3b1d345c815f10f86acd044ee1fb9a4dcd0b8c5
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/32/ce/eeb58ae4ac36fe09e3842eb02e0eb676bf2c53ae062b98f1b2531673efdd
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
