Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE84DC2A076
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D261405B0;
	Sun,  4 Jan 2026 13:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHShF0PXewV0; Sun,  4 Jan 2026 13:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F703404C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767532003;
	bh=MLNiedeWlindPFFDQtAIAJW53NLolPZXYAStAAkafHg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HyggygIFBcMqOmYh0Ex0xG7PkUge2CDZbmYZ/JpJ6rFKk2ZvK+qpPoMTamJho1eUw
	 ZtCRJ/0J561t5qwWCI5K4xzHk7melL03jFW0j/u3IhHDniXkIKclOinYX7MvIao+sd
	 18paX8Q9RHBiXcOC4bPpzn2jWswD8etItJF2v92tHKWS4/Xr7VUkyYZXlWblL6vbNE
	 S9QUkpSCOtTqyzIMfz3SIgsHEaIxhe/TbSvKn1YtC2irtbrIuMuYXgD5QGeNwt/FS0
	 bsBNzIGVpqdEAaFL5eklz0cj7BlIrWC6VApLlGNJUl/rgrZylrkm/pKLr8bd3rHZim
	 +X0sl6nUcEuEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F703404C3;
	Sun,  4 Jan 2026 13:06:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB622DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF80A405A1
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rI5SNr32LI0S for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB73403A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FB73403A8
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E23280E53; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 14:00:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7571ee4a3697106b8938a83116a6e305dffbc3aa
X-Git-Newrev: d0034ff96531b8993ed591323e37d0c1dec4de48
X-Patchwork-Hint: ignore
Message-Id: <20260104130636.8E23280E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk4: add missing dependency
 for BR2_PACKAGE_LIBGTK4_GSTREAMER
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d0034ff96531b8993ed591323e37d0c1dec4de48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back when the libgtk4 package was introduced in commit
faf2a1d2abfbff79fc0603def835066587144420, its
BR2_PACKAGE_LIBGTK4_GSTREAMER option did not properly propagate the
dependencies of BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL, causing the
following Config.in warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
  Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE [=y] && (BR2_PACKAGE_HAS_LIBGL [=n] || BR2_PACKAGE_HAS_LIBGLES [=n])
  Selected by [y]:
  - BR2_PACKAGE_LIBGTK4_GSTREAMER [=y] && BR2_PACKAGE_LIBGTK4 [=y]

Fix that by properly propagating the dependency.

Fixes: faf2a1d2abfbff79fc0603def835066587144420 ("package/libgtk4: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgtk4/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 259226e0e4..6d871b8517 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -87,6 +87,7 @@ config BR2_PACKAGE_LIBGTK4_X11
 
 config BR2_PACKAGE_LIBGTK4_GSTREAMER
 	bool "gstreamer support"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
@@ -94,6 +95,9 @@ config BR2_PACKAGE_LIBGTK4_GSTREAMER
 	help
 	  Enable gstreamer support.
 
+comment "gstreamer support needs an OpenGL or OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
 config BR2_PACKAGE_LIBGTK4_DEMO
 	bool "Install libgtk4 demo/example programs"
 	select BR2_PACKAGE_SHARED_MIME_INFO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
