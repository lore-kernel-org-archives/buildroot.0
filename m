Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9572CCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D1440CF4;
	Mon, 19 Jan 2026 09:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTPm495XfvLs; Mon, 19 Jan 2026 09:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E09940CE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816734;
	bh=95VdJ5/piJsgO3e8HqVntd/qttc4M6440VMhu3+wco0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mAyGp16P6A5k2/yFTtdY/QjievLFUXyLFu2aV9hNHBz87lEtjb6YgT3nJL7vAJ8qP
	 l6NJ55X4Z00GaVQ3HkamfZSlh15GH7adrnJ8wx5qo30igRMoR2+u5ZZ/F1bGIdpx/O
	 ab05z63v/2rMtIkar2sE7v92+jKPCZup7PjilGtZkE+o/7aNlsGFzRNLQ5CqpPIzTx
	 tISg96hbv77PhHvvSCRFJq/swdwkoFB9Xzv2ihLy3DEe9w++Abhgd1O2l6jk7j/suc
	 MPce8YjUXEiYComLWXoUWvN1MujREsveq0ipsJ0w46gOTkz7KMQt/gNpslPZq6acuy
	 chNUNXiUK7nOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E09940CE8;
	Mon, 19 Jan 2026 09:58:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0304462
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8937406D9
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVYz-zDB_PAg for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCD94406CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCD94406CA
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8DB188366; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:15:37 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: af1ec702c5985ed9ffc6067aae3c9ee82c90880b
X-Git-Newrev: 39d71bc46e184e57a01ca1d93d3094f05f0cec9d
X-Patchwork-Hint: ignore
Message-Id: <20260119095849.B8DB188366@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gvfs: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=39d71bc46e184e57a01ca1d93d3094f05f0cec9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index 50efed1abb..5dc8a03def 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -156,16 +156,4 @@ GVFS_CONF_OPTS += \
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
