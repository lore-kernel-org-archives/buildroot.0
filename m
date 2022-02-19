Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8E1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 12:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E78682419;
	Sat, 19 Feb 2022 12:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9kATIEigXVw; Sat, 19 Feb 2022 12:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C71823F6;
	Sat, 19 Feb 2022 12:25:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6CFD1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 12:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE632401FB
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 12:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkybNIC7fI1l for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 12:25:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81E1740128
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 12:25:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so10461431wml.0
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 04:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hDyFo0SncykJB3fLhryeMge7bmNb3ywCv2ghaXxPJwI=;
 b=j2RH7RSLpV7Z3UPgahu+QXngVdIbXLBwPjO2AS8ybNRbvjfaUjr6nQsVRv3rqS52ob
 4TtL5C+birKcuKlhh9Eptpj+sLaCd4f4eAoSoQPkQcajma7dvbaW80zo7Uw3+w3yKLuR
 iiwC92eiEcb7IeL3ez2ArwHObnc8U857ocuQ6aWB8hgdKmsWrmZxJ5Epp5Y+VOxl2XVn
 NenEBvoBsncnhNNa2cRbBh7lkLnMjSXwXxJcmOwP4QjBGBSYujOHTTnHSHbml1u9mtBv
 afq9vr4biLw/WKKeiSmc8uIixqgZgUM5E4jgR/tNFPqCw2O2j31/QP8T3IWUPNB7sdTE
 3/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hDyFo0SncykJB3fLhryeMge7bmNb3ywCv2ghaXxPJwI=;
 b=Ji3WoRHhTU8shRM/NPuxobOMz9UXbVQCH/k5oN3A2Gc2gfCeODbysyOjQ9n9A9a5Ju
 9Z4gEMO2BYlc6QSVMdv5mK9UPmfcwvkt0ZGjwUYmNvSrvp4yN3dNgHPtnNHL8ZfgsQkd
 rUc5BL7Tr2GcOAOl/LwcTZfNOZX0zI2IBa+PxUrtLKigmWCsJMdGlkyB+w52ls3EqqzM
 d5ApXtIt3LYwjO5cd97La/wjRKhB+VuYrOt9E2L/SRRcUJYJpqnahgghbz2VBLG3Z/iY
 soxASURcWu3KfSGTFPzuA3cAY3Nkepy3QqNBiV6tg9OUBzRFstqAwbto4BQfuA6Smg4O
 yo8g==
X-Gm-Message-State: AOAM533CXPgiLVrxHiS14tBQlW3hNeRXV6kIOV3HBrKzb0RmLCpe1C3u
 a/D79ADWXUrRuUpjCSytypCekCBvdoE=
X-Google-Smtp-Source: ABdhPJxTWeSsHiXqW5AsWCyR+hHgqZDP+rRb8SOyKO7f5RmVWy+LUmwYZUQQQc3LFYGX1mdupyYV2A==
X-Received: by 2002:a05:600c:1993:b0:37b:f193:a6e2 with SMTP id
 t19-20020a05600c199300b0037bf193a6e2mr10812251wmq.68.1645273534370; 
 Sat, 19 Feb 2022 04:25:34 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id a9sm27155609wrr.20.2022.02.19.04.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 04:25:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 13:25:25 +0100
Message-Id: <20220219122526.2954354-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/gdk-pixbuf: enable relocatable
 option
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

Enable relocatable option to fix the following PPD build failure of
adwaita-icon-theme raised since commit
b06294e9897e90862656416e8b67fdace15488d7 which now correctly updates
loaders.cache:

Can't load file: Unrecognized image file format

Fixes:
 - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index cd30d450d5..7b9c9cdbda 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -20,12 +20,14 @@ HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
 GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
 	-Dinstalled_tests=false \
+	-Drelocatable=true \
 	-Dman=false
 
 HOST_GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
 	-Dinstalled_tests=false \
 	-Dintrospection=disabled \
+	-Drelocatable=true \
 	-Dman=false
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
