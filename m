Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313FBCD8CBF
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72232858BE;
	Tue,  9 Jun 2026 13:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ehowlyruu2J; Tue,  9 Jun 2026 13:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9B4185CC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010296;
	bh=EXHKkmfSHF51uBQLHmTbCLPNXJBb1p9CjUq1yjqjDhU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UUwOs6SZBvbvacMmMYfnznbJQvSC07FZ6cKWCVyzUYZhw2hn1Aiagiq7DFZHr+9ed
	 BWq2njFVhc3eAz4A4KEpDPDmjiTqviVR3YcXxI+RoWkdoaHJo5WG0qpHHZSExMP5Tf
	 ixU1wulwYR8siEeZaYG+5PRLautgUV8t8KYxQbGyqOEG6VzgGi0ZjHwGsFvWE+NmK5
	 WwCLCXKARIsRYREBDkhDbvXS+fR98/n7P+ud//ncrcGsaHiu3oHxWy/kMFJdO+x++V
	 WgSu6OfjyGWMzYr8Q9ZhkQAByk3gj2DRhPr2FgGadFmPAwwrjZ4NttdEVKIk0iXQcf
	 tgipyQ11ZFmFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9B4185CC9;
	Tue,  9 Jun 2026 13:04:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B74FF190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84FB8452D8
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g62sUUiZjALt for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C772045BBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C772045BBB
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FA3887E8B; Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:44:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5394df6400912efa7da4f97c7ea68a81a9f77c1d
X-Git-Newrev: d1abbae02ed573ebd29b3c0984bb9a8f04232ff3
X-Patchwork-Hint: ignore
Message-Id: <20260609130124.0FA3887E8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/font-awesome: bump to version 7.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1abbae02ed573ebd29b3c0984bb9a8f04232ff3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This release updates the upstream icon set and related assets.
Refresh the source hash for the new release. Also drop the "v" tag
prefix as upstream dropped it starting from v5.0.

License changes:
- Upstream introduced SVG icons as a first-class feature alongside the
  traditional icon fonts starting with v5.0.
- The new icon designs (delivered as SVG and JS assets) are licensed
  under CC-BY-4.0 (attribution is satisfied by the copyright comments
  in the files).
- The webfont files themselves remain under OFL-1.1, and helper styles
  and build code remain under the MIT license.
- Hence, the license is updated to: OFL-1.1 (fonts), MIT (code), CC-BY-4.0 (icons)
- Add LICENSE.txt for hash verification.

Directory changes:
- Drop "less" and "fonts". LESS support has been completely dropped by
  upstream in v7.0, and the old font files directory was renamed.
- Add "webfonts", which contains the newer .woff2 webfonts.
- Add "js", which contains scripts for the SVG + JS rendering method.
- Add "sprites" and "svgs", which contain SVG sprite sheets and raw SVG
  icons (the CC-BY-4.0 assets) respectively.
- Installing all these directories allows users to choose between the
  various rendering methods (CSS+webfonts, SVG+JS, CSS sprite sheets,
  or direct SVG usage) for their target systems.

For detailed Chngelog
- https://fontawesome.com/changelog

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/font-awesome/Config.in         | 4 ++--
 package/font-awesome/font-awesome.hash | 3 ++-
 package/font-awesome/font-awesome.mk   | 9 +++++----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/font-awesome/Config.in b/package/font-awesome/Config.in
index 694d74e5a8..40cadaf433 100644
--- a/package/font-awesome/Config.in
+++ b/package/font-awesome/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FONT_AWESOME
 	bool "font-awesome"
 	help
-	  Font Awesome is a full suite of 605 pictographic icons for
-	  easy scalable vector graphics on websites.
+	  Font Awesome is a full suite of thousands of pictographic
+	  icons for easy scalable vector graphics on websites.
 
 	  https://github.com/FortAwesome/Font-Awesome
diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
index 89bc411f66..29c64cd40f 100644
--- a/package/font-awesome/font-awesome.hash
+++ b/package/font-awesome/font-awesome.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-4.7.0.tar.gz
+sha256  8f433b74d3d4bbba2a6374a0a0ddf53be8e127809341e4c2578719229b43903a  font-awesome-7.2.0.tar.gz
+sha256  20c6f40715a567c97b80f6944beb8bb325835cab47ea7dcab89ee3b8e077eced  LICENSE.txt
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 5211ac22a5..2b1de910ce 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-FONT_AWESOME_VERSION = 4.7.0
-FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,v$(FONT_AWESOME_VERSION))
-FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
-FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
+FONT_AWESOME_VERSION = 7.2.0
+FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
+FONT_AWESOME_LICENSE = OFL-1.1 (fonts), MIT (code), CC-BY-4.0 (icons)
+FONT_AWESOME_LICENSE_FILES = LICENSE.txt
+FONT_AWESOME_DIRECTORIES_LIST = css js scss webfonts sprites svgs
 
 define FONT_AWESOME_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
