Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04245CEFD15
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2098440942;
	Tue,  6 Jan 2026 22:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkTHDaVu03ue; Tue,  6 Jan 2026 22:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B32584093B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737010;
	bh=cAe8/bTpHKeFoG4N+6hDiFNPFUu4O3+1amoUJeUCEOw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kHdn2jKLfPesaYvmfpE2P6+iI1mvSOes1tYNiKmz5qR6kFL+m5HYc5smhGAWU6u6V
	 PNYjegs6W5YP85OwBHAgFF7W6VZoChQCPkh0UJDl1b7NsYIyaewwB6EhviW3dl44qf
	 tUEq+EcvT8D2QVhrK+Et9jlOtwS+PzAgsGBdmwR34aSl/XTxhLLPzmqakh3WX0Ksjm
	 /o4c9XKP3AADKZtSTkBKmIt8A0gsRK7BG6HvtwEMQbWPTCJsF6bAfWCimuzov7gHmi
	 Tu3CXoPqJtkujvrMvOb8jVabgAAnKI7V0CHU7TGYm1GF8vcwoIx5MKIjdUyrgsPJDI
	 9EMNCQVgIVy4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B32584093B;
	Tue,  6 Jan 2026 22:03:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67CAB70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59C90401DD
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6K_HDIjBhlRD for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1BE400E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A1BE400E3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:03:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 779E988342; Tue,  6 Jan 2026 22:03:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 23:01:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9ce4dd52fd062c593483cedcd5f0aad4861d4ea
X-Git-Newrev: 2fb684fd68dce4b16102baed6fc2578f35ff7959
X-Patchwork-Hint: ignore
Message-Id: <20260106220328.779E988342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk4: remove schema compile hook
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fb684fd68dce4b16102baed6fc2578f35ff7959
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgtk4/libgtk4.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 5d3341a95d..0d86835609 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -80,12 +80,6 @@ else
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
