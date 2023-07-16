Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA06EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 12:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7638813AC;
	Sun, 16 Jul 2023 12:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7638813AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NMjFNjlj-hG; Sun, 16 Jul 2023 12:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BCA81373;
	Sun, 16 Jul 2023 12:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BCA81373
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA0D11BF2E3
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 12:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3CA881373
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 12:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3CA881373
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNSjJh0w_6_r for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 12:19:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11B181362
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D11B181362
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 12:19:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4CA6A4C0354;
 Sun, 16 Jul 2023 14:19:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36428)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL0iY-0004DQ-1V;
 Sun, 16 Jul 2023 14:19:14 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 14:19:14 +0200
Message-Id: <20230716121914.3896405-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689509954;
 bh=xFFlueSM8CKbf3uPfqA9JuCJqf4IHYjoLSv5va1w6Ng=;
 h=From:To:Cc:Subject:Date:From;
 b=SvyL3mM7LQ0tKOF3TSmwOntQ3O8fpdmShmm5K5h0o7HjeyScbrb/YqP5q7E4dT05K
 VEzZlCV+qTpw1G3swOeBKkjTAoky0LR58Di9FusS+55mgCO6T34Jo/H7RRIqzsn4bQ
 mKuV/BZLcd1R98GDY1YfW+ohos8ooQl+EwSGgztCnGlOldpGCKKeQKE8GFIBNfJcd7
 HF769L3pwMtNCNh13W+d8nbHc5L35X4gvRfJB5ejXWmIw8YXJPJJqptfMAKZNiRj1M
 6Unp3XFf44u1W0ZoXdovobrcXKFIM+3wfH2MGRMYRLCvB5dWTOtSHVn5LbT4igWDAJ
 mcvJf6vQH6WRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=SvyL3mM7
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump version to
 2.40.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed md5 hash.

Added dependency to host-unifdef, needed since upstream commit
https://github.com/WebKit/WebKit/commit/f76a7e30e5749af897b83cc75b2534b1afa32552

Release notes:
2.39.4
- https://lists.webkit.org/pipermail/webkit-gtk/2023-January/003861.html
2.39.5
- https://lists.webkit.org/pipermail/webkit-gtk/2023-January/003866.html
  USE_AVIF was enabled by default upstream:
  https://github.com/WebKit/WebKit/commit/3d60d9f93c64aac55c890160d00d008367e11e91
  Add -DUSE_AVIF=OFF to _CONF_OPTS due to missing libavif package
2.39.6
- https://lists.webkit.org/pipermail/webkit-gtk/2023-January/003874.html
2.39.7
- https://lists.webkit.org/pipermail/webkit-gtk/2023-January/003875.html
2.39.90
- https://lists.webkit.org/pipermail/webkit-gtk/2023-February/003880.html
2.39.91
- https://lists.webkit.org/pipermail/webkit-gtk/2023-March/003882.html
2.40.0
- https://lists.webkit.org/pipermail/webkit-gtk/2023-March/003885.html
2.40.1
- https://lists.webkit.org/pipermail/webkit-gtk/2023-April/003892.html
  Fixes CVE-2022-0108, CVE-2022-32885, CVE-2023-27932, CVE-2023-27954 &
  CVE-2023-28205:
  https://lists.webkit.org/pipermail/webkit-gtk/2023-April/003895.html
2.40.2
- https://lists.webkit.org/pipermail/webkit-gtk/2023-May/003900.html
  Fixes CVE-2023-28204 & CVE-2023-32373:
  https://lists.webkit.org/pipermail/webkit-gtk/2023-May/003901.html
2.40.3
- https://lists.webkit.org/pipermail/webkit-gtk/2023-June/003909.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/webkitgtk/webkitgtk.hash | 7 +++----
 package/webkitgtk/webkitgtk.mk   | 5 +++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 3bc521e445..756ac13ec2 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,6 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.38.6.tar.xz.sums
-md5  a50290fdc80842b1ae8be1e1147b5679  webkitgtk-2.38.6.tar.xz
-sha1  4dfb3d96f621fc633ff347e083e429893551fb26  webkitgtk-2.38.6.tar.xz
-sha256  1c614c9589389db1a79ea9ba4293bbe8ac3ab0a2234cac700935fae0724ad48b  webkitgtk-2.38.6.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.40.3.tar.xz.sums
+sha1  74ee7241f2add46897019e22bd4f8e19e09027bb  webkitgtk-2.40.3.tar.xz
+sha256  cc0aa83f40dbc64c1c6ae42ec6b85af4be2a9dbf524cfcb95f89a367fb5098dd  webkitgtk-2.40.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index dd17b46e67..56277a0a0a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.38.6
+WEBKITGTK_VERSION = 2.40.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -13,7 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
-WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
+WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
@@ -24,6 +24,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_SPELLCHECK=ON \
 	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
+	-DUSE_AVIF=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
 	-DUSE_SOUP2=ON \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
