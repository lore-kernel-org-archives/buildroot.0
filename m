Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1104AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 12:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C874086A;
	Sun, 20 Feb 2022 12:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnGxyzQsh5Gi; Sun, 20 Feb 2022 12:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C9740865;
	Sun, 20 Feb 2022 12:18:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDEBE1BF371
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 12:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACD4180BA2
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 12:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIZE9siLfERT for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 12:18:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8892180B87
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 12:18:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u1so22297496wrg.11
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 04:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rdi/mXNXWNUDAevXQgZFTM1zk1Iec0ilkhy/flirslE=;
 b=JlUHkkuBB1J8ACdPuJb2nzLILP9Ew/vueEmvpb1vRzF1np3TfeE28+tqGVxfunLTXU
 zqqEtXx+fZu2zRgbx3lbnwcOJ+Kxwj9487kmA2f2A4yVmainVQg9CF4dfXQvOP7QEo7l
 aVqgtPt6O6ZVWKgUqf8tQ6sN7u5QljCNLSHDYUgF2yvT6irjTw/fl2AULzBX51VtSIUe
 vG4nixvqX1fverKn3NhOyR43Hv+KheBObPzkQL5xt1PqsYGrJm3JU4WL4UV1yIE6fyFT
 neaOuOyradnDWFig+M0Oa/hkszI1EtrpqoNzqwPAzE54CVZz9ujRER9QDiWOBJ/dIiCj
 132w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rdi/mXNXWNUDAevXQgZFTM1zk1Iec0ilkhy/flirslE=;
 b=mgAoePrpfvdCvGi/fhKNeAqSNuova7svdbg9Xp7vmm7cQT+lxP2CIXmzZUQpvYHQx4
 u7m8tRwX+jEye0TvxmoCAvwEyXuc+GvrUZK607I+2BbbEkp1D+yz58S5zt/uoQLlAaa2
 WQ02XYu+fzJPwCmZiDIx74JRmkYNhqmDvF3+waQ3OeNSfxl4Ev5t3+KhvZoH9hlOsLLp
 ERgunsNrGl6Q0Fla2sTZNGvgxHkf+hSyaZ9cWWpxMkY6U6Q/UVxWnEczhn+qflyid+kE
 2duCbJth/nEeDgcpGXvCa5q1GY6gd+Nry87eBABtF4nGMuyRKhFYhbiZKo2BaJ1P9FFt
 eD/Q==
X-Gm-Message-State: AOAM532B+Z979vF9j80+4zUftBhhEp435POwLxQWB+wLtNbDPLRKvXBp
 Bb4ft8rSm2lkFYMcvrPZMtcjmWA0zXs=
X-Google-Smtp-Source: ABdhPJwTYyNhwAh2Ykk/MqpcRLsdALATeyyouLiL2htG2WL5LICNMSLRpX9SjCIZB7eXZ2DepkexHg==
X-Received: by 2002:a5d:45c4:0:b0:1e3:35b1:3e98 with SMTP id
 b4-20020a5d45c4000000b001e335b13e98mr12309764wrs.270.1645359511378; 
 Sun, 20 Feb 2022 04:18:31 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id a10sm19701397wri.74.2022.02.20.04.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 04:18:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 13:16:36 +0100
Message-Id: <20220220121637.200393-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/2] package/gdk-pixbuf: enable relocatable option
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
adwaita-icon-theme:

Can't load file: Unrecognized image file format

This failure is raised because the SVG library is not found by
gtk-encode-symbolic-svg. To find the SVG library,
gtk-encode-symbolic-svg depends on libgtk_pixbuf library which reads the
loaders.cache file using:
- a hardcoded path (which points to host-gdk-pixbuf per-package
  directory) if relocatable is disabled. The loaders.cache in this
  directory doesn't declare SVG support because it has not yet been
  updated by host-librsvg
- or a dynamic path corresponding to the binary location if relocatable
  is enabled.

So obviously, we need to set relocatable to true.

Fixes:
 - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Drop relocatable from target
 - Enhance commit message

 package/gdk-pixbuf/gdk-pixbuf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index cd30d450d5..b22e9568c9 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -26,6 +26,7 @@ HOST_GDK_PIXBUF_CONF_OPTS = \
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
