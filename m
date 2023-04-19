Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08B4C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59046813B2;
	Wed, 19 Apr 2023 08:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59046813B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBLquUKCc5-o; Wed, 19 Apr 2023 08:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BF96813A1;
	Wed, 19 Apr 2023 08:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF96813A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A89F1C4323
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41457615EF
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41457615EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKlri6Ya_Q5V for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E18260AFF
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E18260AFF
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:52 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-329560b1994so10726575ab.3
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893112; x=1684485112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rjsv5niMT3dFSEb5cXUJ0Gs9C8wahz0LnIO+UWNjhmo=;
 b=RJFVYNd1TwFmaUFWD3X0XXP+U4NQ2J6lTFxu6QjwRXH9zpwaGN7i1JEcfVSWqKxEjH
 3fbny6p/H6pucoSWFQfYjINgXhyBnguR77VWsM5d0ToDEHLU662o3TtuGKi/5HS5ivgV
 42dDGWKp7fzAXhteLtVQQ2XKbPNo0u4U3aryuYMOcFlHqvJ3aDkQ97uxlAVCgvgQbWCm
 b2LvOv9W5eoUNmtfKrfC4NW3WqrbDraCuvmpwS7t6Bt6GCqDhfBfxAU9a+skii3pXyhS
 jq3FwNWi8m6ru9JVSDoLygXYujD/lqETm5CQzdP0eTwiUOlmEdlVI7KRmTn3VeaVwT1h
 0R/g==
X-Gm-Message-State: AAQBX9czzl3FwVJDENCC1FVm+lRv6yMS2Ps10ODBIbRz/eoMf+8Pk6jn
 /Yuh6Il/ecRqraFdeGOA8Gs0tTKkmJI=
X-Google-Smtp-Source: AKy350aJXbcvowiqUZ42eyNIhHNvLoxCFli2XBHsISo2KE4EAkc5EoTho5JwrdycvWJssZiUJkkk9Q==
X-Received: by 2002:a92:da4f:0:b0:328:7478:58aa with SMTP id
 p15-20020a92da4f000000b00328747858aamr14661612ilq.22.1681893111822; 
 Wed, 19 Apr 2023 01:31:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:38 -0600
Message-Id: <20230419083144.212921-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893112; x=1684485112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rjsv5niMT3dFSEb5cXUJ0Gs9C8wahz0LnIO+UWNjhmo=;
 b=mPN64gioorEEyW4d2+CE/pQ/l6xXSnDrBsrFymdkjrvXptW+mos0pW+FBGsAuLfOWL
 SYgDemJjTwctAbY6e94LzbDi1rrksiZcUxInRE6Z6KmJ8bMV/q1ZTSybR1r6t8jDNM4G
 IegRh3y03xBjW0MlTqN6lrPfAbFRRC3W4nL7uNucG1Ez58hEd17HCwJU6fm0h8UfKuHy
 b1WDck9m8f+eT92x6V5a4KOYzA1Ximm2xDOQEjIagcmsE46Bs0pMTRCLRAQio4iOYY5l
 rW1QbfnNW3Ci5V4huMwuAChTM27LtVhVk8/pVkSo3AX0C6gnPb1tH5NungmXwh/N4i9d
 bztw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mPN64gio
Subject: [Buildroot] [PATCH 06/12] package/gst1-devtools: bump version to
 1.22.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index 46480445ab..4abdd6ece4 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.0.tar.xz.sha256sum
-sha256  4d21fee5c15f2877c0b1f6c2da0cdba67ce7caab2c199ab27e91a1394d5ba195  gst-devtools-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.2.tar.xz.sha256sum
+sha256  eb62726d3e27a8782369a24fd6364a8885ed2462b3bbdab091dffc8139ee06d8  gst-devtools-1.22.2.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 8fd3321d9e..7801f9b62c 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.22.0
+GST1_DEVTOOLS_VERSION = 1.22.2
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
