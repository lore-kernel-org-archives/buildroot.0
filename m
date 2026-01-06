Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDACCEFD17
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1399660C2A;
	Tue,  6 Jan 2026 22:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4tdz5co3qLB; Tue,  6 Jan 2026 22:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A22B060C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737011;
	bh=oqquMr9ArqEEG7eMcEXIeldSTrJUsp4jVFuJYoZRyAo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gek4QSkd0Myrbx1nFR72ZsjKMKTrU2CxSDuGMxmTZ9QTCY+OhU/NHWalWMSqzEW6e
	 kNoIuOHnkUX6uTGWtv29XJ+7skS7+cZzJoEbsBW4zlOofqdg2x4K8aDj6BhmHv0Fp/
	 f2obV/rRhkW3WHjkVmRyy+y09SGCGsZ3Fma3IROV60hfzliXJwmlrAoHUI+avfs8s5
	 /GtfKZ7Pzlbz3VzggqEP3FUMirSqiTt+L9rd16ZeGvpB69Ql5pNNuwOzZFwxQRf1hw
	 bv1/T0F3d3NwY1B9a7+BnLzfGRE2eZKVfUFM5lbRHgMJVTFsVoFTIHL8u1ebb5WdRz
	 B1+mKgBYE7tXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22B060C17;
	Tue,  6 Jan 2026 22:03:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77376970
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C58A60C17
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3s2J3am1RXYk for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80C6160740
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80C6160740
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67A8D80139; Tue,  6 Jan 2026 22:03:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 23:01:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0687bdeaaeb40dd80d72b80cc7c17b03d98dbeb1
X-Git-Newrev: f9ce4dd52fd062c593483cedcd5f0aad4861d4ea
X-Patchwork-Hint: ignore
Message-Id: <20260106220328.67A8D80139@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk3: remove schema compile hook
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f9ce4dd52fd062c593483cedcd5f0aad4861d4ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgtk3/libgtk3.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index be24869d3d..cbe49b8716 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -87,13 +87,6 @@ else
 LIBGTK3_CONF_OPTS += -Dtests=false -Dinstalled_tests=false
 endif
 
-define LIBGTK3_COMPILE_GLIB_SCHEMAS
-	$(HOST_DIR)/bin/glib-compile-schemas \
-		$(TARGET_DIR)/usr/share/glib-2.0/schemas
-endef
-
-LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_COMPILE_GLIB_SCHEMAS
-
 # gtk+ >= 3.10 can build a native version of gtk-update-icon-cache if
 # --enable-gtk2-dependency=no is set when invoking './configure'.
 #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
