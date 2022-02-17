Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E6FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D6A960AB3;
	Thu, 17 Feb 2022 20:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCg9c4X8l_s6; Thu, 17 Feb 2022 20:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9358560634;
	Thu, 17 Feb 2022 20:33:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 316FB1BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C4D6409EB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VP93hy2e5Gk2 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:33:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72F16408C9
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:33:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7E84E83797; Thu, 17 Feb 2022 20:25:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:32:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f5843cd07df37fbef2b421a5857b1f86d098eb6
X-Git-Newrev: 908e514de4919dfcde6891cb2395232e4f2846be
X-Patchwork-Hint: ignore
Message-Id: <20220217202558.7E84E83797@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: drop references to
 PYTHON_{PATH, DIR}
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

commit: https://git.buildroot.net/buildroot/commit/?id=908e514de4919dfcde6891cb2395232e4f2846be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With python 2.x support dropped these variables no longer exist, so
unconditionally use the python3 variant.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 02df061a19..b8dc9cd9e5 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -38,10 +38,10 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
-	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
 	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
+	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -70,11 +70,11 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
+	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
-	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
