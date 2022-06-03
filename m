Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB8BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 05:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 170394194B;
	Fri,  3 Jun 2022 05:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igkv_t026Zog; Fri,  3 Jun 2022 05:01:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 046784192F;
	Fri,  3 Jun 2022 05:01:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EAEE1BF2CF
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 05:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89BB383FC7
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 05:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUh2nnmnDuf8 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 05:01:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B646E83F7A
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 05:01:33 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id f7so4962698ilr.5
 for <buildroot@buildroot.org>; Thu, 02 Jun 2022 22:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0K7i0kYNuDjEX280gD76acRq85cOYej1/vdfzSsaDIE=;
 b=jhDdaJxIfmbIeEn5ZKTjnoxDkcL+VKAw+6gcHqlm+Nd2UfORMUUHJi+/WQ9B+cRwrV
 daFEQkTvaEvVmzr9gNX3NmzhG/QdkremR4K6e0Fxmjf9uHRs8x6YGrPNCqONSwOM5Uw3
 yBJvOcYF1DWdtiu6lvLwvJ9qyruzBTjgfkbiE249YXO2alsPzr9faXnKnkmnjZ+5cBvi
 QwXIOMMI7VJvwA4AZQ+vtyyP4vAeMlgRPp4d/AyOq2mee8UAs+V3yfAX0cFz4j4pYwmp
 SI9rHoUijSo1c+0yhWyNkKRZCNlcwxVypqr+RctJysl48znO7YpngnH3j1TK/NDNwx3Y
 QcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0K7i0kYNuDjEX280gD76acRq85cOYej1/vdfzSsaDIE=;
 b=tA+HrIhL0Q08gBi8CigP0T08dDy0sJLxC+lo3hP0i4kjw9oDgnuNSXwVLt0ndkaXbu
 1mga7m2efAkELf1c8tzY9k1HE224vSEEoIdw8G426/gVbSPOQE1YxyGoinDUA9tBF+vN
 h0FBAWfp2vrtvb9yzurGaEP+dM5ISVpuWYwZB9nubKvn79uGDgOuQpF3QTjUejdi/ZlA
 /cbRTdpBNut+UtvZZn5jllRxmHpV6OeqsglD40kB3R/LGyBgWN26xZrjHaNGJ9qJXrtN
 sxyWCgT3CyqHU/63PM4SXp+CbRieKwoXi4PkdpB5ynWdT7iq9hnpTY50QrF+cXo9nUpr
 0G6A==
X-Gm-Message-State: AOAM533dJHOz5oKrPmpjtirYfHtjNWAGR6/J33ODN3Pue3/oniOHgXq0
 lu+0SPgtc8VxbFDEr+sd1BKqb82clQo=
X-Google-Smtp-Source: ABdhPJxe24nRMGz+bL1y6qm9a6PkY9TIp3kEeQGK3wxYO3/Wan8H/4HG8VUS0RpV/jiqJOwT3wl2UQ==
X-Received: by 2002:a05:6638:138f:b0:32e:dbe4:8ef4 with SMTP id
 w15-20020a056638138f00b0032edbe48ef4mr4619852jad.283.1654232492521; 
 Thu, 02 Jun 2022 22:01:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056e02104e00b002d3ef369c95sm1289119ilj.31.2022.06.02.22.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 22:01:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Jun 2022 23:01:30 -0600
Message-Id: <20220603050130.920429-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.62.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 2037c46bbc..33bd8b6eb9 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.62.1/meson-0.62.1.tar.gz.asc
-sha256  a0f5caa1e70da12d5e63aa6a9504273759b891af36c8d87de381a4ed1380e845  meson-0.62.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.62.2/meson-0.62.2.tar.gz.asc
+sha256  a7669e4c4110b06b743d57cc5d6432591a6677ef2402139fe4f3d42ac13380b0  meson-0.62.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 6d55f19402..8bc7848705 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.62.1
+MESON_VERSION = 0.62.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
