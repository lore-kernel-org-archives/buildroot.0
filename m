Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51812C00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE1161188;
	Tue,  1 Aug 2023 21:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE1161188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBNIbXVg6b2l; Tue,  1 Aug 2023 21:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0B4F61160;
	Tue,  1 Aug 2023 21:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0B4F61160
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45D911BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD2AA4018B
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD2AA4018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpBFVQI-Hty0 for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:04:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E89E841824
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E89E841824
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D634D83F9C; Tue,  1 Aug 2023 21:04:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:03:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60fedc6c1d434d3e125c564f6d4f199bfb3b15a4
X-Git-Newrev: 82508681b3cb23ae50f060b519e41b295cdb4b8c
X-Patchwork-Hint: ignore
Message-Id: <20230801210427.D634D83F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php/php: add a host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=82508681b3cb23ae50f060b519e41b295cdb4b8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having a working PHP with the correct version, is mandatory for
executing some PHP tools, such as composer, when building packages.

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/php.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 68aeceb33e..691436926b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -14,6 +14,7 @@ PHP_DEPENDENCIES = host-pkgconf pcre2
 PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
 PHP_CPE_ID_VENDOR = php
+
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
 	--infodir=/usr/share/info \
@@ -354,4 +355,24 @@ PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
 
 PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)" CXXFLAGS="$(PHP_CXXFLAGS)"
 
+HOST_PHP_CONF_OPTS = \
+	--disable-all \
+	--without-pear \
+	--with-config-file-path=$(HOST_DIR)/etc \
+	--disable-phpdbg \
+	--with-external-pcre \
+	--enable-phar \
+	--enable-json \
+	--enable-filter \
+	--enable-mbstring \
+	--enable-tokenizer \
+	--with-openssl=$(HOST_DIR)
+
+HOST_PHP_DEPENDENCIES = \
+	host-oniguruma \
+	host-openssl \
+	host-pcre2 \
+	host-pkgconf
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
