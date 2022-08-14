Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B78AC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 16:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E027C4064C;
	Sun, 14 Aug 2022 16:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E027C4064C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHzWiWbWjrsG; Sun, 14 Aug 2022 16:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0065C4061C;
	Sun, 14 Aug 2022 16:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0065C4061C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52BAA1BF410
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B3F783ECC
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B3F783ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMbOgMkyESMJ for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 16:46:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88519817C3
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88519817C3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2640387524; Sun, 14 Aug 2022 16:32:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 18:38:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6f381e7aef87b2c8aca7a1d17f717efda3a4b5cb
X-Git-Newrev: 740c08f94028040561963c0e6c9b8b414f3d44fb
X-Patchwork-Hint: ignore
Message-Id: <20220814163217.2640387524@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/poppler: set
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

commit: https://git.buildroot.net/buildroot/commit/?id=740c08f94028040561963c0e6c9b8b414f3d44fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
