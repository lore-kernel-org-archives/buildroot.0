Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64C1CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 879A384521;
	Fri, 29 May 2026 18:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKNmg5MeC0ZW; Fri, 29 May 2026 18:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D8584511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078235;
	bh=72Mtmpf4nv+boLkp4Hm9lLtLaROXb4NXMXq1q2aYH48=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VXje5QeoGIJKHLqvyDyzff7lOy9/3IxaDgfsFdBdp4KanXqS3rcxIvg52vaPwq+Vg
	 B5B0l5p7ntmyOZnFBRlX6rzn2e/MyuaBJTDGSDNF89sh5bFOqvR2jI5WDIK2/V6O4z
	 fcOK4LK7XC/Pr1vhW2zqwzqJnNwAJRTq+HFxSo0yZlYJOwYwQlGyNnggIIkb31LPUV
	 UmVcrs2VZRpqhH+nNQfGXVIGEVhzlJsdQHOQdUnMiBGxUttcs8AUFS6jJn5W9/Rhvg
	 eigxltZ8v2NkxHxZpOkzghWpJyMJDw1AQUZgW/Tldp/4wJbixknfdP9yxVBKjD98xc
	 LRjERs9pJEaxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D8584511;
	Fri, 29 May 2026 18:10:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2C159E5
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A045A61606
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMudHTpXhRJ0 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 490A8615FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 490A8615FF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A928C87410; Fri, 29 May 2026 18:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:00:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b79a9fec56ca450f385494879e838b301ad2a38
X-Git-Newrev: 07f872bfe20615261ab51d76b598ae62573e06d9
X-Patchwork-Hint: ignore
Message-Id: <20260529181018.A928C87410@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/graphene: needs a toolchain with
 threads
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07f872bfe20615261ab51d76b598ae62573e06d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building without threads support fails:
/home/autobuild/autobuild/instance-9/output-1/host/aarch64-buildroot-linux-uclibc/sysroot/usr/include/features.h:220:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]

Added dependency to threads as suggested by upstream:
https://github.com/ebassi/graphene/pull/268#issuecomment-2283737538

Fixes:
http://autobuild.buildroot.org/results/9b3/9b357b1ef2eccd3110d0ecaaff1ae4883dff9280

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Bernd:
 - added comment to libgtk4
 - added upstream response to our bug report]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/graphene/Config.in | 4 ++++
 package/libgtk4/Config.in  | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/graphene/Config.in b/package/graphene/Config.in
index 60f6073a10..085efb301f 100644
--- a/package/graphene/Config.in
+++ b/package/graphene/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_GRAPHENE
 	bool "graphene"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A thin layer of types for graphic libraries.
 
 	  https://ebassi.github.io/graphene/
+
+comment "graphene needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 6d871b8517..3daa676169 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
