Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AEBC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B32D60A6B;
	Mon, 16 Sep 2024 10:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ejIgBkmcHaH; Mon, 16 Sep 2024 10:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED436144F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED436144F;
	Mon, 16 Sep 2024 10:02:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 220971BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8C4780BAC
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puDodNv7_dj7 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B6868053C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B6868053C
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94D538266F; Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:42:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: faf00146427e6f3ce18bc35030ea330d7384e0e7
X-Git-Newrev: fe7f48fe4994fcfb756921c13676c052a8eeb455
X-Patchwork-Hint: ignore
Message-Id: <20240916100146.94D538266F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-keyring: bump to version
 25.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe7f48fe4994fcfb756921c13676c052a8eeb455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-jaraco-context runtime dependency.

Add new python-jaraco.functools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-keyring/Config.in           | 2 ++
 package/python-keyring/python-keyring.hash | 4 ++--
 package/python-keyring/python-keyring.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 6c03317f61..55295ab7ab 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PYTHON_KEYRING
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ENTRYPOINTS # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_JEEPNEY # runtime
 	select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
 	help
diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 50ac3df342..ca94170de0 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  ed5df85d33c36bb268a79d4472a13312  keyring-24.2.0.tar.gz
-sha256  ca0746a19ec421219f4d713f848fa297a661a8a8c1504867e55bfb5e09091509  keyring-24.2.0.tar.gz
+md5  024f9ec53601f6b91670c31d705546fe  keyring-25.3.0.tar.gz
+sha256  8d85a1ea5d6db8515b59e1c5d1d1678b03cf7fc8b8dcfb1651e8c4a524eb42ef  keyring-25.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 87b51a8960..a0f8a0a647 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 24.2.0
+PYTHON_KEYRING_VERSION = 25.3.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/14/c5/7a2a66489c66ee29562300ddc5be63636f70b4025a74df71466e62d929b1
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/32/30/bfdde7294ba6bb2f519950687471dc6a0996d4f77ab30d75c841fa4994ed
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
