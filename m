Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D305C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 20:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEECC60608;
	Mon, 24 Aug 2026 20:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12fVj91BouPh; Mon, 24 Aug 2026 20:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787602135;
	bh=0d9k09WDOkC+FTzagD5brkOv9aTQAflNsgec2A+QTtY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fe6Jf7fijaV5Vglu94HMyzjR8yOtGfLFc7JW3O0XZF2AA00BxQkzMPrSswEGXpjjF
	 TnpaRYXSxzhuixmTU/grD9KwxDwQ/IXHuPGPATCeVons4gLQVR7lKUt3gEyMaqD0c9
	 NceVeSo+y9FbeHF6Rz1ciZ2OVHKlcCvlTsGRrK6zij18OdziCgfwmtS/qGk2RZg9DI
	 bCa/8IBxzwXSKkmGy/Y4rdCnT/xBn4WysdMZE6UYgnDqh0/0C1qXeK+68hy6Wsjuzc
	 7bQlOIzUuRWLRJsLhTOnapeNXEWWP63RPMCa9++imxEn+Mr/E6bm/GmZx8OGYedZ1+
	 dujVsWdtczNEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E3260618;
	Mon, 24 Aug 2026 20:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98DD31465
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B22960618
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgxU25hl1raA for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 20:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBCA1605F4
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:08:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 889FA90307; Mon, 24 Aug 2026 20:07:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 21:57:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a0a2134e6e632852e23ca8cc583af7ea347ec6d
X-Git-Newrev: d16e4939ca7ca8e0e464230e0b2edbea843e3e3e
X-Patchwork-Hint: ignore
Message-Id: <20260824200757.889FA90307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taglib: needs gcc >= 7
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
Content-Type: multipart/mixed; boundary="===============7632399538778500294=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7632399538778500294==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d16e4939ca7ca8e0e464230e0b2edbea843e3e3e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes a build error caught by the Gitlab pipelines:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/taglib-2.3/taglib/mpeg/mpegfile.cpp:113:10:
 error: expected primary-expression before ‘const’
       if(const Header header(&file, headerOffset + i, true); header.isValid()) {

which was introduced by code format changes in upstream commit
https://github.com/taglib/taglib/commit/dfe2aa52532fc9f73a67499dd17fb527a856a22f
which was first released with taglib 2.0, added to buildroot with commit
9cd3464afa13fd0190fb3e94fd850cc8063cf297.

This "init-statement" C++17 language feature was described in proposal
P0305R1, and according to
https://en.cppreference.com/cpp/compiler_support/17, this feature was
only supported in gcc starting from gcc 7.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in | 6 ++++--
 package/taglib/Config.in                       | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 6a738faa00..c4eb4efb65 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -403,13 +403,15 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TAGLIB
 	bool "taglib"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_TAGLIB
 	help
 	  Taglib tagging plugin library
 
-comment "taglib needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "taglib needs a toolchain w/ C++, wchar, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TWOLAME
 	bool "twolame"
diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index 5b641a9653..9a43c82a5e 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TAGLIB
 	bool "taglib"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_UTFCPP
 	help
@@ -12,5 +13,6 @@ config BR2_PACKAGE_TAGLIB
 
 	  http://taglib.org/
 
-comment "taglib needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "taglib needs a toolchain w/ C++, wchar, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7

--===============7632399538778500294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7632399538778500294==--
