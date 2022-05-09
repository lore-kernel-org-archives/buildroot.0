Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDDFC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 01:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11FF281934;
	Mon,  9 May 2022 01:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixXqSAUSGjFa; Mon,  9 May 2022 01:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D3268188A;
	Mon,  9 May 2022 01:34:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0956E1BF387
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05CDB404A9
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pe2b46CNCCfa for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 01:34:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12D9740363
 for <buildroot@buildroot.org>; Mon,  9 May 2022 01:34:21 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id e3so13817964ios.6
 for <buildroot@buildroot.org>; Sun, 08 May 2022 18:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8gGdEUbf6JodN7nk3OFfBodq7LYNt2FP2ky6//TXXPA=;
 b=ngTOvcGlwqXa+klz05/gT2+9JkErWI7WjkNvgK36CK2PYPEXBG896JdXKcAaz6ZxAD
 M8mjIrIuP0HjdOYY9GObflxw+VEPi6+CjIsUqX8Ln3pi2YSjNbUz+BUUYn/qblU/STYc
 iGFMWXrMm1Y5fmsUbbcDi5J8zvhyzF/u6PloHtzEft9JMrstlzSEdZOcGLGIyh/7ePSF
 2qxOOPoPiXhdeRiiD4CRmhfSb9ZRUVgADZBnZ9dHG/qErtehCVRfSfOI7sDRCl61PIGL
 7iU+gb0h3kpvVmzULozTh6huvzTnW8gXUFcqf8VXbp1mL+9ddnURkx9luCG3dstndJS/
 1YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8gGdEUbf6JodN7nk3OFfBodq7LYNt2FP2ky6//TXXPA=;
 b=DreMxlVBKBe0AcOp0u7gla5j0sClnuB++Ablsv3NAW5HSYv5I7ZzKzKFacHeOprv7/
 7JGtdgjl2OBKqT0S1/zLu10raOCXZlONU8MICDMSV2zOIFf/5E8SPUKe7AzpehojKOnR
 RUKkdESd9g3tvahY0srMSLrth/Vj4EisqSOJsBhrh2VtKOFGUAOJxAIjP9LIL+jueOHE
 R8SdtbmDulGn3O2rc1Txa9tHE+Y8KHaX/GdtwYOijCsyDLpre3jq0h3YLmmUqSZRETkE
 0lWY09RIvg1zADGTc1X/5pMQMfBlFXqwx5c3w+6qSFoSYZGndXRmiXf/hxxkSI+uxyQw
 T7sg==
X-Gm-Message-State: AOAM530wXBK5m5rMIW5cT6liodAkKlsXUYH6I6Wa5UgeUnOWJVGiRjCv
 lZPRTLRpnFVl8XzI4Jv4G88gfZS5jdw=
X-Google-Smtp-Source: ABdhPJxc2wJr/IuIPIwOIHp08I1XJK3DNL25RbUGY1KYcUu/ImmcStvaGy23pU7RA5qg+6d520yvJg==
X-Received: by 2002:a05:6638:3792:b0:32b:5cd3:50cd with SMTP id
 w18-20020a056638379200b0032b5cd350cdmr5791203jal.118.1652060061048; 
 Sun, 08 May 2022 18:34:21 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 x26-20020a6bfe1a000000b0065a48a57f6dsm3193009ioh.40.2022.05.08.18.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 18:34:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 19:34:17 -0600
Message-Id: <20220509013417.1860755-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-gobject: bump to version
 3.42.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 100a05c74e..0c14efb1d4 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.0.sha256sum
-sha256  9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b  pygobject-3.42.0.tar.xz
+# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.1.sha256sum
+sha256  1f34b5f7624de35e44eb5a7eb428353285bd03004d55131a5f7f7fa9b90f3cc9  pygobject-3.42.1.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index b0a132d040..2fa7504d51 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_GOBJECT_VERSION_MAJOR = 3.42
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).1
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
 PYTHON_GOBJECT_SITE = https://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
