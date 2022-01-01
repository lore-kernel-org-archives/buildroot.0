Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90E2C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 09:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B51460E05;
	Sat,  1 Jan 2022 09:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CW0Fk_dQyeO6; Sat,  1 Jan 2022 09:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FAD860DE5;
	Sat,  1 Jan 2022 09:54:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01B431BF957
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E47A581438
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9jN1Fu_SPrr for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42F9981374
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2E2FD813B8; Sat,  1 Jan 2022 09:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 10:50:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 393614da509c0ce5984b75b943bb7284454fb96c
X-Git-Newrev: cc5b783b191adb1bc6a0714a06b247d2433535fe
X-Patchwork-Hint: ignore
Message-Id: <20220101094828.2E2FD813B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-sse: bump to
 version 2.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc5b783b191adb1bc6a0714a06b247d2433535fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to full text removal:
https://github.com/aio-libs/aiohttp-sse/commit/307fd35a84a66b7fb5adfd70cd5b7d709fa8508c

Fixes(python 3.10 compatibility):
  File "/usr/lib/python3.10/site-packages/aiohttp_sse/__init__.py", line 107, in wait
  File "/usr/lib/python3.10/site-packages/aiohttp_sse/__init__.py", line 144, in _ping
TypeError: sleep() got an unexpected keyword argument 'loop'

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aiohttp-sse/python-aiohttp-sse.hash | 6 +++---
 package/python-aiohttp-sse/python-aiohttp-sse.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.hash b/package/python-aiohttp-sse/python-aiohttp-sse.hash
index 2f21da462e..224601450c 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.hash
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-sse/json
-md5	d2f394fb75f591045b2c94fc17c8533d  aiohttp-sse-2.0.0.tar.gz
-sha256	547e1eaa129749f090d02b31956215edbcde74ce99721f5f0ac902a9ccb1202e  aiohttp-sse-2.0.0.tar.gz
+md5  822cd0c30325e8a711101c1a1ede4058  aiohttp-sse-2.1.0.tar.gz
+sha256  dfe8f7271ab4470891fa1bfa1913d6889b3d19015dd3d3a4cab949e66971bbca  aiohttp-sse-2.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
+sha256  5585eb91ec607b4fdbe97d44a61146a9cc27bb703336628bc3c6a1eaffe60307  LICENSE
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
index 7a7a0d0a70..2aef1579f5 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.mk
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SSE_VERSION = 2.0.0
+PYTHON_AIOHTTP_SSE_VERSION = 2.1.0
 PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
-PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2b/50/e127729f7df53c32c96b5c71932a7262cad40c83f1e19c218b068c816d51
+PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2f/3f/cc4f5a3fe6cb50ad5b9d26bb7738c5da1f61645b517d4230df2fc32d89f0
 PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
