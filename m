Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C9AC5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 07:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 361F580DD2;
	Mon, 24 Aug 2026 07:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fL77TLkVAEQV; Mon, 24 Aug 2026 07:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787554899;
	bh=XmqHPpTpZj0vhXNslaJiNfhZww2f4cWm6z+6k7lrZNQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ci3GgZ7oqq0Ru/WlknJz2n9LXFxCNPcAIyYOmEgbfEy3TPhiAo1GEXxZ/U+LzI5vQ
	 Zsn0ZGHeJZ0noWZLYBWuXnobNL3ldIwwKoFavI7sxzne8fH4pJYeyc9NaaebYGnR8y
	 GSu09v4I6RlXyueCFVYmT1BzYt45CCm15LlMjyysHWcP04iANn+7d7ZZ/TVaCCeDBN
	 6gd+uxD44YfoT+RWz8G3ZHiW8XqmwdljcVlXgnblcORtYTLh/mckTXv7H441/TzFpY
	 YRnvNLPhv1UN3aXG5fMkVg1PdrTdAeiqrNourTSwx2NVRkvir5KlHGL2w2WGSP5AVj
	 WsX+GWh6UuYXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6431A80DD8;
	Mon, 24 Aug 2026 07:01:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26EBF336
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 07:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 195D44065D
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 07:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3_bwi0yAUpC for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 07:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E0AA405BE
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 07:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 904458F2A9; Mon, 24 Aug 2026 07:00:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 08:28:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 212b7edc22623e38aa2b0165e34e2b9a541d5ba3
X-Git-Newrev: d74a065a16be4e18e6c85ddf257c4f5ff033e6b8
X-Patchwork-Hint: ignore
Message-Id: <20260824070042.904458F2A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: use configure option
 WITH_{TESTS, TOOLS}
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d74a065a16be4e18e6c85ddf257c4f5ff033e6b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit c531fe65209defd356e5ee8142896478a20ab371 bumped the
package to 3.1.2. This version first included upstream commit
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/942ac87e479c48199d48781e9a5b2cda3b910d7b
which added configure options to disable the build of command-line
tools and tests.

This patch replaces the current _POST_INSTALL_TARGET_HOOK with the new
configure option and disables the build of tests.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 9a10110766..073a607188 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -15,7 +15,7 @@ JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
-JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
+JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON -DWITH_TESTS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
@@ -43,11 +43,10 @@ ifeq ($(BR2_STATIC_LIBS),)
 JPEG_TURBO_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),)
-define JPEG_TURBO_REMOVE_TOOLS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
-endef
-JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_TOOLS
+ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),y)
+JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=ON
+else
+JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
