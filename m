Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC06C74A5B
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 06:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE1B40020;
	Tue, 21 Mar 2023 06:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EE1B40020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdvdHjWViEKk; Tue, 21 Mar 2023 06:07:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2165C400C2;
	Tue, 21 Mar 2023 06:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2165C400C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE0D1BF398
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 06:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56714802CC
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 06:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56714802CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oafqGXmoUBjS for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 06:07:03 +0000 (UTC)
X-Greylist: delayed 00:05:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A32980897
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A32980897
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 06:07:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.121]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MAfYw-1pl7qO3IOe-00B1kR; Tue, 21 Mar 2023 07:01:49 +0100
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 07:01:20 +0100
Message-Id: <20230321060120.175812-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:IK4UUSLOQFLuxAEHN7C1tt566y1PCoPRD1IUDFYy/bwbtyVsRCz
 cp6geNweKi/rHNDj+iu+T3IeRiqhZZK30+UYEnAhX0MmNqzw5cAiMTq+hEgwImKOEBMBLzR
 bPdblQ5dOGxZ9viI/Whd3FgC1MWJuknGWCxJARS2spXMHWG/qLkb5R+FjJzILs545SyalYI
 ThbYFYRYr5c6ndK500Gdg==
UI-OutboundReport: notjunk:1;M01:P0:pdOPE6vOuUY=;rYMixB1rYEe2dZyCatFr7v6ayzQ
 +89TrjcvfWWXoI8YGU5JUaeM7t192rJkVx3/rkkakvp7Fhw5VnamJZA3CGeliLbO4KYMUFu++
 U7mFI1FRKlre3TH4gwLDFuLutC18YwOlyEWBGHdY/NpY4A5U0MJhH8Pbn7wPFCau4TDIRwelw
 OVLmaAW+WVR6IG6TxQYm4lXg++d9f4/s0RlqJQxtnGOuaDE+8th/tCGDadtE4sSBC4RNbwdwr
 GC4BAogGRVszerANTIbW6aqcL9g6SLlfcTVL9na+NL9vOp5mcAKR7sqgavQGOWZ5xnunn3CoD
 SrXQx4TdDhnseECMK3R66jVAQPoxqmKMuiFH8e/LS0E4UzUgSW6huuEG8X343FT4055IZxQrQ
 1YxZ2tFnXNC2/jJhpoRQpLmEju6wWhnXSwx+bd+YMTm9HMTeq3IL7EnLAqXq+jdiMhEpFm0ub
 osHEJ8DMijOQ51KiSGP2xKzM7DUc4YIEnN9u2sOmu5j3xo1cFD3Pc3oWslJ1UdiXisaPI5w1E
 hwDq03Ay9EbJFOAK++yLwUhTEg/R0K6+cDZXFIkkBPVWPZ6uBSPTFzPTWseJvssF+lgn3hWVY
 7WXVK9douPdqWrTMtV8d8FBNblxeFLKYhuGPO40/6p04jVCFJWCKiua0IdlD59Ho19pR5TCay
 Kf5f0qPmryn1IvRx+iZQui0nEp+xOHzcy79e0qoTvgL0KYDHnrpeXyWirV1rnMVaDAu76lGQF
 wiqpDSMrW6m/B3urXHTRy6RWKS+JWls2r2NyjYp4mbp6r8gSeAOmRtNgKR2686bzryKP1T+7X
 O84wyTKzPbBOct6FtvmGeAO+qE67p+McQcLVZ8hj1YxgO0HvbPCPBrHgU0UVGDfgsrVSh8X0z
 f+SM3U27/Eu6SFWdyIp9JLwGVk7zAXojwq5/aJpOcul6Nq4JbUS0GNv73Hn3oCP82WiEGYi0U
 Jg/3LSESEd7TIOkfQiJEVxLto14=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1679378820; i=dalang@gmx.at;
 bh=vJtmcW+yA9th9SoL5+zQ8BQuTwvnVfofn/4qMsr/C2U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=boECRecBI8MkiET6mXs8Bs1ZXNM6bly3PKbdHzaz3KBS9CSX0kYRvzjOYlxf2wSCy
 plmwn9u/0QtMwdsnysy/NUDgl3o2d3AyElM0qwCwkDeyfVkMq8/qhiVZ424VpSP7X1
 DEWmpe5Aei9z6Vanf57gLmvjrgReaE2btX/zFjLodZvkxNpDb+Icf0XmUAjhDYWvWH
 UtkEZOPfwCfcmU09TbwBw6U9DcF+W1TIOLFLwN+j03EPEOUSHG3lXcur/vbSDBi1BW
 INSzxz+BBCwy/rY5r5lGAFUKQF3H6Tj1y9a/gkr3XV3jWYNTLOg03zp+yeLrti5F7P
 33hKtC2NYxAZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=boECRecB
Subject: [Buildroot] [PATCH] package/atkmm: bump to version 2.36.2
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/atkmm/atkmm.hash | 4 ++--
 package/atkmm/atkmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
index 9e2bb2830c..08cf86b3df 100644
--- a/package/atkmm/atkmm.hash
+++ b/package/atkmm/atkmm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.1.sha256sum
-sha256  e11324bfed1b6e330a02db25cecc145dca03fb0dff47f0710c85e317687da458  atkmm-2.36.1.tar.xz
+# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.2.sha256sum
+sha256  6f62dd99f746985e573605937577ccfc944368f606a71ca46342d70e1cdae079  atkmm-2.36.2.tar.xz
 # locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 7ceb87b047..8afd058643 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATKMM_VERSION_MAJOR = 2.36
-ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).1
+ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
 ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
 ATKMM_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
