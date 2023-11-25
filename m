Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC84FC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B3441B5A;
	Mon,  4 Dec 2023 20:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B3441B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6sApqi0wQp5k; Mon,  4 Dec 2023 20:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1D6F41751;
	Mon,  4 Dec 2023 20:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1D6F41751
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 240861BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 843B94176E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 843B94176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXeqU-dT06ld for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F68D41739
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F68D41739
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 003D2879B6; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 16:40:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ff5d3df052d9a1594db05360e301c7614ca68f2
X-Git-Newrev: ba27abf3566a86ecf2f89c7a4bb1d2c6a50eda89
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.003D2879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: remove
 _BASE_BUILD_OPTS variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba27abf3566a86ecf2f89c7a4bb1d2c6a50eda89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable can just as well be merged into _BASE_BUILD_CMD. This is
how it's done for the install opts. And anyway it's only used by
distutils and nowhere else.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 1fc096efb3..eacf75c165 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -198,8 +198,7 @@ endif
 ifeq ($$($(2)_SETUP_TYPE),distutils)
 ifeq ($(4),target)
 $(2)_BASE_ENV = $$(PKG_PYTHON_DISTUTILS_ENV)
-$(2)_BASE_BUILD_CMD = setup.py build
-$(2)_BASE_BUILD_OPTS = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
+$(2)_BASE_BUILD_CMD = setup.py build $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
 $(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
@@ -335,7 +334,7 @@ define $(2)_BUILD_CMDS
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_BUILD_CMD) \
-		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
+		$$($$(PKG)_BUILD_OPTS))
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
