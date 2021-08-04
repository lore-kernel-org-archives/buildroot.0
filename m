Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92274C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:49:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2420561037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2420561037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D657C41480;
	Wed,  4 Aug 2021 20:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJ1GDmmu1P4M; Wed,  4 Aug 2021 20:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E4A406B9;
	Wed,  4 Aug 2021 20:49:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ADF91BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 291B6400D9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V17Vopyi8WWB for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:49:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E3AC400B5
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:49:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 07D068B798; Wed,  4 Aug 2021 20:48:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:46:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 967219ee7f48a77a36a1298be9667b8b3b66a3dc
X-Git-Newrev: 7e783d3e4704d770120da8bbbd6acad168b69625
X-Patchwork-Hint: ignore
Message-Id: <20210804204855.07D068B798@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cegui: disable OpenGLES renderer
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e783d3e4704d770120da8bbbd6acad168b69625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support of OpenGLES generates tons of autobuilders failures
so let's disable it till upstream finds a solution for that.

Fixes:
 http://autobuild.buildroot.net/results/41d/41d10c09472fbb8481a72c4f8bed789bb15bb3c2//
 http://autobuild.buildroot.net/results/9a8/9a8122b4d3d0aa9d71cdf8d21359411b130741f8//
 http://autobuild.buildroot.net/results/7e5/7e5dd79b48abde09bf4633b196579da5561f9fa1//

and many more...

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
