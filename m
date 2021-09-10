Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AF0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF466120A
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EF466120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE5BB80F65;
	Fri, 10 Sep 2021 21:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDsMb75q50ku; Fri, 10 Sep 2021 21:34:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44BCB80F21;
	Fri, 10 Sep 2021 21:34:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 741BA1BF38D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5F480F64
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31zlV_sod0Mw for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9680780F21
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1D51188EAB; Fri, 10 Sep 2021 21:32:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 23:00:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcfc5df394cfdfb20bfc3f14e887e5462b8909f4
X-Git-Newrev: 6c5d4a3ba2dd240e5049a8991f0b0bb47249f81e
X-Patchwork-Hint: ignore
Message-Id: <20210910213231.1D51188EAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-bayer2rgb-neon:
 enable for BR2_aarch64
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
Content-Type: multipart/mixed; boundary="===============8934489991176209002=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============8934489991176209002==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6c5d4a3ba2dd240e5049a8991f0b0bb47249f81e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
index d3eec30c7a..570300a304 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
@@ -1,6 +1,6 @@
 menuconfig BR2_PACKAGE_GST1_PLUGINS_BAYER2RGB_NEON
 	bool "gst1-plugins-bayer2rgb-neon"
-	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON # bayer2rgb-neon
+	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64 # bayer2rgb-neon
 	depends on !BR2_STATIC_LIBS # bayer2rgb-neon
 	depends on BR2_INSTALL_LIBSTDCPP # bayer2rgb-neon
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # bayer2rgb-neon

--===============8934489991176209002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8934489991176209002==--
