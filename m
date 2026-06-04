Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12309CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA4C40D43;
	Fri,  5 Jun 2026 12:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wq8Quy-hWbt7; Fri,  5 Jun 2026 12:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B44C40F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663089;
	bh=ikA2Y8+DtU+DP57JxWifhNWCL5lo94gUVEk/8DOeyOs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=naH5s3qpeUuwruS+6sdRdFkiKHXDWwT3wSeoTb/sSt4bUY41Cb0cu5TgxRaI51/Zt
	 Pm0/F8X0RWB9vy3H2On/4i0Kkn72F2AaYLiL0jBqWRxqZyM1N5l7woXB5OlZAe/+GL
	 AqnpQCwv4xRCpQIY2BnZBatCYQGdjfPZ5RpLbOdkPJ+f3Uwapev1h9A3MRH/WdgKKn
	 DfyFi4ZHzMcX0iE61aE7Ku7UvsXvHJN4Q4GsNSpSAabJ4NtoCAiHi+wiUqz4+53inO
	 1GuKCwOEpnFP9XUbGUOo21obv4sJ/l6aZeK1Diir++qeuoA06b/2K+RxoZ9ZTGTgkn
	 EPIn5epK39InQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B44C40F4E;
	Fri,  5 Jun 2026 12:38:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05E3A388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35FAE81E82
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKkm5g_HxAMn for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5218281E6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5218281E6A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BBF187B40; Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:38:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 487a46047637905e275db2a04535d765d827c5c3
X-Git-Newrev: 38a793ab0f7517c50cdb992c5602b8f7e6ec9b94
X-Patchwork-Hint: ignore
Message-Id: <20260605123711.7BBF187B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/graphene: needs a
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/38a793ab0f7517c50cdb992c5602b8f7e6ec9b94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 8c01ffd535..0092e1043f 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -13,7 +13,7 @@ comment "libgtk4 needs an OpenGL(ES) EGL backend"
 config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
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
