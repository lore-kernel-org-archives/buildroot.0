Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA84C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C882F613FE;
	Fri, 22 Apr 2022 22:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cx5EaFpUstW; Fri, 22 Apr 2022 22:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF7EA61082;
	Fri, 22 Apr 2022 22:01:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD931BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BB1061082
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeQUDzNIgUGR for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:01:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F05960A81
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:01:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b19so12800975wrh.11
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPEOq5I6vD6RpnRQZ8c2zI55Lcj3O8hUMPzffB/OgLk=;
 b=LgLuzkplh1ry0Og8SOxX1b7xufB+6OY4qI4vZvImCs5Ney5dIsgZ9o3zaGGQAbz70r
 R0KWe7faTNy21MMq6SB10woJYsDuX5gyOd2rVX8DGL7tusx5EFnQIiAwHiEuVcyrBS4q
 rInflwvMQ1q2pkqb68G9ejeZtiD+le1z8WcMTprSJwVSPHCavFez57fV8vtUDNwbA9cA
 XlQu5hPmCut/vWjqk2poW2QRSuhXW/iw7n0XPViV2T+JEzJML4bb7+T8rRkYigD+AHeN
 FZrcI4RRq6f1fQs5JaC+N8eaB2rQePym/GAWhFgnd083Bs7sd+wBSU+oN6wYOKesiinO
 3HIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPEOq5I6vD6RpnRQZ8c2zI55Lcj3O8hUMPzffB/OgLk=;
 b=Ucd8CaJbTl7SgaMLnJi2BvMpb7tnHweAjdhcANbUc/6GT5qxtiFqJogCIXxqmqzS8x
 AYZSdxzwsabl6SazXDZXd+RZ/3osNGlsZv2GdL0I0YLByu9w8Mh2j2bVoXXUqU70mTKT
 vjTr3n+0MUQmeTDZNHoIkm0iAYz2lkEtxkURsphye8IOmiVT6+IGYVPvRGs0NG2RlfoL
 Ep7RPB1augL+lrsXbgaqvNTdxUdohW0nxavSAl06QIazs/oqsCg4evQdwAEvsEgfD/MF
 fXqg3I5aSHtWMq7RlFFU+UXPD/d4YcHscJ9NkLw7SQ+bTB+hnGRr55yMNROIFEUFy1vz
 J2ww==
X-Gm-Message-State: AOAM533oGtxJUZPG8AHY66IQsxx9S9U7JN58Sqc+YfNjqNnKScG2QY6J
 FhYNnRTVvJs1dtx2b5UQY++12WaTag8=
X-Google-Smtp-Source: ABdhPJyR9Man2WnGt2GzNvKmMfsx+4kKsrYUa8CsllKTpcCgQGwCQlaY0Mvh83wFwuWtw7cH1YPtEA==
X-Received: by 2002:a05:6000:156e:b0:20a:9665:ca9d with SMTP id
 14-20020a056000156e00b0020a9665ca9dmr5385998wrz.172.1650664886413; 
 Fri, 22 Apr 2022 15:01:26 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm2588919wrv.19.2022.04.22.15.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 15:01:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 23:59:31 +0200
Message-Id: <20220422215931.2712013-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-good: fix
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
version 1.20.0 in commit 34317969278d7b6d923d4889fb4235f112b2b201:

../ext/soup/gstsouploader.c: In function 'gst_soup_load_library':
../ext/soup/gstsouploader.c:219:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (guint i = 0; i < len; i++) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/21792a9839d9722815075569123df8747fc450e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 1168feb293..2b6cf769aa 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -10,6 +10,7 @@ GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
 GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
 
+GST1_PLUGINS_GOOD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_GOOD_CONF_OPTS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
