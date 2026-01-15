Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4889DCCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB7260D78;
	Mon, 19 Jan 2026 09:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cb5bAnzWy699; Mon, 19 Jan 2026 09:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4356160D89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816747;
	bh=dkbRqoMJhYKDEUKVu539O2AT8TK0RJDG2kn5OvjXErE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MzahbhS/6+VzANJSM7sFhGv00O3q4dKGeDWH57n1zNKRMEpMnht9Zwj0QS7MO0d4V
	 uNe4Dm+nV7H3hdZbJ/z1KX9euK6mAW5ZLyfemqwAwVRxe2SfESbqmrYO8HUeLEnyJY
	 5L3mecImqFrsPtlGgmg3/uJSzZzi/sK9syggt0jzra6FxJbPzol8Mt2wGAPW2l0V8Q
	 wmpzjgxcZiKdjMKZaRzvxwbcUu/FbQq2XbsCTaqDqhZp7gIJiM4nSPm1NfsOlOtPie
	 UpM7rrtJ/VNFMxXbb+VLk5o+cnlY9R1vCuoWYPyXFYATWQhKL+imS9Uf0ak0iHk6Hd
	 VJ+cN7DUL50xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4356160D89;
	Mon, 19 Jan 2026 09:59:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25173347
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6BC2406CF
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfWtN6OmkrrZ for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7B05406BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7B05406BB
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7CE48867D; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:15:07 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a9486e7a03aa36f8c956083685c1b159541991b9
X-Git-Newrev: af1ec702c5985ed9ffc6067aae3c9ee82c90880b
X-Patchwork-Hint: ignore
Message-Id: <20260119095849.A7CE48867D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgtk4: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=af1ec702c5985ed9ffc6067aae3c9ee82c90880b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2fb684fd68dce4b16102baed6fc2578f35ff7959)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgtk4/libgtk4.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index b00a2facad..f63e320629 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -79,12 +79,6 @@ else
 LIBGTK4_CONF_OPTS += -Dbuild-demos=false -Dbuild-examples=false
 endif
 
-define LIBGTK4_COMPILE_GLIB_SCHEMAS
-	$(HOST_DIR)/bin/glib-compile-schemas \
-		$(TARGET_DIR)/usr/share/glib-2.0/schemas
-endef
-LIBGTK4_POST_INSTALL_TARGET_HOOKS += LIBGTK4_COMPILE_GLIB_SCHEMAS
-
 # here, we build a native gtk4-update-icon-cache as host-libgtk4
 
 HOST_LIBGTK4_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
