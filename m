Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06974C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B408783104;
	Mon, 20 Feb 2023 23:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B408783104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IbTysdTVLmxd; Mon, 20 Feb 2023 23:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F5F83F75;
	Mon, 20 Feb 2023 23:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F5F83F75
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5139C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14D4061ADF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D4061ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4avhwNELdpOq for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF5F861784
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF5F861784
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D580C86495; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:33:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f934a00928b413fb3c190749a5bda578c6c02255
X-Git-Newrev: 3fd6ada8dbca3370b9bb67feb2971e637cb4b11f
X-Patchwork-Hint: ignore
Message-Id: <20230220205218.D580C86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tiff: add webp
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fd6ada8dbca3370b9bb67feb2971e637cb4b11f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

webp is an optional dependency which is enabled by default since version
4.0.10 and
https://gitlab.com/libtiff/libtiff/-/commit/9eacd59fecc4ef593ac17689bc530ab451c8ec14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tiff/Config.in | 4 ++++
 package/tiff/tiff.mk   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index d1004d6668..b9e3656e6f 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -72,6 +72,10 @@ config BR2_PACKAGE_TIFF_UTILITIES
 	help
 	  Install all tiff utilities.
 
+config BR2_PACKAGE_TIFF_WEBP
+	bool "WEBP compression"
+	select BR2_PACKAGE_WEBP
+
 config BR2_PACKAGE_TIFF_ZSTD
 	bool "ZSTD compression"
 	select BR2_PACKAGE_ZSTD
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 90b28ff37a..6d761ad678 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -100,6 +100,13 @@ else
 TIFF_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF_WEBP),y)
+TIFF_CONF_OPTS += --enable-webp
+TIFF_DEPENDENCIES += webp
+else
+TIFF_CONF_OPTS += --disable-webp
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF_ZSTD),y)
 TIFF_CONF_OPTS += --enable-zstd
 TIFF_DEPENDENCIES += zstd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
