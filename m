Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C4DEB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 06:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E47F4170F;
	Wed, 28 Jun 2023 06:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E47F4170F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DiCy9KlDEn7C; Wed, 28 Jun 2023 06:19:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4239D416A7;
	Wed, 28 Jun 2023 06:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4239D416A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6261BF855
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 06:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64CE44089A
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 06:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64CE44089A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwIQNHfyb_1N for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 06:19:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ECB8404AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ECB8404AA
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 06:19:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47E5DA4C0103
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 08:19:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44118)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEOWh-0000TF-3C
 for buildroot@buildroot.org; Wed, 28 Jun 2023 08:19:40 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 08:19:39 +0200
Message-Id: <20230628061939.38666-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687933180;
 bh=rgM/dHIyzOpHym1CvxgyqF9Df04Cs71H0lkURy8yyLo=;
 h=From:To:Subject:Date:From;
 b=mZYcn6aybNe1ELIt1jchbpYuTK5OmyBqcyo0oHTKZyoqQiZ4Wi8ZVtvSY1QAIDqE5
 SL8poL3NbVlaSsHvuwHgWwZZ9PLa/jUrQJgcDnscWdPAPqBCHb8wVlaG0un8IgUESk
 NCNf47W82HQrQSN7c7zvbTTMr/6+LUX25+mmOnaXDQtBJxzOWLJNDp4rSdaIAZNn+r
 +JpvrWAWqH8NEoHx5WA/EgQGAP9nh94W8Z3GWqCerJUx0252l6MhEyrSjJ1Uwlv5A1
 MVef4brioFzBExW2qBeFaWTg61EMJqP1TA+d/84ttNFUU5zfWw8Xk/kjU+l318d0eQ
 6ZeE3pc7KfG9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=mZYcn6ay
Subject: [Buildroot] [PATCH 1/1] package/freetype: bump version to 2.13.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.13.1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 60eb8dbb1d..ea03526c99 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.0/
-sha1  6393c1451c2f1c5f83aed5ea92d280af078e27d9  freetype-2.13.0.tar.xz
-sha256  5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c  freetype-2.13.0.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.1/
+sha1  af9b6b754320a0526179f166e3f8cffce78526ca  freetype-2.13.1.tar.xz
+sha256  ea67e3b019b1104d1667aa274f5dc307d8cbd606b399bc32df308a77f1a564bf  freetype-2.13.1.tar.xz
 
 # Locally calculated
 sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 4d7c4cd0d5..c6bc0673f6 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.13.0
+FREETYPE_VERSION = 2.13.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
