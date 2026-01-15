Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1EBCCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5676560C14;
	Mon, 19 Jan 2026 09:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RrFGJw3cSXk9; Mon, 19 Jan 2026 09:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75C9B60D6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816733;
	bh=WSbnCpdiSFfRrFbfMBrxdSR8sSayOkGLbeHNq8UR1C8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NwlwNcpktkJIqvg7RcaiHsmLem+1JqVwynK+lxfiYgwzSjTaXnS4YV375kNwYt0Lh
	 xq+PXSWkuqO4VA79dM+zt581xUxOAZgCE1L3PNd0iQSjaQg0zKkNDI+VJAYVmzPPOr
	 rA40J09Xm0GhK6j4yyq1Zuu1V1MiyCjKAbKm3kVUMjdtFKUZkLEQSO43t4t1evrZPO
	 NPaUa1MxaBp/lPAqKvs3UTOw827V/D8tNL+H6p+pRhgaBcb7b3bwdAyk5s3G9vedcA
	 29pqh1UTSCNxtgHzz66a0d/cki3e9HSGKfQOwwozQfYcn/f8HBv8ZzGx5caD3Sog/A
	 SBlfjTENLAfMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C9B60D6E;
	Mon, 19 Jan 2026 09:58:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB51D347
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7B7340CF5
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjhhZf9TOwmu for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3B9C40CE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3B9C40CE3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 933E688673; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:14:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 259d9e0102007f65c94ee8b436a8f1f02c2e3056
X-Git-Newrev: a9486e7a03aa36f8c956083685c1b159541991b9
X-Patchwork-Hint: ignore
Message-Id: <20260119095849.933E688673@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgtk3: remove
 schema compile hook
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9486e7a03aa36f8c956083685c1b159541991b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f9ce4dd52fd062c593483cedcd5f0aad4861d4ea)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
