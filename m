Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E60DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:12:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07AB660F35
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07AB660F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B1360B1A;
	Wed,  4 Aug 2021 00:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id je8nGUh8ULhi; Wed,  4 Aug 2021 00:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F3260AF4;
	Wed,  4 Aug 2021 00:12:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 716D91BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD56840F64
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ikeO4s1gSvv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2496440EEA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7ACDF8766C; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 20:26:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b90237626c91301abff31a1c9f08a82b89319269
X-Git-Newrev: 804d3ef55e157e3e3e7de69295fb9ea1446b44da
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.7ACDF8766C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cegui: disable Python
 SWIG extension modules unconditionally
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

commit: https://git.buildroot.net/buildroot/commit/?id=804d3ef55e157e3e3e7de69295fb9ea1446b44da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It seems that Python SWIG extension module(s) are not compatible with
buildroot's SWIG version so disable them unconditionally to fix
the following build errors:

Fixes:
 - http://autobuild.buildroot.net/results/f80/f80ebdcbde08c13eddec9fadc39b9c2bd4b83e94//

  and more...

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/cegui.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 747ebbb953..127d3b0fad 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -16,7 +16,8 @@ CEGUI_CONF_OPTS = \
 	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
 	-DCEGUI_USE_FRIBIDI=OFF \
 	-DCEGUI_SAMPLES_ENABLED=OFF \
-	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF
+	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF \
+	-DCEGUI_BUILD_PYTHON_MODULES_SWIG=OFF
 CEGUI_DEPENDENCIES = glm \
 	$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
 	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
