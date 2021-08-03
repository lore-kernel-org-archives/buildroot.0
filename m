Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_05,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AA8C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:39:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2695761040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2695761040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3116607E4;
	Tue,  3 Aug 2021 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Paei_a8Jzr0j; Tue,  3 Aug 2021 14:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6616E607AF;
	Tue,  3 Aug 2021 14:39:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18DE91BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 073544035A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7ZglQ6UTAHd for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:37:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB3F940352
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:37:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (7)
Received: from bartekk-pc.lan (host-81-161-202-20.oxylion.net.pl
 [81.161.202.20])
 by server220076.nazwa.pl (Postfix) with ESMTP id 344071C57AE;
 Tue,  3 Aug 2021 16:37:01 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 16:36:54 +0200
Message-Id: <20210803143654.550783-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cegui: disable OpenGLES renderer
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support of OpenGLES generates tons of autobuilders failures
so let's disable it till upstream finds a solution for that.

Fixes:
 http://autobuild.buildroot.net/results/41d/41d10c09472fbb8481a72c4f8bed789bb15bb3c2//
 http://autobuild.buildroot.net/results/9a8/9a8122b4d3d0aa9d71cdf8d21359411b130741f8//
 http://autobuild.buildroot.net/results/7e5/7e5dd79b48abde09bf4633b196579da5561f9fa1//

and many more...

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/cegui/cegui.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 127d3b0fad..2e56322374 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -13,6 +13,7 @@ CEGUI_CONF_OPTS = \
 	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
 	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
 	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
+	-DCEGUI_BUILD_RENDERER_OPENGLES=OFF \
 	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
 	-DCEGUI_USE_FRIBIDI=OFF \
 	-DCEGUI_SAMPLES_ENABLED=OFF \
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
