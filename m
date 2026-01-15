Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE01CCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C43F40D2E;
	Mon, 19 Jan 2026 10:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQNyusSTrLp8; Mon, 19 Jan 2026 10:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CE3D40CF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816848;
	bh=5rQAhrN8tc2HP0RJt1/hIsoCfwUZwGiE+HxZSvvGv2k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bEbXSuIkR8VMaymAr9KXDzHzN9/GErBWiSxSvk048iMtLMg8hCPsLRi1bI+lMtAoR
	 BILQMNhRTUYmdX/W2gNU5cD+3gCW79fcLIXVFTZvgpBHYooPVevwfnIRrqbo+2bou4
	 PQ5zZliJdopaBlETuB+cKlZm4PoBW5Hj1m5B89C0DTYP5uvHONOHTNycutXg1gp0ND
	 cYXYC7pmPjFp68NbDkUA9Albt+AbRXcZuTKYoesfQX6GFeipdTy3C0/x/ZLDgwgYLq
	 I6pYiUDh79mlH3XWQZt6LUPf4qDkBzKiX9x/EIQhJ1e44+As40/hsBFgpC3seu6e+p
	 ppBnnQzqBmyWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CE3D40CF8;
	Mon, 19 Jan 2026 10:00:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F8E6160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F1EF40CEC
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ig0P4BYthBsR for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77D6740CCF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77D6740CCF
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 769A988604; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:15:40 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: aa290648ea8b62f017ab2d0f6b3336d548f6c059
X-Git-Newrev: d36d284bc28b1436aff217da8dcc99809de92ec9
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.769A988604@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/gvfs: remove
 schema compile and cleanup hook
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

commit: https://git.buildroot.net/buildroot/commit/?id=d36d284bc28b1436aff217da8dcc99809de92ec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

In addition, libglib2 already removes schemas from the target during
target finalization so the gvfs-specific cleanup can be dropped.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7b5735cc6914f694b2c3172244c5a925d55636fc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gvfs/gvfs.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index b46b438dc6..6eff3bd859 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -157,16 +157,4 @@ GVFS_CONF_OPTS += \
 	-Dtmpfilesdir=no
 endif
 
-define GVFS_REMOVE_TARGET_SCHEMAS
-	rm $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml
-endef
-
-define GVFS_COMPILE_SCHEMAS
-	$(HOST_DIR)/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
-endef
-
-GVFS_POST_INSTALL_TARGET_HOOKS += \
-	GVFS_REMOVE_TARGET_SCHEMAS \
-	GVFS_COMPILE_SCHEMAS
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
