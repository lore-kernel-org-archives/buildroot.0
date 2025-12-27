Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25F6D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8AA241350;
	Wed,  7 Jan 2026 18:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmTjUtBT57Dr; Wed,  7 Jan 2026 18:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393354133F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808920;
	bh=AJabCv8V6p0deLd+X2Ku73NrXWYiBYtS447OiHgFK+E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NMwRlFi7N4aKSWGsb8uKwk+35AsbRM/LUZ1CGPNyjcZAGCfuERr0CRUDtRwOFZAAt
	 p2ACbygtojEo9EssnIEb2+qKtfZEvUhVHoKrRItlq9b3w5+rUl9LQWkw9r0HzMVwdM
	 t7T5VGIdhIsEjwlHp6c9NQ2v77Mdlmt+8RtUwUJmkWfRNwNU7HjVWU9SUJQs8899r4
	 Jy/dM9ghUKAmCEUQAsWUrrDf4aowsVggO4XPq1koJKPRUXpX7MZ+ezIDMohn7ZhuZH
	 1W0YO8RTaP7/X8VI4bEk8lfStoUo6NUFaqqmeX5rZcezxi4/vWU+WqQp1I56/lD6Eh
	 baHzSKj5ZqEiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393354133F;
	Wed,  7 Jan 2026 18:02:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AF0A9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDEA480EC4
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmXtTZ4MBUhv for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB60F80C8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB60F80C8B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA5DB88353; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:31:11 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 792d1b901152e0f8c89263dd459f13be8232c70a
X-Git-Newrev: 656e2d012edbfdbda24b6086c2ddc65cafd591bc
X-Patchwork-Hint: ignore
Message-Id: <20260107180110.DA5DB88353@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/sway: properly
 propagate wlroots dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=656e2d012edbfdbda24b6086c2ddc65cafd591bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
libgbm dependency, but forgot to propagate it to package/sway.

Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Tested-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6c512c8be0249e1d0e7a83186dff6482701d779f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sway/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 1f4b497af3..1e4c8bfd3e 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SWAY
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGBM # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
 	depends on BR2_USE_WCHAR # pango
@@ -53,11 +54,12 @@ config BR2_PACKAGE_SWAY_SWAYNAG
 
 endif # BR2_PACKAGE_SWAY
 
-comment "sway needs systemd, udev, EGL and OpenGL ES support"
+comment "sway needs systemd, udev, EGL, OpenGL ES and GBM support"
 	depends on !BR2_PACKAGE_SYSTEMD || \
 		!BR2_PACKAGE_HAS_UDEV || \
 		!BR2_PACKAGE_HAS_LIBEGL || \
-		!BR2_PACKAGE_HAS_LIBGLES
+		!BR2_PACKAGE_HAS_LIBGLES || \
+		!BR2_PACKAGE_HAS_LIBGBM
 
 comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
