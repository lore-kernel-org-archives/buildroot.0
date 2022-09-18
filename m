Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC4C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8115F4240F;
	Sun, 18 Sep 2022 10:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8115F4240F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEfJMIJ8oFlP; Sun, 18 Sep 2022 10:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68A6041619;
	Sun, 18 Sep 2022 10:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68A6041619
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED74B1BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C47B58416B
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C47B58416B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLIlYTcJIXoD for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:27:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0447F84018
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0447F84018
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E071F84EA5; Sun, 18 Sep 2022 10:27:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:25:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37e26947565df581e2e0e1b41b0d5b4a3e8a7df1
X-Git-Newrev: 17e44d66039146ce1299e0cf5a646ddac900d440
X-Patchwork-Hint: ignore
Message-Id: <20220918102735.E071F84EA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add qt icu support
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

commit: https://git.buildroot.net/buildroot/commit/?id=17e44d66039146ce1299e0cf5a646ddac900d440
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 27fb673504..7b296fc99b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -101,6 +101,13 @@ endef
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
+QT6BASE_DEPENDENCIES += icu
+else
+QT6BASE_CONF_OPTS += -DFEATURE_icu=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
