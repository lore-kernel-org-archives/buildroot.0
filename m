Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB431C5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7F3A40521;
	Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcBCQIpb7FIl; Fri, 14 Aug 2026 13:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF5DE40525
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713687;
	bh=A0FgbNMC5YxhrtlqY/2f7HVt7Yeiah7uXbraBMmTXDU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RpMu5sT6p3ayMwV1z2Njc4fMo9AoQlbWGRiwnz8oAv6GNR/LkK03Av50CnzUQbp30
	 l5zNVPWkLpyCnPkU6mv252ICQCIgiWRgwz4w1Ix0ujtxOcO9eIjBYS2nFvlpGXILMe
	 FS9nIIRSFSsFjunnj8QfnZtNjTS+ExXMfg11oiJk8V2lBV5SH8GXRERlLpw2QugPNs
	 4wz8cHrk9rZL/5bVpo19fcOYOGfPecF5gYDvDLHVeWKcYG6Fmyjj+8cu6d/9JtzUrl
	 TivRpl7yvu/RlZpVOeMS18tYyHapy2g1z+4+8coHBOZOflMEdcrdKzWL3rjKt86Ev7
	 2zZCwD8VrKAXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF5DE40525;
	Fri, 14 Aug 2026 13:21:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF1B139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 152A9608B0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBvHN6kQYhEb for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BBB60633
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55BBB60633
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D3578D66C; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 09:27:52 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6bedcf009bef50999de90e360caef1e03659cded
X-Git-Newrev: 72916929d5179fab4c19de0f6c070c036dfd5d16
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.4D3578D66C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libgtk4: enable
 introspection when gobject-introspection is enabled
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72916929d5179fab4c19de0f6c070c036dfd5d16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

libgtk4 passes -Dintrospection=disabled unconditionally, so Gtk-4.0.gir is
never installed. webkitgtk depends on gobject-introspection and generates
WebKit-6.0.gir, which includes Gtk-4.0.gir, so building both fails:

  FAILED: WebKit-6.0.gir
  Couldn't find include 'Gtk-4.0.gir' (search path:
  '['.../usr/share/gir-1.0', ...]')

Tie the option to BR2_PACKAGE_GOBJECT_INTROSPECTION and add the dependency,
the way package/libgtk3 already does. Systems without introspection keep the
previous behaviour.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 8c5f7741726d7bb72b71e7a83088032bdecb9d44)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libgtk4/libgtk4.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 0d86835609..9a5ed651a8 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -34,11 +34,17 @@ LIBGTK4_CONF_OPTS = \
 	-Dsysprof=disabled \
 	-Dtracker=disabled \
 	-Dcolord=disabled \
-	-Dintrospection=disabled \
 	-Ddocumentation=false \
 	-Dscreenshots=false \
 	-Dman-pages=false
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGTK4_CONF_OPTS += -Dintrospection=enabled
+LIBGTK4_DEPENDENCIES += gobject-introspection
+else
+LIBGTK4_CONF_OPTS += -Dintrospection=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
 LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
 LIBGTK4_CONF_OPTS += -Dx11-backend=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
