Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56949C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:34:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F134260EB7
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F134260EB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA79181C58;
	Sun,  8 Aug 2021 19:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GiVY-6TNNWFx; Sun,  8 Aug 2021 19:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 243BE8104F;
	Sun,  8 Aug 2021 19:34:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8333A1BF97E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7358282D07
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ew-BqF-cG6E7 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 606F382CDD
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1A6C88D253; Sun,  8 Aug 2021 19:33:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:13:07 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5b4698a09490a620d97ef054a3c64b6055fcb3b6
X-Git-Newrev: 4b7cc5588995f032219a2d230cd1acdec59e4575
X-Patchwork-Hint: ignore
Message-Id: <20210808193333.1A6C88D253@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libqrtr-glib: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b7cc5588995f032219a2d230cd1acdec59e4575
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

gobject-introspection is an optional dependency (enabled by default)
since the addition of the package in commit
ea64e05a1bfbe3b258a69013462f94d7db7a9c0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cb340dfbdc771d71a3fbe89492ea229459d55681)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
