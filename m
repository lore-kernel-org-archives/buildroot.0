Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932C4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A0A60BBC;
	Thu, 10 Mar 2022 21:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GIf3TWDaxP9B; Thu, 10 Mar 2022 21:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67CD860B10;
	Thu, 10 Mar 2022 21:30:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A311A1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 941DC61286
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUmZeATxFhkK for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 948A661280
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 18E5083C16; Thu, 10 Mar 2022 21:18:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:26:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c6d0b52698a032f181e97c6218c52abe4cabc0e
X-Git-Newrev: 1b117664aca0e5b81236c0fc7ad5f0ccb4e0267a
X-Patchwork-Hint: ignore
Message-Id: <20220310211844.18E5083C16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-gd: add webp support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1b117664aca0e5b81236c0fc7ad5f0ccb4e0267a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-gd/perl-gd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 9787cc12fe..cd32c7fb8f 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -40,6 +40,12 @@ PERL_GD_OPTIONS += PNG
 PERL_GD_CONF_OPTS += -lib_png_path=$(STAGING_DIR)/usr
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP),y)
+PERL_GD_DEPENDENCIES += webp
+PERL_GD_OPTIONS += WEBP
+PERL_GD_CONF_OPTS += -lib_webp_path=$(STAGING_DIR)/usr
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
 PERL_GD_DEPENDENCIES += xlib_libXpm
 PERL_GD_OPTIONS += XPM
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
