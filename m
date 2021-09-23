Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD77DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:07:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A370560F70
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A370560F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 778C8400F2;
	Thu, 23 Sep 2021 21:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id klQwASDdfiwa; Thu, 23 Sep 2021 21:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 903AA40534;
	Thu, 23 Sep 2021 21:07:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 513221BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6B80406EB
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qnhpJjsHaFw for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AA15415B6
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9F4F48D212; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 23:02:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f1770cb9b795668eb2df41a5b453b843f1fd112
X-Git-Newrev: 86e09b6ed17ad6ea0f3c2dafa8fd4ba112f43347
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.9F4F48D212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsrtp: bump to version 2.4.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=86e09b6ed17ad6ea0f3c2dafa8fd4ba112f43347
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- libnss is an optional dependency since version 2.3.0 and
  https://github.com/cisco/libsrtp/commit/a946b3f561757a08b879cb337bfa932086df3081
- Drop comment about pkg-config as libsrtp uses PKG_CHECK_MODULES to
  find libnss and openssl
- Update indentation in hash file (two spaces)

https://github.com/cisco/libsrtp/blob/v2.4.1/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsrtp/libsrtp.hash |  4 ++--
 package/libsrtp/libsrtp.mk   | 13 ++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index d4b7b54d03..3de0130f4c 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 44fd7497bce78767e96b54a11bca520adb2ad32effd515f04bce602b60a1a50b  libsrtp-2.2.0.tar.gz
-sha256 8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
+sha256  3cb580928fcd502426809c68406d04aaa5ef1af7ebb0a3a41a52a13576f2fc07  libsrtp-2.4.1.tar.gz
+sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 5cbd97957a..885f05a33c 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.2.0
+LIBSRTP_VERSION = 2.4.1
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
@@ -19,18 +19,17 @@ else
 LIBSRTP_MAKE_OPTS = libsrtp2.a shared_library
 endif
 
-# While libsrtp is not using pkg-config itself, it checks if
-# pkg-config is available to determine whether it should install
-# libsrtp.pc. Since installing it seems useful, let's depend on
-# host-pkgconf to make sure pkg-config is installed.
 LIBSRTP_DEPENDENCIES = host-pkgconf
 
 # openssl handling needs libdl support
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 LIBSRTP_DEPENDENCIES += openssl
-LIBSRTP_CONF_OPTS += --enable-openssl
+LIBSRTP_CONF_OPTS += --disable-nss --enable-openssl
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
+LIBSRTP_DEPENDENCIES += libnss
+LIBSRTP_CONF_OPTS += --enable-nss --disable-openssl
 else
-LIBSRTP_CONF_OPTS += --disable-openssl
+LIBSRTP_CONF_OPTS += --disable-nss --disable-openssl
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
