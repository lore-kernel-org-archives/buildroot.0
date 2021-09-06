Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F73C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:52:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B0460F43
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79B0460F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D10C6080C;
	Mon,  6 Sep 2021 14:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eV9Wc_-DZ95m; Mon,  6 Sep 2021 14:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A668D6062F;
	Mon,  6 Sep 2021 14:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 985DF1BF34D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4636A4040D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J70YtWI_QsyA for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 14:50:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EA644028E
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 14:50:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8D0EC886B4; Mon,  6 Sep 2021 14:49:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 15:39:22 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: aa853e4455615f8987ef35d12faf1d139c19da30
X-Git-Newrev: cb542f08ce0a40d2eeb7b60103bc8efa32c261cd
X-Patchwork-Hint: ignore
Message-Id: <20210906144908.8D0EC886B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] Revert "package/libshout:
 enable optional dependency for libressl"
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb542f08ce0a40d2eeb7b60103bc8efa32c261cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

This reverts commit 46b8fb7500ecca65a79507318fd3052208559c09 indeed if
libressl is selected as the openssl provider, the BR2_PACKAGE_OPENSSL
conditition will always be used and the BR2_PACKAGE_LIBRESSL condition
will never be triggered. Moreover, libressl provides a pkg-config file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit da4d8fc407b57736e2746f236df43baa102b85a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libshout/libshout.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 57d26390c5..4afb762de6 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -33,9 +33,6 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSHOUT_CONF_OPTS += --with-openssl
 LIBSHOUT_DEPENDENCIES += openssl
-else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
-LIBSHOUT_CONF_OPTS += --with-openssl=$(STAGING_DIR)/lib
-LIBSHOUT_DEPENDENCIES += libressl
 else
 LIBSHOUT_CONF_OPTS += --without-openssl
 endif
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
