Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962F7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:33:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B84260F51
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B84260F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE4B840D9;
	Sat, 18 Sep 2021 20:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2TUnfFiH1Np; Sat, 18 Sep 2021 20:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B31F840D7;
	Sat, 18 Sep 2021 20:33:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54ED31BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38AB460667
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEouwQbPks3Z for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:33:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DDF460662
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:33:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 99F7F8B6E8; Sat, 18 Sep 2021 20:31:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 22:32:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa90237546ba3bafcc53545731dda45026515d7d
X-Git-Newrev: 5d25d5cb66e2d36680e405e406db6d0f4b31e3ec
X-Patchwork-Hint: ignore
Message-Id: <20210918203125.99F7F8B6E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minicom: drop autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d25d5cb66e2d36680e405e406db6d0f4b31e3ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autoreconf (and so AM_ICONV) is not needed since commit
2df32e0d4437b422175089edf1917219656fccef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/minicom/minicom.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index b81ee52120..5cd1d6b8b8 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -11,12 +11,9 @@ MINICOM_SITE = \
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
 MINICOM_CPE_ID_VENDOR = minicom_project
-MINICOM_AUTORECONF = YES
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	$(TARGET_NLS_DEPENDENCIES) host-pkgconf
-# add host-gettext for AM_ICONV macro
-MINICOM_DEPENDENCIES += host-gettext
 
 MINICOM_CONF_OPTS = \
 	--enable-dfl-port=/dev/ttyS1 \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
