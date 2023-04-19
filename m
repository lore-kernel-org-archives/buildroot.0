Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE33C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0A8184005;
	Wed, 19 Apr 2023 08:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0A8184005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWLsT3aFWEa7; Wed, 19 Apr 2023 08:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E852584017;
	Wed, 19 Apr 2023 08:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E852584017
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 328571C432D
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B8B0615F2
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B8B0615F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Db2wQWI6qTT for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D1B615EF
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19D1B615EF
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:53 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7606d44e074so80813939f.1
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893113; x=1684485113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytLWmlrrNYpdYN0OTunGoZnpcuvtat4jSeujQle86Bg=;
 b=ViTJT2uF6VzUyvn0N8uR78Fzp5t3dL0+Srl3cFRSCtQm0mDbuJjL86EUOOWxFQ4+fP
 JLYsp2QnU0QVU5oBJ7x5FWxIxW1poFHORqcojDefXPWsn2zp7U49yxOItMsUdsI493pX
 NIC5LfhpfWB+pJHsv7JysRQs5WUpfjWn9JDpkNkuHKXZKvqfFiKsUwlywEbqmNR4sO+Q
 USDH/mAXoP0O6PMCKBQxadKEltBBEYrA/52g4dMJRP6aYIdDm+i+frrt60c6nFzYbzya
 XzNJIgEHitYSEOJ9Ztbwtx+SWT2foFxd9vff3A8bzRkYGqMvmZABprXSDzJARm50nEG+
 Nt8w==
X-Gm-Message-State: AAQBX9f60IHRV2zQ4zRCTD5Igv1ad13WpJxgcg0IYyc4CZgi2oEaOzFC
 Vt/YFrG6cY63Jqsz2m4HGmcTKepxZy0=
X-Google-Smtp-Source: AKy350atDbxEhV/lHGKGERNB0YN07mzqe+/er++Tv6ZccHzYNmxLzKazOFnznsjkZZOuqV0XesSqBQ==
X-Received: by 2002:a6b:7317:0:b0:763:5ead:f20d with SMTP id
 e23-20020a6b7317000000b007635eadf20dmr3962683ioh.16.1681893112907; 
 Wed, 19 Apr 2023 01:31:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:40 -0600
Message-Id: <20230419083144.212921-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893113; x=1684485113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytLWmlrrNYpdYN0OTunGoZnpcuvtat4jSeujQle86Bg=;
 b=iQJYCjGqroQ6kkceh7ZDalR8vM8XvrN2djsr2c4i2jFD6UMItdlnVrQ/FsJrSHJIv2
 MEZn/I8beWAwyjQvO+EP8e5qV9p5tCii7auHHz1TEH8oe2npQL6++H4bCW28xBIuSjT/
 lOMOg4Ho8fofnKwZTlHRCFe2hKwtERJ04ZQbTN8qjNIS6WqtGJZdXxd2mqpMyV45Uvi+
 QyjomVhLh0MEnu4tresFB4pfQLfTG+UV7kHQ+bgmFIO8hSB8PFfPEy9UjE7wUwIA/d3W
 qfDgfyrHgoSQHxXhKKOVlW/skTPjpuFRI21+v5RCVs17M6pjZmac6HNmGC7/ZFboHPGP
 r7tQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iQJYCjGq
Subject: [Buildroot] [PATCH 08/12] package/gst1-vaapi: bump version to 1.22.2
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
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 6dec625c93..2fdec4e83f 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.0.tar.xz.sha256sum
-sha256  593ccad19f88e5fa29f40f98356c007806bd535828707b1406944d16a90bdff5  gstreamer-vaapi-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.2.tar.xz.sha256sum
+sha256  d2e642f9745f97d9f73a7f5085e7659a9a31fe209b774e6e45dae041b435df06  gstreamer-vaapi-1.22.2.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 9533cdf2b6..cae239094a 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.22.0
+GST1_VAAPI_VERSION = 1.22.2
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
