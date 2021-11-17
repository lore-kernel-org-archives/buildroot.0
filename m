Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B15C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:04:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D6061BFA
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3D6061BFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76ECD405CA;
	Wed, 17 Nov 2021 21:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppNqjsejv7Tf; Wed, 17 Nov 2021 21:04:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61E2D400EB;
	Wed, 17 Nov 2021 21:04:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EE761BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB8FA60A71
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvqD4uqUKvrv for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:03:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FE2A60A82
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:03:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 270528D4F7; Wed, 17 Nov 2021 20:59:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:00:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 86f46249b397d01e1ed9bd9df0885d0034de0722
X-Git-Newrev: 84e90ce45c34eb21596e4208510605ddb507419a
X-Patchwork-Hint: ignore
Message-Id: <20211117205932.270528D4F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wpewebkit: use lcms2
 for if available
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

commit: https://git.buildroot.net/buildroot/commit/?id=84e90ce45c34eb21596e4208510605ddb507419a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Make wpewebkit support color management if the lcms2 package
has been selected.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpewebkit/wpewebkit.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 606a1531c0..fbe87862a7 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -23,7 +23,6 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_ACCESSIBILITY=OFF \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_MINIBROWSER=OFF \
-	-DUSE_LCMS=OFF \
 	-DUSE_SOUP2=ON \
 	-DSILENCE_CROSS_COMPILATION_NOTICES=ON
 
@@ -67,6 +66,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=ON
+WPEWEBKIT_DEPENDENCIES += lcms2
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WOFF2),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
 WPEWEBKIT_DEPENDENCIES += woff2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
