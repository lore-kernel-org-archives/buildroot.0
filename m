Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498D5C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F80822D5;
	Mon, 20 Feb 2023 20:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F80822D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psafQOEEMa2K; Mon, 20 Feb 2023 20:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11430822DD;
	Mon, 20 Feb 2023 20:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11430822DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3006D1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 091FF6100B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 091FF6100B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNNk7ak7R5AK for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 305DA60E63
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 305DA60E63
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F02B86489; Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:50:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92c4589b904cfbc4cd633a92729ecd98a50851ff
X-Git-Newrev: 13b05a9b00bb1eeacefafe7b2a3537988a53dcea
X-Patchwork-Hint: ignore
Message-Id: <20230220205040.1F02B86489@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjxl: disable benchmark and tests
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=13b05a9b00bb1eeacefafe7b2a3537988a53dcea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable benchmark and tests which are enabled by default since the
addition of the package in commit
e648d399d8bd609697e78f13f7fa76be06d91a57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libjxl/libjxl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 1257928efd..b4dfbecf82 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -23,7 +23,9 @@ endif
 LIBJXL_CONF_OPTS = \
 	-DJPEGXL_BUNDLE_LIBPNG=OFF \
 	-DJPEGXL_BUNDLE_SKCMS=OFF \
+	-DJPEGXL_ENABLE_BENCHMARK=OFF \
 	-DJPEGXL_ENABLE_DOXYGEN=OFF \
+	-DJPEGXL_ENABLE_EXAMPLES=OFF \
 	-DJPEGXL_ENABLE_JNI=OFF \
 	-DJPEGXL_ENABLE_MANPAGES=OFF \
 	-DJPEGXL_ENABLE_OPENEXR=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
