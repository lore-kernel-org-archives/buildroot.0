Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0F8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 22:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6733460BA4;
	Tue, 15 Mar 2022 22:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDqx9btdbbFi; Tue, 15 Mar 2022 22:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8105460C30;
	Tue, 15 Mar 2022 22:11:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50A271BF422
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DC6560B79
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rn2W8fEAbtxt for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 22:11:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27BAF60B1A
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 22:11:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 19so252149wmy.3
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 15:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xWbG8DsgI2I1HJ0qoeDtGp0cM9F7Eh6noHGa1hhZrYA=;
 b=qXLVQSQ6HxGBI8NhBtnLySSsICeoxAd402lXFk35Kwe0qy5dRVTPofWh+tdruso9ZJ
 LSnxeovRdNFbWHyFQ6qe+/2ysLm6O9UOPyt1NlG3BHd0j9bag5OYD9wD+Sds1/pu8of1
 pDpDJFoa8eAaNos6kLjQCwWzB7+Es8Y0YH1ZcHEtRV0guHIY+HfQDgNpn7aYS1umYXzW
 cgnFPW5tRXRywBz+pVwt48TNyx0Vr4IoBmvZ0RiSxkpQFMpOUGiy2l2U8D2AsxahFkSE
 LwH10OIiNJw9PuFBjhewByA59JVY41gNr0mGGWLNCA8wNBnCgBn0avfETY6452bL3x2o
 6Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xWbG8DsgI2I1HJ0qoeDtGp0cM9F7Eh6noHGa1hhZrYA=;
 b=XXR84MebcTpW9AbwN0oPCaLuG2qt24wBo+FLvHKMtGVlr4lZwOsprvwmhrycDl/IN0
 3atfV7WfJpXas6h04YvT3zR/EpJTUJKqQaug6SALSVZXWaj+vl1SexW4kGXcCMsYF3/4
 wikuK7lnTwUPSdhteHagyrRaqfcqmpQRdg3cGl0mOy2ZHGe4i2Q8ZHG11HFQxfBF80Kd
 s25LPfVnkHTTDv7mfy2xnF1PttOz7GvIrNvjaX9VDlbEgC5gewCBswg9D6tkJCSMz7OH
 gkF+lo+eHMWveOa5SfzOm/E6mXoAZq6HsXV/vQo+6dWFiwQ9I4EGo0DWCG/ylyYrhvx6
 F5OQ==
X-Gm-Message-State: AOAM533fQiHlzk2GVyhrAhErH5Kw1npODfduqtNr5wrTOYDwOX77MbDL
 QIwg5TOy2B+tzg6mgygV+Y3wNHhMVv8=
X-Google-Smtp-Source: ABdhPJx7RBnctk7evIppcVA/OUE7Qx7WYA/joYt9r5moVDVY81F8DsfJMcbiQp/1HtZlRa2uGg/e+g==
X-Received: by 2002:a05:600c:2056:b0:389:736a:5631 with SMTP id
 p22-20020a05600c205600b00389736a5631mr5069235wmg.120.1647382268226; 
 Tue, 15 Mar 2022 15:11:08 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b001edb61b2687sm202338wrt.63.2022.03.15.15.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 15:11:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 23:10:11 +0100
Message-Id: <20220315221011.2440571-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dav1d: use official tarball
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dav1d/dav1d.hash | 3 ++-
 package/dav1d/dav1d.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index b0f163bae7..5e838b0951 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,4 @@
+# From http://download.videolan.org/pub/videolan/dav1d/0.9.2/dav1d-0.9.2.tar.xz.sha256
+sha256  e3235ab6c43c0135b0db1d131e1923fad4c84db9d85683e30b91b33a52d61c71  dav1d-0.9.2.tar.xz
 # Locally computed
-sha256  0d198c4fe63fe7f0395b1b17de75b21c8c4508cd3204996229355759efa30ef8  dav1d-0.9.2.tar.bz2
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index d7224625c8..ecc4cc55c3 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 DAV1D_VERSION = 0.9.2
-DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
-DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
+DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
+DAV1D_SITE = http://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
 DAV1D_LICENSE_FILES = COPYING
 DAV1D_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
