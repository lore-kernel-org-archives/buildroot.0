Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF02C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E134460F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E134460F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37D1605C8;
	Tue,  3 Aug 2021 23:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GsK4lbNJk44; Tue,  3 Aug 2021 23:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0848B605C3;
	Tue,  3 Aug 2021 23:18:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0469A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8B204069C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bd2k1CT3X8LB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE9324064F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3B2628827E; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 15:06:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 422fd73fadfbe33523e1687f90bbfecd3f7ab5d5
X-Git-Newrev: 20616a1b65aa718a2d18cac560404fa3b3e70fc8
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.3B2628827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/usbguard: improve
 option handling
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=20616a1b65aa718a2d18cac560404fa3b3e70fc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Don't pass --disable-seccomp and --disable-systemd unconditionally
While at it, also add a space and a new line when needed, and split
the initial CONF_OPTS assignment to have one option per line.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbguard/usbguard.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 72e9e6459a..f3bd7c57ac 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -8,9 +8,13 @@ USBGUARD_VERSION = 1.0.0
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
-USBGUARD_CONF_OPTS= --with-bundled-catch --with-bundled-pegtl \
-		    --disable-debug-build --without-dbus --without-polkit \
-		    --disable-seccomp --disable-umockdev --disable-systemd
+USBGUARD_CONF_OPTS = \
+	--with-bundled-catch \
+	--with-bundled-pegtl \
+	--disable-debug-build \
+	--without-dbus \
+	--without-polkit \
+	--disable-umockdev
 
 USBGUARD_DEPENDENCIES += libqb protobuf
 
@@ -18,10 +22,12 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 USBGUARD_CONF_OPTS += --with-crypto-library=openssl
 USBGUARD_DEPENDENCIES += libopenssl
 endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
 USBGUARD_DEPENDENCIES += libgcrypt
 endif
+
 ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 USBGUARD_CONF_OPTS += --with-crypto-library=sodium
 USBGUARD_DEPENDENCIES += libsodium
@@ -30,11 +36,15 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 USBGUARD_CONF_OPTS += --enable-systemd
 USBGUARD_DEPENDENCIES += systemd
+else
+USBGUARD_CONF_OPTS += --disable-systemd
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 USBGUARD_CONF_OPTS += --enable-seccomp
 USBGUARD_DEPENDENCIES += libseccomp
+else
+USBGUARD_CONF_OPTS += --disable-seccomp
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
