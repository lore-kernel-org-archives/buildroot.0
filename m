Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2DAEE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D41A841183;
	Mon, 21 Aug 2023 20:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D41A841183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4CExhYejfga; Mon, 21 Aug 2023 20:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07E53410A7;
	Mon, 21 Aug 2023 20:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07E53410A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B10F01BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FF9A40928
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FF9A40928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fLjpbuuifJd for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D44414CC
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90D44414CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E8C586028; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 09:40:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7dc8dffe3a83dbd33abb0a0c7c3a24ce5cfe73cb
X-Git-Newrev: 4936a8e9e2c5cc03b30f32ac8476d6bcfb0412e8
X-Patchwork-Hint: ignore
Message-Id: <20230821200124.8E8C586028@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libksba: update CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=4936a8e9e2c5cc03b30f32ac8476d6bcfb0412e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libksba_project:libksba has been deprecated by NVD [0],
gnupg:libksba should be used instead.

[0]: https://nvd.nist.gov/products/cpe/detail/AA709F75-0B9E-4B67-ACEA-C1DCF33E7745?namingFormat=2.3&orderBy=CPEURI&keyword=libksba&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libksba/libksba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index b7c0508df8..122914d524 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -9,7 +9,7 @@ LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
-LIBKSBA_CPE_ID_VENDOR = libksba_project
+LIBKSBA_CPE_ID_VENDOR = gnupg
 LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
 LIBKSBA_CONF_OPTS = --with-gpg-error-prefix=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
