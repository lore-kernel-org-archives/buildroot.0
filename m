Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCF1C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F6D040201;
	Thu, 29 Dec 2022 09:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F6D040201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_-yob57vYzI; Thu, 29 Dec 2022 09:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1FB402D2;
	Thu, 29 Dec 2022 09:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1FB402D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16C211BF962
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6B224057F
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6B224057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QJFby6jnMAr for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:05:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2738E40579
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2738E40579
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16CFF86FEA; Thu, 29 Dec 2022 09:05:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:05:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96d3e5fd2f5310e9f626084669a9ddaa55c92eda
X-Git-Newrev: 08ca8ff727c87fce2c6edcb9fc2df0885c22543b
X-Patchwork-Hint: ignore
Message-Id: <20221229090543.16CFF86FEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: add libdeflate optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=08ca8ff727c87fce2c6edcb9fc2df0885c22543b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdeflate is an optional dependency which is enabled by default since
version 4.2.0 and
https://gitlab.com/libtiff/libtiff/-/commit/3a2de853a932bd0ea79d1677d319841edb736c38

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tiff/Config.in | 5 +++++
 package/tiff/tiff.mk   | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index f842c2ead8..cc9aa5cfd0 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -11,6 +11,11 @@ config BR2_PACKAGE_TIFF_CCITT
 	bool "CCITT Group 3 & 4 support"
 	default y
 
+config BR2_PACKAGE_TIFF_LIBDEFLATE
+	bool "Libdeflate usage (still requires Zlib)"
+	select BR2_PACKAGE_LIBDEFLATE
+	select BR2_PACKAGE_TIFF_ZLIB
+
 config BR2_PACKAGE_TIFF_PACKBITS
 	bool "Macintosh PackBits algorithm"
 	default y
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 7981bdf2c9..a753065fde 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -33,6 +33,13 @@ ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
 TIFF_CONF_OPTS += --disable-ccitt
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF_LIBDEFLATE),y)
+TIFF_CONF_OPTS += --enable-libdeflate
+TIFF_DEPENDENCIES += libdeflate
+else
+TIFF_CONF_OPTS += --disable-libdeflate
+endif
+
 ifneq ($(BR2_PACKAGE_TIFF_PACKBITS),y)
 TIFF_CONF_OPTS += --disable-packbits
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
