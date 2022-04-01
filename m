Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52549C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 20:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CED60EEE;
	Fri,  1 Apr 2022 20:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVEpIflj_wAQ; Fri,  1 Apr 2022 20:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15A4E60DED;
	Fri,  1 Apr 2022 20:46:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 949871C1189
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 20:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83C634016B
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 20:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMEtTBKz90lw for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 20:46:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 807124012D
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 20:46:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r83-20020a1c4456000000b0038ccb70e239so438704wma.3
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=90hJ7Y5vREPpyryIRsYLSYd9cTDzw9ZKr7tJ74umbZo=;
 b=k/5jOtCrdl6JozV0+xpXHz8UcL5gOCS+2+Z1yrohGYSo3vF3dXFW6dXyF6OSd7PnSJ
 n9C1dgimbs/n27rS5Jp48x8j0pkzZ2myRG+bAhDXUrBm+Ep/VajduG8fxOsslogvqHrq
 5XXh9I7e6FtyVXzzN2l9+c29j7iK/mleV4qcsiTaqKLIKqG2GWQQlx9Fk+/uCMJNiVin
 SReQNRcgWbGjt8Bfv6pO4hDC0P7C6aq0pp1xuXjcSROBw0JXAu2fp7FY1LgmYcfOMWj5
 L8SdjoV95xkI3nqsFAW81DXCjiN6cpsUvgIaHAleuQqwdpAUIGLZAgLGYBgx8jZ/ABun
 PbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=90hJ7Y5vREPpyryIRsYLSYd9cTDzw9ZKr7tJ74umbZo=;
 b=WBVGNSRuPjKCb6ReZA/IFxYNWjuz82WiBMh9e57l8vJgs8QonNdJmqSQZdFkdeHb4R
 cxxyn6fjVs1DCeLqhAY3duwbbzv+mEPjMsO1ekpjWXrNU/kypHdBYPGyMfecIaGTBtKz
 xAh9l9HO8zKdaGSygTNB9s6cMjgLF9eMidB1MsDx1m5Vh35xKBWo3PtEGtbBvNugZaYQ
 7eLp7V/Ph9SSV++lCrkvStv+ypA8vTr80z72RGIg+mq+JQzlPom0cczaefetGHmnF8lF
 R9isjMLouZrKj59FbKbIbWyW6ER63/dpp+m8W2K3JmZo7MlNzZknlZ/HJpFfEhfeGLRy
 oIpQ==
X-Gm-Message-State: AOAM5316/L2yutr/e6LphS2e1xp0sTk+4aCeZsaNFlCrvVHJLtFbY/me
 V76uaNp/w9dxr3CyEZOn6fvDWSjOGt4=
X-Google-Smtp-Source: ABdhPJxpS01dTUqbwoO8V7Bk+HwdnpOyRxe64+sv55AMrhqaHog4J67LQsjO52UB8O54c2YiVXOf9Q==
X-Received: by 2002:a1c:2744:0:b0:382:a9b7:1c8a with SMTP id
 n65-20020a1c2744000000b00382a9b71c8amr9865988wmn.187.1648845959006; 
 Fri, 01 Apr 2022 13:45:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a05600c511d00b0038e3532b23csm2676920wms.15.2022.04.01.13.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 13:45:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 22:44:11 +0200
Message-Id: <20220401204411.942428-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcap-ng: bump to version 0.8.3
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

https://github.com/stevegrubb/libcap-ng/blob/v0.8.3/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index f775ae6fc9..d4590dd739 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9  libcap-ng-0.8.2.tar.gz
+sha256  bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d  libcap-ng-0.8.3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 4fb0cf4777..46f72c702e 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.8.2
+LIBCAP_NG_VERSION = 0.8.3
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
