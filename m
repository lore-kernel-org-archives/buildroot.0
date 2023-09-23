Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0D1CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 16:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65E2981F8B;
	Sat, 23 Sep 2023 16:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E2981F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVS9LUc4IgwR; Sat, 23 Sep 2023 16:52:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4AA781E66;
	Sat, 23 Sep 2023 16:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4AA781E66
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23A9D1BF25F
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 16:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0AB981E66
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 16:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0AB981E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gaMYA_fGNmSf for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 16:52:17 +0000 (UTC)
Received: from mail.light-speed.de (mail.light-speed.de
 [IPv6:2a01:238:43f2:8900:dd04:e3a0:ee11:a73d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FF0A80A6E
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 16:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF0A80A6E
Received: from bilbo.fritz.box (ip5f5a8b4a.dynamic.kabel-deutschland.de
 [95.90.139.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id A73ED3D42A6B;
 Sat, 23 Sep 2023 18:52:14 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 18:52:14 +0200
Message-Id: <20230923165214.4014466-1-mail@jens-maus.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20170608153557.30726-1-mail@jens-maus.de>
References: <20170608153557.30726-1-mail@jens-maus.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1695487934;
 bh=8UdRPBcB/hAD9N6R/f3CL5CHpUByj3mlhTahWxGZpT0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=m6/bWZxZIRLoTrYDEwd+Zcn8aWAZ9fofcmBEtXKFtWcT4x1oI4lC8QVczHTQRLGQI
 jkuPV1MTInzL2TfblMAQfe2jPxuA9qCkECdA10c+j9FWCWfz5IKxxih1YjAfp7oKEr
 +2BTIXD1s62aPxYoWz5CgXJarMyM9vMinWoVCRyc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=m6/bWZxZ
Subject: [Buildroot] [PATCH v2] package/nut: package/nut: specify
 --with-user/group when building NUT
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit fixes a problem where the NUT package couldn't be
used as a NUT server due to the fact that the default group for
nobody is "nogroup" and not "nobody" like the internal default
of NUT. Thus, when starting a NUT server daemon the daemon starts
with incorrect group permissions. This commit fixes this
shortcoming by introducing a dedicated 'nut' user and 'nut' group
to drop priviledges to it.

Signed-off-by: Jens Maus <mail@jens-maus.de>

---
Changes v1 -> v2:
  - added NUT_USERS with nut/nut user and group (Yann)

Signed-off-by: Jens Maus <mail@jens-maus.de>
---
 package/nut/nut.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index fb98ba04f0..4c322aeb85 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -24,7 +24,9 @@ NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
 NUT_CONF_OPTS = \
 	--with-altpidpath=/var/run/upsd \
 	--with-dev \
-	--without-doc
+	--without-doc \
+	--with-user=nut \
+	--with-group=nut
 
 NUT_CONF_ENV = \
 	ax_cv_check_cflags__Werror__Wno_unknown_warning_option=no \
@@ -34,6 +36,10 @@ NUT_CONF_ENV = \
 	ac_cv_func_strncasecmp=yes \
 	ax_cv__printf_string_null=yes
 
+define NUT_USERS
+	nut -1 nut -1 * - - - NUT user
+endef
+
 ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
 NUT_CONF_OPTS += --with-drivers=auto
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
