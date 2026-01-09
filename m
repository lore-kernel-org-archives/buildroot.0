Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8358D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F4664031E;
	Tue, 13 Jan 2026 19:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAAL99j2r3iv; Tue, 13 Jan 2026 19:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6ED0408CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333302;
	bh=psfNsgZTST4JWQMoI94j5khpmGarzmaojAucMshAQuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=USTFv5z12nudczlEuk+Xbeukh/qJQ5n6dPqpzEfTd9QQ2vGEaDJDY0sm7EQkTAa/7
	 ztyLLr3bxAM0NK9Ao5MGVncUNsQRgK/p1G8sIk+mu91kuq3JpdRvqms5RipTRJvU4C
	 NJWfYDF72SmA+LcOMRC0EKME5OgEdZiqZ18BeyuEdDyOLZwGCsc7K1fJCCXu79dG1Z
	 2g9fAIyxxZUf2Hqb8YQh1I2uOVzLH1NpknaLVXsRIH+9DstrxuPmRreEelmGv2/ALj
	 o+agXGFMts/Jvp4quhTBQFneUMV62GZWZpBtL5PhYTnUOuLtxENRm1ItiD2nyle4T4
	 nBqWZlLX/wo6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6ED0408CF;
	Tue, 13 Jan 2026 19:41:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6A021C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA9D6406ED
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZbJqLxcwSk5 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21C29406F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21C29406F7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FB33884AF; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:36 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 09e77d09bbc950bbe855db8d64be98b178f7ce1b
X-Git-Newrev: 6fad2374f039fb255cf03e3071a235630e8c6051
X-Patchwork-Hint: ignore
Message-Id: <20260113194035.1FB33884AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libgtk4: add
 missing dependency for BR2_PACKAGE_LIBGTK4_GSTREAMER
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fad2374f039fb255cf03e3071a235630e8c6051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
(cherry picked from commit d0034ff96531b8993ed591323e37d0c1dec4de48)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
