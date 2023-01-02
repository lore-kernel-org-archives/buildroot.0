Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A8CC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 16:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A3A2408E2;
	Mon,  2 Jan 2023 16:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A3A2408E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_NBaKUFp8bB; Mon,  2 Jan 2023 16:57:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5A4940983;
	Mon,  2 Jan 2023 16:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A4940983
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7171BF2EC
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 16:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 413E6408F2
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 16:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 413E6408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XW7Z0JjfO4iC for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C3B64090D
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C3B64090D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BD6287118; Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 17:50:12 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 7f8341b6c33ca8878158f2e76a1dd61c5fae67a9
X-Git-Newrev: 421787e3ad596cb3d18f56e0114cac7ade0800ba
X-Patchwork-Hint: ignore
Message-Id: <20230102165752.5BD6287118@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/tiff: add
 libdeflate optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=421787e3ad596cb3d18f56e0114cac7ade0800ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

libdeflate is an optional dependency which is enabled by default since
version 4.2.0 and
https://gitlab.com/libtiff/libtiff/-/commit/3a2de853a932bd0ea79d1677d319841edb736c38

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 08ca8ff727c87fce2c6edcb9fc2df0885c22543b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
