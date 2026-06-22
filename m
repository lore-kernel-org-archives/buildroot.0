Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892ACCDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 21:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31D3B80E8E;
	Mon, 22 Jun 2026 21:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hohxWEjhO6nE; Mon, 22 Jun 2026 21:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4427A80E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782164442;
	bh=xv4W1hSIgkPe7Fe1jDDUQLRoI425mscQg8wzoIpQR5o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y9gWee5Eiv0YBgy37EOIlhm+xq/EDEMKhYdtCInSzyffm638e6UFcpPljZof9xIZK
	 9EKrR++77PfhkBh7runHPbpxEBS/gsvA3YKc3IxUKdcRh9d9gpDutdkMWYdyo8+75f
	 7GFBNus68iA98udMA0d7sP8n60uosmyX2WKi94xrc0xaEhYLRntg6+0FQi4/FVYcdw
	 wih6KTIlRdfHQ09hgklW9XtkGJAe4G2odGERfv41zyz2d5VOJOlB7VPC3nnpJ2wNwL
	 u1c88JN0hq4jYEeIiPqxIV1roo4rSGRX5tcmX/EF4rScj4JIyUyVtMxn2VtmpOfJvL
	 dt2yyIXk4kKTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4427A80E02;
	Mon, 22 Jun 2026 21:40:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC2AE256
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B28C080E95
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deCQ-DD9ue8z for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 21:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E150C80E7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E150C80E7F
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A666E8401E; Mon, 22 Jun 2026 21:40:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 23:21:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76d4a9b297ebd4ed15000bce62873049b9e75f5a
X-Git-Newrev: 4c370d3d8fc30d15f06aa3c318ee234590ece4b1
X-Patchwork-Hint: ignore
Message-Id: <20260622214015.A666E8401E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add OpenGL config
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4c370d3d8fc30d15f06aa3c318ee234590ece4b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Acked-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/qemu/Config.in | 14 ++++++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2a6aa288d3..8e932c014f 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -112,6 +112,20 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+config BR2_PACKAGE_QEMU_OPENGL
+	bool "Enable OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBEPOXY
+	help
+	  Say 'y' to enable OpenGL accelerated display frontend support.
+	  This is necessary to efficiently display frames rendered in a
+	  guest on the host.
+
+	  Run qemu with `-display sdl,gl=on`
+
+comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2199db38cf..aff1762fb9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -272,6 +272,13 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_OPENGL),y)
+QEMU_OPTS += --enable-opengl
+QEMU_DEPENDENCIES += libepoxy
+else
+QEMU_OPTS += --disable-opengl
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
@@ -329,7 +336,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
