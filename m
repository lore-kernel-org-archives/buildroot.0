Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C7DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C89C6115B
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C89C6115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BB6E60AE4;
	Wed,  3 Nov 2021 20:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WOWpYfjZJcF; Wed,  3 Nov 2021 20:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE5060B0C;
	Wed,  3 Nov 2021 20:57:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD7761BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BA9440393
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtBqeP03U_sF for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:56:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8967400DF
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:56:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1322E8A3B7; Wed,  3 Nov 2021 20:52:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 20:48:57 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 628ab4907e79378fafa165869dc214a5fb4f285d
X-Git-Newrev: 8250c713f06b4597cece176b69bf63aca28ffb47
X-Patchwork-Hint: ignore
Message-Id: <20211103205252.1322E8A3B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/gstreamer1/gst1-vaapi: fix tests config option
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

commit: https://git.buildroot.net/buildroot/commit/?id=8250c713f06b4597cece176b69bf63aca28ffb47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes:
output/build/gst1-vaapi-1.18.5/meson.build:1:0: ERROR: Unknown options: "test"

(WARNING for now, but will be an error in meson 0.60.0).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d352ae712198799012acd2176214fbe62e2383a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 497c6df0d3..9810b12cf7 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -24,7 +24,7 @@ GST1_VAAPI_CONF_OPTS += \
 	-Dwith_wayland=no \
 	-Dwith_egl=no \
 	-Dexamples=disabled \
-	-Dtest=disabled \
+	-Dtests=disabled \
 	-Ddoc=disabled
 
 ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
