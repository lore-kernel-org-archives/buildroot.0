Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E616C3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEC6181EDA;
	Tue,  3 Jan 2023 21:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEC6181EDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IMdJoq-jJbB; Tue,  3 Jan 2023 21:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1373481E9C;
	Tue,  3 Jan 2023 21:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1373481E9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77FD41BF2FC
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53F7860D4F
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53F7860D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z8EWlSUH3Aoc for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD2C760AAF
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 21:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2C760AAF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9BD18733B; Tue,  3 Jan 2023 21:10:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Jan 2023 22:09:28 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bc60f1b24e4b80ea6a71628011ea40c178942230
X-Git-Newrev: e556196008cab73cec2a1f900a26354aefaff21f
X-Patchwork-Hint: ignore
Message-Id: <20230103211030.A9BD18733B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tiff: add zstd
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e556196008cab73cec2a1f900a26354aefaff21f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

zstd is an optional dependency which is enabled by default since version
4.0.10 and
https://gitlab.com/libtiff/libtiff/-/commit/62b9df5d2af68262fa6fcfb66086bf128f7d67c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f934a00928b413fb3c190749a5bda578c6c02255)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/Config.in | 4 ++++
 package/tiff/tiff.mk   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index f842c2ead8..157076265c 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -67,4 +67,8 @@ config BR2_PACKAGE_TIFF_UTILITIES
 	help
 	  Install all tiff utilities.
 
+config BR2_PACKAGE_TIFF_ZSTD
+	bool "ZSTD compression"
+	select BR2_PACKAGE_ZSTD
+
 endif
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 7981bdf2c9..1b6bd91220 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -93,5 +93,12 @@ else
 TIFF_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF_ZSTD),y)
+TIFF_CONF_OPTS += --enable-zstd
+TIFF_DEPENDENCIES += zstd
+else
+TIFF_CONF_OPTS += --disable-zstd
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
