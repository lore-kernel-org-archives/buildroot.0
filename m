Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1965BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 21:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C9860B67;
	Fri, 11 Feb 2022 21:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c71Y1CJOFlhl; Fri, 11 Feb 2022 21:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC6EF60B4C;
	Fri, 11 Feb 2022 21:11:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 190E41BF343
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 21:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 073B183E6A
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 21:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFP0YLbxe59W for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 21:11:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1301783E69
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 21:11:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j26so6387802wrb.7
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 13:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6exB7Z22Rb1WVpE0tyVAFxUzefmozNe2V49kK0GiPGY=;
 b=Avx/1KB8tR9RtooUQ5DiLyWcOwvZRVyhKQsdm9ybMZzFgvk08jF8t6qaOaB6oDz+cl
 ScoOIINHFpjfLtmm3vo/50MVwotM0GjCSyY4lGVIZ5IORlmagyoKzYrV7TIeEmQi0nLM
 ji4mFKQwJuc8Zy6sSBz1ErlySEcXiHTbp89zVJ6BUtE4ulZO/LD4JuUqEc4mT0FaSIXt
 LX75ZgWkKUo8cPK3BYZzTM8hmPAc+1voh0/lleVdm5+CSwo85/+0x19a1mXX6QyJQE4g
 sOGduMv1nulpqDWCSY0nP+vNJlvky6vJWc0EPYGcqm+r1oAnBvhdxW5F8qp1Xyh/GGzF
 gsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6exB7Z22Rb1WVpE0tyVAFxUzefmozNe2V49kK0GiPGY=;
 b=VCjBMsaDt1ek5srkoRLPF1923VM/XGax/U/SHbjBSFb61M/0mipJ3k39kTzxjdigYc
 JAX62BTGmoKnhO3wkvZEfboSRG5SKI543975uB6ewh4BoWQCY8LU3wcR6orVKbgMMB5A
 qO6qsCWuPBHR371lhdyRN+2vvu1ckn2wnvmAlZ6GSbY3UsfKc/dANPnFEo3dotT8gSz3
 S6ft66g8vBhgk/HKF6ablhXqTiMclvfiuWHKiUo7d8gkEUDi12AbyBWOjgaQWbHpmyxY
 AJmJiBw6UDFgKRdr1BydofOqTe8GyAknxUualLbf4w/LudR9c0bp3wz4aXzyVD/ULLWe
 QIOw==
X-Gm-Message-State: AOAM5330pCSLeyavvHCoop0tVDcq8ymr90TDCnxTZgkSRuKeHLIpWeog
 UM4TnyORcB7LNQEGjzlv51Ucr0wf3e0=
X-Google-Smtp-Source: ABdhPJztjgxdl5VzM5ZZIc4rk/FFWwQ8bAgnNs6sfUaTEZYeUnseEsfwWDiRNeKobGPoErhQaZulGg==
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr2648469wrd.376.1644613903978; 
 Fri, 11 Feb 2022 13:11:43 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id y3sm24462140wry.109.2022.02.11.13.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 13:11:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 22:12:07 +0100
Message-Id: <20220211211207.762485-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-base: fix
 build with gcc 4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 1.20.0 in commit 801131157dcef2c97e947a1d3e8c9bfa7aa3d870:

../gst-libs/gst/video/video-converter.c: In function 'convert_I420_v210':
../gst-libs/gst/video/video-converter.c:3771:7: error: 'for' loop initial declarations are only allowed in C99 mode
       for (int j = width * 4 - 1; j >= 0; j--) {
       ^

Fixes:
 - http://autobuild.buildroot.org/results/c4b1449f35debcbabff7e42abe239695d4ad4d21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 68281738fa..08aac850cd 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -11,6 +11,8 @@ GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING
 GST1_PLUGINS_BASE_LICENSE = LGPL-2.1+
 
+GST1_PLUGINS_BASE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+
 GST1_PLUGINS_BASE_CONF_OPTS = \
 	-Dexamples=disabled \
 	-Dtests=disabled \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
