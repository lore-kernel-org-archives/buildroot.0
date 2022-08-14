Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F41DC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 16:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1CAF60D96;
	Sun, 14 Aug 2022 16:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1CAF60D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpdARj3dSKiM; Sun, 14 Aug 2022 16:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D66260D69;
	Sun, 14 Aug 2022 16:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D66260D69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDA461BF410
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C26A960D50
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C26A960D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBctJ3twyuQZ for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 16:46:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 133C260D69
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 133C260D69
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A3FD48751D; Sun, 14 Aug 2022 16:31:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 18:38:35 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 443df533182d6d225a961cad8eb9c172b2689987
X-Git-Newrev: 71dd5db411c0f2f9411f1b8780da0e4e4b84b9f6
X-Patchwork-Hint: ignore
Message-Id: <20220814163132.A3FD48751D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/poppler: set
 g-ir-scanner/g-ir-compiler paths
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

commit: https://git.buildroot.net/buildroot/commit/?id=71dd5db411c0f2f9411f1b8780da0e4e4b84b9f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The g-ir-scanner/g-ir-compiler paths don't always get picked up
properly by cmake.

Fixes:
[ 98%] Linking CXX shared library libpoppler-glib.so
[ 98%] Built target poppler-glib
[ 98%] Generating Poppler-0.18.gir
/bin/sh: 1: /home/buildroot/buildroot/output/per-package/poppler/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/per-package/poppler/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/../../bin/g-ir-scanner: not found

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c998e195e4efac923a95e36b1f274c35b9b3f66b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 18c044a9f6..b54262e7c4 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -44,7 +44,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 POPPLER_DEPENDENCIES += gobject-introspection
-POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=ON
+POPPLER_CONF_OPTS += \
+	-DENABLE_GOBJECT_INTROSPECTION=ON \
+	-DINTROSPECTION_SCANNER=$(STAGING_DIR)/usr/bin/g-ir-scanner \
+	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler
 else
 POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
