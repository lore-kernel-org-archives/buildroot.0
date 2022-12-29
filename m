Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D2AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED60403A7;
	Thu, 29 Dec 2022 09:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ED60403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPSQxy4AT8vS; Thu, 29 Dec 2022 09:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10F7403D0;
	Thu, 29 Dec 2022 09:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D10F7403D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A85011BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83C364058E
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83C364058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tB9xwoLpja8o for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:28:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A003240580
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A003240580
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C64187012; Thu, 29 Dec 2022 09:28:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:28:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 369ff9a88ff8e88b78287e37fbaf191e57598be2
X-Git-Newrev: 7e4b0d8be54ce6dd9c54f1c04eeb752db2f0dcf3
X-Patchwork-Hint: ignore
Message-Id: <20221229092831.8C64187012@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-image-exiftool: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7e4b0d8be54ce6dd9c54f1c04eeb752db2f0dcf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                    |  1 +
 package/perl-image-exiftool/Config.in                |  8 ++++++++
 package/perl-image-exiftool/perl-image-exiftool.hash |  6 ++++++
 package/perl-image-exiftool/perl-image-exiftool.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0c77f7c022..41e15ca77f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -839,6 +839,7 @@ menu "Perl libraries/modules"
 	source "package/perl-http-multipartparser/Config.in"
 	source "package/perl-http-negotiate/Config.in"
 	source "package/perl-i18n/Config.in"
+	source "package/perl-image-exiftool/Config.in"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-interface/Config.in"
 	source "package/perl-io-socket-multicast/Config.in"
diff --git a/package/perl-image-exiftool/Config.in b/package/perl-image-exiftool/Config.in
new file mode 100644
index 0000000000..3bc72ba634
--- /dev/null
+++ b/package/perl-image-exiftool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_IMAGE_EXIFTOOL
+	bool "perl-image-exiftool"
+	help
+	  ExifTool is a customizable set of Perl modules plus a
+	  full-featured command-line application for reading and writing
+	  meta information in a wide variety of image files.
+
+	  https://metacpan.org/release/Image-ExifTool
diff --git a/package/perl-image-exiftool/perl-image-exiftool.hash b/package/perl-image-exiftool/perl-image-exiftool.hash
new file mode 100644
index 0000000000..ac148aa89b
--- /dev/null
+++ b/package/perl-image-exiftool/perl-image-exiftool.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5  75dd9d375c1c4798a082dda79eaf6ba7  Image-ExifTool-12.50.tar.gz
+sha256  bce841fc5c10302f0f3ef7678c3bf146953a8c065c0ba18c41f734007e2ec0a8  Image-ExifTool-12.50.tar.gz
+
+# computed by scancpan
+sha256  63502bb7fd68b3b8265304d88932f70f1be82751cbc37936d1d62956582310fe  README
diff --git a/package/perl-image-exiftool/perl-image-exiftool.mk b/package/perl-image-exiftool/perl-image-exiftool.mk
new file mode 100644
index 0000000000..42adb04d3a
--- /dev/null
+++ b/package/perl-image-exiftool/perl-image-exiftool.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-image-exiftool
+#
+################################################################################
+
+PERL_IMAGE_EXIFTOOL_VERSION = 12.50
+PERL_IMAGE_EXIFTOOL_SOURCE = Image-ExifTool-$(PERL_IMAGE_EXIFTOOL_VERSION).tar.gz
+PERL_IMAGE_EXIFTOOL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/EX/EXIFTOOL
+PERL_IMAGE_EXIFTOOL_LICENSE = Artistic or GPL-1.0+
+PERL_IMAGE_EXIFTOOL_LICENSE_FILES = README
+PERL_IMAGE_EXIFTOOL_DISTNAME = Image-ExifTool
+
+$(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
