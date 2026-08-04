Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBA9C55838
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 12:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 553AF8083E;
	Tue,  4 Aug 2026 12:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnxcZZiqPRI7; Tue,  4 Aug 2026 12:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7791680C69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785847727;
	bh=hhGOcruzvcqYmkp9LrNED6s6YyWd/hu61uR22M1vYfY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e3eoSzqoIt310u0xx/WwUaopR3h3qEhxAv/XdA1PoYYa8QHts3vTaam+NkUFc2o1X
	 OLz61aOOu1Y5bT+GLG/m6pJD4N5KLGZX7mrQ6amdy3wz8yuahCOQBPWkjdf9SYt15p
	 fozFrVP0Y92/4dtHtHcQ1UCDgAmSj4onqUuWuL568BJU6Ea739p38l94d/vY2A8/Q5
	 VSXXwxVHBwvGXFaQqeFUs+zi/6v7vaOdZpruY5lI6dCD3ZKMPwVmppJXKMdTylJhTr
	 yzM7a7QfjYPT2mDQ61nnma9GuU1CaWGUHlqGUQcqLKhQrkpR0sM+sqdHJzuldyFmfH
	 pP9ZaErEm+mjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7791680C69;
	Tue,  4 Aug 2026 12:48:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64AD2350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B2A0400DA
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQH_n52f_7d1 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 12:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 765E640071
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 765E640071
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:48:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F3B48B907; Tue,  4 Aug 2026 12:47:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 13:42:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c92dc611e51b9fea493998676f99c0d55e39967e
X-Git-Newrev: 8c5f7741726d7bb72b71e7a83088032bdecb9d44
X-Patchwork-Hint: ignore
Message-Id: <20260804124756.5F3B48B907@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk4: enable introspection when
 gobject-introspection is enabled
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c5f7741726d7bb72b71e7a83088032bdecb9d44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
