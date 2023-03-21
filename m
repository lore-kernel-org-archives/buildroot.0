Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F34C6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 20:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 214B6611E2;
	Tue, 21 Mar 2023 20:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 214B6611E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVfM7knPdYVj; Tue, 21 Mar 2023 20:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C2CE61127;
	Tue, 21 Mar 2023 20:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C2CE61127
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D45921BF357
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 20:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7E27416B5
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 20:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7E27416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rAUAEAJSz56 for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 20:12:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A71EA415DF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A71EA415DF
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 20:12:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.121]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N79yG-1qZ3UE2xTQ-017UVY; Tue, 21 Mar 2023 21:12:10 +0100
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 21:11:30 +0100
Message-Id: <20230321201133.236692-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:DSF8fS7IQYeDfrRhREg4K+flxqAxAcXvTqnyBefcLskue0RbnFU
 biQ42x3IoQAfbRBYeAVLi/OmGW3fb/ppb3UQGiU7ycV8ZfN60XqtwfBhLXBONrkyu8ygH8c
 QkwdALtY6PWDVdRcHds9gEdq+fJyWV/HaO/83nfz0D2P7JiGUl9I9tEBtpkKQexvUaEV+V3
 0p/0KO4NCKf5SUzuA5WXA==
UI-OutboundReport: notjunk:1;M01:P0:DDYcTA+4j3k=;1lOYUcDJ+SqvO9amoMymJma6xa/
 SSdiwh4U1vMhGxIyzvz3GO6nFxeLjsuvwfXOodEnSCZcn9wZ3lDrAqQxqpcfbj+9wIFOSvKuD
 gDF2cJO0yGX51jhkbdx2bQZrjZIgGmD4//d4tvGBPzCwPNRxDAhpvnmFPCsp94VhKrt+8mVTo
 AQD/jm74EeIWfwgQZuktBlDGV1JowYsxxMMAmAEYtttJnpv89D/ZM34CbkYVV07spo1tnk93g
 SumAVAyyvCJLrZw0ErrCSTGtzQPzCogFYoW/YH0Z9/lnu7Pfy3i7HbW+xH2GNdYTmpcWRE5nj
 ep+600hjvR+qUZWjVnBS+cT4ffRPrqZZyQo42mo/gUcsQprMOnYpcv0QI56FT0Yix1PrJ3Kf9
 qziDqW6nH9VyDZI/O7yjYLtG/zOLbHQSqtLPCpeX5cDdM4YzC4bldbH7ow4biirzT/v83EAlk
 0Fpf6Xu5ebAk2PHc89kpxFOqJA0MOGU9sCsVo6wgPZ/G2QK1CfsuyMcR3R17ND8wh4H5KijYD
 ynNtEXcNPkKN6mXjyOWnNI+IVR7VAuVFCvUVl+uWwdb/5CKFfwu9D9GLg0/WGdxmsrUJi7fxj
 P1J9qE9zHgbH2ZvXodXr7bp157HNJx+uAnpIsLXuMatRohxnbssPC7I3zChp7LCSyaDvxhjD9
 R7fkkrqNatYD8iRrSuCD5V4qy3AEKkLCTVeUb959NuCTHU2hQy72Xpgs0jmxQunxDpO3QWV6S
 CfQJ3V7fpW3bh0BpUmSIpdSzrcu1gHwZzkg3Uigu5QB4PjJATh7Zf6uWcDo9OYPIj2Y4tvOrS
 lbnYhLqP5KVWRhzXng+dWqyXEfqQoOLRMfFoS/t5iHBuzbJ48VHchjONB94Cy9j7iXRxUE7pS
 UzPVRJlH0j95mgPfErJu6LfRf631TaXCQWwwLTdicdwR0/f3nrRuC69R13mQpOMZYDBDgFSFb
 SIA27AicGgwWVdFc6VJwD3Y4iV0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1679429531; i=dalang@gmx.at;
 bh=AXn+0lZQ34NlmMe6JYZWIG/FRXBazlfTlGrsk6+nUo0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=JeRHmgjuU4OKxcWW4M/KFr9FhIsElxpEnLfTezpedzkKmiUrgBlEzSbDqcRtoj4qG
 7cm7PaGQLkcJynCqO2/vIdIBoGUvFP8wZxvaJ//uUuWZEduWfQ+ryZu/UbnVAqQSY0
 uy+5VFAmXk+qJw5R3coFEHgFsS/8toD8JJWZVSkETvmdK+J1xdx4vjjisn9H5AWiSZ
 QGLcqaAcLpeY3CNwCheKdrnjFZkV26hSmpRj1N0HOHRHhRRnoGsqog+D2XBcEdRgO3
 TKhtRrHKhDlFfy6l+aVJ+wGAmfgrHm0Z4G8/ngNIGrUBoWrafQ8LoQ0y60zHnMGB7I
 CPXbbdhsPQN/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=JeRHmgju
Subject: [Buildroot] [PATCH 1/3] package/cairomm1_14: use official website
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
Cc: Daniel Lang <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The website [1] states that the released version can be downloaded from
the cairo release area [2], which also features a sha1 hash.

[1]: https://www.cairographics.org/cairomm/
[2]: https://www.cairographics.org/releases/

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/cairomm1_14/Config.in        | 2 +-
 package/cairomm1_14/cairomm1_14.hash | 5 ++++-
 package/cairomm1_14/cairomm1_14.mk   | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/cairomm1_14/Config.in b/package/cairomm1_14/Config.in
index 6e767d2428..e369aa6f4a 100644
--- a/package/cairomm1_14/Config.in
+++ b/package/cairomm1_14/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_CAIROMM1_14
 	  This is the last version before the API and ABI change
 	  introduced in 1.16.0 which requires C++17.
 
-	  http://www.gtkmm.org/
+	  https://www.cairographics.org/cairomm/
 
 comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
diff --git a/package/cairomm1_14/cairomm1_14.hash b/package/cairomm1_14/cairomm1_14.hash
index 521e7cc546..6d58de360a 100644
--- a/package/cairomm1_14/cairomm1_14.hash
+++ b/package/cairomm1_14/cairomm1_14.hash
@@ -1,3 +1,6 @@
+# From https://www.cairographics.org/releases/cairomm-1.14.4.tar.xz.sha1
+sha1  a58419bb9792a2c998631704ce5671c38e0c82a1  cairomm-1.14.4.tar.xz
+
 # Locally computed
-sha256  ee12b920b2d47cea1b6e20c367690d726eb22b4ca9fc711db329d03adcc0c8e0  cairomm-1.14.4.tar.gz
+sha256  4749d25a2b2ef67cc0c014caaf5c87fa46792fc4b3ede186fb0fc932d2055158  cairomm-1.14.4.tar.xz
 sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm1_14/cairomm1_14.mk b/package/cairomm1_14/cairomm1_14.mk
index 5d076ddf0a..6502d34c5a 100644
--- a/package/cairomm1_14/cairomm1_14.mk
+++ b/package/cairomm1_14/cairomm1_14.mk
@@ -7,8 +7,8 @@
 CAIROMM1_14_VERSION = 1.14.4
 CAIROMM1_14_LICENSE = LGPL-2.0+
 CAIROMM1_14_LICENSE_FILES = COPYING
-CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.gz
-CAIROMM1_14_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM1_14_VERSION)
+CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.xz
+CAIROMM1_14_SITE = https://cairographics.org/releases
 CAIROMM1_14_INSTALL_STAGING = YES
 CAIROMM1_14_DEPENDENCIES = cairo libglib2 libsigc2 host-pkgconf
 CAIROMM1_14_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
