Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7482C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F5DD408CF;
	Tue,  8 Feb 2022 21:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kIeLsY6vBUEW; Tue,  8 Feb 2022 21:24:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D68B405C1;
	Tue,  8 Feb 2022 21:24:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DAC11BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AECB408DF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjoBlYoME7JX for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0F424024D
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355448;
 bh=JFvIto7VnGWafrb2Sjv3BmUIM39/z3/eW8HmfwsNOfw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YPCcM8xkfd61S69HfT0byvqcjQ9JB8b9Y7oCRvZTk8WblDzYI2W4rmUirEkaEXUK3
 4aI4Sqtn92QJE/ouvsu2jhseOcan+WUFS+pI9J7m4PWFbkCf0Sr2MHei4AqXjEtecn
 G0kPUwo+1h4MpG9z3syi4tXZ0scc8QBB2nLaLv/4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUrx-1oEz8j0bcH-00xtdc; Tue, 08
 Feb 2022 22:24:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:24:00 +0100
Message-Id: <20220208212405.19243-9-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:QlNEESky7ebgxJFRc30gSoW1HDT2wrnK1Eg7uyt0B4kUpwwebMg
 7bi72n1X1+Yb0aSWu0HcvH7oCWNZJPKxgr19jmzw27MtVHRGzxuPrHnLKbID5D/2jcClRHz
 j/Ap+JzlrUq1bAB21nUD/zInMA6ATlh+eeXhYd7Xg2bdaS75+EwFJEQ2S5En4ufggayLPSD
 JIkn68p3NLuOJrXJONwfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MqGM0oWq+N4=:vh7EegahifY4kzFVPIDHfD
 aTiFBaI7Ys5lLmc41ZRbW9FGu2RQEMxOr9t1SscxR6zsLg1cdYq83DA8/teaBK8bMYkGCDpr3
 5U9DOrJ8IOoHSJhdwnjz8jb2dW6ufEH7rmS2dAWTReZjjru6KwSIZJrb5H3fOjrmdvkLlYsSN
 IzIN18o0ROaJruwL3iX+HyFFCf+oA1J22WOlQxJ7a3xVOcN/ukgZTS68+nZGxESO4QrRmly4s
 xkL9ZO72ZV0Oa5W/ZIh/n1wVc5aIeuDzTkYFeIWbUBpcFxVgCJoWdL8R0J0qYgj6YM8NfNGOf
 eYcOcH1Dmgq4uo5q8JbSQZ1QnwIQyPEezvNovRPoS05JyKRqwNeQg0nAdvm+w1DrYSZGdkkp4
 Zzq0kJtz6j9KvzqsVdmneUemGc64RXZFRjSKjcKcUpPsCVNwknHrsP2zhxOMnqMbXFIxnZKRk
 lp3cBRebCbloiTbif4u+zCe3vCwmzXG188kPQpIWFY185wpkO5GQjdYnpzXZ1thUXkgrId8WR
 ougp1RAe+TImXffxcujB4EY1D76iBrbioMLH+r7BYru+QV1Utpw9Q6ng5R0CvGTfTaW1p0KfO
 oxaSL9AzHD4rlUL1jh4GTKtCGJHa52yF233XyCRVPX2ZKcNCnQMhPI7ZeVbZDoh+bxIs0zx3i
 3aObdgDM9w2xJoMoDNCUKzYchrM9QXxAEdvJM/TkDNpvPYfrjrAhGlS044pem0GUfb5mhQtph
 kNS6aWIq6jfVzOdrryjg288yWp+v2sTTJ10xsTQEFyRkLa+jJ6BbwqBz3hmcqFuJsWNAwVvqf
 LG1kOTrwUbRNdECALE07mkBeCCLjDmPo3b7RE3k4ZPAtgvgNSP/tSMbzkInBp/N8VCAh7W14G
 xjiMoDCgtlvBz5lf7uXg1UBPHchI70nOzoiCuiEExfKnJGKc3xewLkyxG3ILBWfAZBLF4hPNC
 xQMo4SedrHq4sfWZIJZdAVCRZRy7+/UqCbAwIsiwX8kj16Gj3gyXID0Q0wxo+6/X/C3SO8k/e
 lQ4Y4Wc4VedmoogQ2RZoCsSQ36gn9nvtx2HF/6q+XwMHTP1PsYDBNZY1Qdlt2nz7xLP6cuGgx
 jb7S7/rwprF2HI=
Subject: [Buildroot] [PATCH v1 08/13] package/gst1-vaapi: bump version to
 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 7e22774c11..b32d91e1e2 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.6.tar.xz.sha256sum
-sha256  ab6270f1e5e4546fbe6f5ea246d86ca3d196282eb863d46e6cdcc96f867449e0  gstreamer-vaapi-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.0.tar.xz.sha256sum
+sha256  f79a47346dfd5e585e063e77078e5fc498b06dee895bfcbf47d8863fcac9ea32  gstreamer-vaapi-1.20.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 6af851602f..19ee625703 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.18.6
+GST1_VAAPI_VERSION = 1.20.0
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
