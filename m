Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FD9C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:04:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E28D60FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E28D60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B0AC6149D;
	Thu, 26 Aug 2021 22:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZklBdesWLbn; Thu, 26 Aug 2021 22:04:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5E06149F;
	Thu, 26 Aug 2021 22:04:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21C2A1C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D50AC407B7
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dkss9nI480qm for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48EF84077E
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9DE4D8DC52; Thu, 26 Aug 2021 22:01:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 23:44:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: af34a67be6ae5d399e6894e7825a30df71365773
X-Git-Newrev: cb340dfbdc771d71a3fbe89492ea229459d55681
X-Patchwork-Hint: ignore
Message-Id: <20210826220126.9DE4D8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libqrtr-glib: add
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
