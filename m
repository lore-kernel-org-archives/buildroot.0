Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8CBC4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 15:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC932418B5;
	Sat, 25 Nov 2023 15:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC932418B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXDPNDgH4OiN; Sat, 25 Nov 2023 15:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20E9E418A4;
	Sat, 25 Nov 2023 15:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20E9E418A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4951BF423
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25F7C81491
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F7C81491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osUD7jhdiPrf for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 15:38:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65ACA8146F
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 15:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65ACA8146F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 518F586F34; Sat, 25 Nov 2023 15:38:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 16:38:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e241419490c80cb0b758dc017ffe8f7b95533890
X-Git-Newrev: 0ff5d3df052d9a1594db05360e301c7614ca68f2
X-Patchwork-Hint: ignore
Message-Id: <20231125153858.518F586F34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-python.mk: remove
 $(2)_PYTHON_INTERPRETER variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ff5d3df052d9a1594db05360e301c7614ca68f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a leftover from python 2/3. Since the interpreter is now always
python3, we can simply call it like that - like is done in all the other
places where python is called.

While we're at it, call python3 explicitly rather than relying on the
symlink.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 28ee4cb85f..1fc096efb3 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -325,10 +325,6 @@ $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DOWNLOAD_DEPENDENCIES = host-rustc
 endif # SETUP_TYPE
 
-# Python interpreter to use for building the package.
-#
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
-
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
@@ -337,7 +333,7 @@ ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) \
+		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_BUILD_CMD) \
 		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
 endef
@@ -351,7 +347,7 @@ ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) \
+		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_CMD) \
 		$$($$(PKG)_INSTALL_OPTS))
 endef
@@ -365,7 +361,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) \
+		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_TARGET_CMD) \
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
 endef
@@ -379,7 +375,7 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) \
+		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_STAGING_CMD) \
 		$$($$(PKG)_INSTALL_STAGING_OPTS))
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
