Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50270EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 10:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F394440C2C;
	Mon, 11 Sep 2023 10:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F394440C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZT1GT1EHjNFE; Mon, 11 Sep 2023 10:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DCD740C5A;
	Mon, 11 Sep 2023 10:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DCD740C5A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 324B61BF28E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0872A81406
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0872A81406
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2sSdKtUMF8Gn for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2423181407
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2423181407
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13FA686C6D; Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 12:33:11 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: eebbfb5f286e55ae11df49b5ff5b85d313c14707
X-Git-Newrev: f8c6a08f1a7ab3d290f8f5969cd144a5e231d6fd
X-Patchwork-Hint: ignore
Message-Id: <20230911103506.13FA686C6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libksba: update
 CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8c6a08f1a7ab3d290f8f5969cd144a5e231d6fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

libksba_project:libksba has been deprecated by NVD [0],
gnupg:libksba should be used instead.

[0]: https://nvd.nist.gov/products/cpe/detail/AA709F75-0B9E-4B67-ACEA-C1DCF33E7745?namingFormat=2.3&orderBy=CPEURI&keyword=libksba&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4936a8e9e2c5cc03b30f32ac8476d6bcfb0412e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
