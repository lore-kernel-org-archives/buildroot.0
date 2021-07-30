Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE97C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:36:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 165346054E
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 165346054E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8FFE83294;
	Fri, 30 Jul 2021 21:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-BwgzGHPPBZ; Fri, 30 Jul 2021 21:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CDA082F87;
	Fri, 30 Jul 2021 21:36:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC571BF488
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CEFF4026A
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGYJ7iaJJMFP for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D555040117
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7E4778A339; Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 23:35:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd1ed4e366e2ff76c37c31e8a2af0129d10fbb63
X-Git-Newrev: 88b07f86befd30734b111e00a1160eab3194bfb5
X-Patchwork-Hint: ignore
Message-Id: <20210730213535.7E4778A339@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gssdp: disable sniffer
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

commit: https://git.buildroot.net/buildroot/commit/?id=88b07f86befd30734b111e00a1160eab3194bfb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable sniffer as it depends on gtk4 since
https://gitlab.gnome.org/GNOME/gssdp/-/commit/c251ddcd03331ecba8702658be8023fb32743a85
and so build failures are raised since bump to version 1.3.0 in commit
42b46562a286d0082638f9bac5346c523877b5c2

Fixes:
 - http://autobuild.buildroot.org/results/3b4f4a2c19696b32c3a70af5792a305cd861328c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gssdp/gssdp.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 03987ff085..9e67d35db1 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -12,7 +12,7 @@ GSSDP_LICENSE = LGPL-2.1+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
-GSSDP_CONF_OPTS = -Dexamples=false
+GSSDP_CONF_OPTS = -Dexamples=false -Dsniffer=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
@@ -21,11 +21,4 @@ else
 GSSDP_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
-GSSDP_DEPENDENCIES += libgtk3
-GSSDP_CONF_OPTS += -Dsniffer=true
-else
-GSSDP_CONF_OPTS += -Dsniffer=false
-endif
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
