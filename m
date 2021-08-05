Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A2DC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:45:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F213C610FC
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F213C610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD1DC83560;
	Thu,  5 Aug 2021 21:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0DZ6SEWb0hZ; Thu,  5 Aug 2021 21:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304B3834FE;
	Thu,  5 Aug 2021 21:45:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61A3C1BF2BB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50F2340481
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m53GHqMvblBL for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 21:45:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A54DF40478
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 21:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3283085C91; Thu,  5 Aug 2021 21:45:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 23:44:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af34a67be6ae5d399e6894e7825a30df71365773
X-Git-Newrev: cb340dfbdc771d71a3fbe89492ea229459d55681
X-Patchwork-Hint: ignore
Message-Id: <20210805214535.3283085C91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqrtr-glib: add
 gobject-introspection optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb340dfbdc771d71a3fbe89492ea229459d55681
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gobject-introspection is an optional dependency (enabled by default)
since the addition of the package in commit
ea64e05a1bfbe3b258a69013462f94d7db7a9c0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqrtr-glib/libqrtr-glib.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libqrtr-glib/libqrtr-glib.mk b/package/libqrtr-glib/libqrtr-glib.mk
index b9fc5cf3ba..6ab8335417 100644
--- a/package/libqrtr-glib/libqrtr-glib.mk
+++ b/package/libqrtr-glib/libqrtr-glib.mk
@@ -12,4 +12,11 @@ LIBQRTR_GLIB_LICENSE_FILES = COPYING.LIB
 LIBQRTR_GLIB_INSTALL_STAGING = YES
 LIBQRTR_GLIB_DEPENDENCIES = libglib2
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBQRTR_GLIB_CONF_OPTS += --enable-introspection
+LIBQRTR_GLIB_DEPENDENCIES += gobject-introspection
+else
+LIBQRTR_GLIB_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
