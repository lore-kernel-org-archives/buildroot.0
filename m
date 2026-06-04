Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCBACD8C80
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179274131B;
	Fri,  5 Jun 2026 12:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5LUnYXCLFZx; Fri,  5 Jun 2026 12:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFA1415A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663220;
	bh=grxr095ecujLn+DabcQKy0a2YVdhAh1a+KQn47WGBvU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KwGkYkEwcU7opHG3z/CDPqO/vNjLM0tji1aMWC+33uf7FjApSY7NjeZX6E55wcURN
	 624vje2pdAsznVuSCAdEdyfvzjnS8I5oMMra9UlAzG4QEucUmiB3I0cfyAL+iSyO81
	 hUqtqIHvu1J/8ZkI/t0IE9xrsqM2BElnz7w+K5jlxn9IBFVL3vviTNdXRnkpUYQcQq
	 PSaQuHfURuWVLfIW6IwubaE19v0sjYFBvwXU0WRsuERPGY448hjPFtMXNqSD2GvQon
	 1Foy1awnwumjcYHfYo5ZJFW9HYF2KUbJJvUUuwywhy3OcL79xY6GgZsguloIR4RjKE
	 yp82O5Bh1wM6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFA1415A7;
	Fri,  5 Jun 2026 12:40:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0306AF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB04182002
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DP0vceyRTEV for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CE9881FCA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CE9881FCA
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B62C287B3A; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:38:10 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 06f68f39d1db00f7fd27f0c2fc928e07a1d2a5d6
X-Git-Newrev: 2afb974ea26474eb377d60ca569cdc8edb213d56
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.B62C287B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/graphene: needs a
 toolchain with threads
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2afb974ea26474eb377d60ca569cdc8edb213d56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 07f872bfe20615261ab51d76b598ae62573e06d9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
