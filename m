Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3234FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:54:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF47660F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF47660F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA638404D6;
	Tue,  3 Aug 2021 21:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhQtw6ccOKQw; Tue,  3 Aug 2021 21:54:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 900E040179;
	Tue,  3 Aug 2021 21:54:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2032F1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BF55608C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9bBD_XPylSr for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9972B608B5
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E3967873E2; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 17:28:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7a15b79728a738665f65bd39c8b085d6b04375c9
X-Git-Newrev: b7a5b9d06d484700fc4fcbd354f2c15e0422688c
X-Patchwork-Hint: ignore
Message-Id: <20210803210950.E3967873E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libkrb5: add openssl
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7a5b9d06d484700fc4fcbd354f2c15e0422688c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

openssl is an optional dependency which is enabled by default since at
least 2007 and
https://github.com/krb5/krb5/commit/4c17f25c0f106ec8e3aad2cee4e7a24f66b5a65d

Enable DES, MD4 and RC4 in openssl to fix build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/d73b477bd2064aee076f9debfd8d3346c63ba657

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: squash the two commits together]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libkrb5/Config.in  |  3 +++
 package/libkrb5/libkrb5.mk | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
index 2e24c87229..3357d4ad04 100644
--- a/package/libkrb5/Config.in
+++ b/package/libkrb5/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_LIBKRB5
 	# needs fork()
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Kerberos is a system for authenticating users and services
 	  on a network. Kerberos is a trusted third-party service.
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index e4f3fa4186..794cedd33c 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -41,6 +41,21 @@ else
 LIBKRB5_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBKRB5_CONF_OPTS += \
+	--enable-pkinit \
+	--with-crypto-impl=openssl \
+	--with-spake-openssl \
+	--with-tls-impl=openssl
+LIBKRB5_DEPENDENCIES += openssl
+else
+LIBKRB5_CONF_OPTS += \
+	--disable-pkinit \
+	--with-crypto-impl=builtin \
+	--without-spake-openssl \
+	--without-tls-impl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 LIBKRB5_CONF_OPTS += --with-libedit
 LIBKRB5_DEPENDENCIES += host-pkgconf libedit
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
