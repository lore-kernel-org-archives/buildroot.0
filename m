Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851EDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 05:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E676B83E88;
	Sat, 25 Dec 2021 05:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vor9Vjvy0XB; Sat, 25 Dec 2021 05:09:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C19383E81;
	Sat, 25 Dec 2021 05:09:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E77F11BF345
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 05:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D055B83E81
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 05:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tW-XjMtjVe4 for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 05:09:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA1C083E70
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 05:09:35 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so7908743pjf.3
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 21:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FmcUnv18kZBCHt68h0g3YxtplKhaEBNEZjZM5Uh4chw=;
 b=CTRAzW5C4nApoTqz6e2QEPcBYs/ENkx1a0Gu73f3yWNb8SltcWZSdK6ycivzRRNiPy
 N8ixb2HWKJt+v7iL3Mc6fd1Bwiihv3rrzDxoe0OPN23LaiABfr6UCJTGuUXeY/P/rPR8
 Wr1QRU+++9JPrPIeGTGfsFHupnDy4BBpbxzWNsiOClcQg15rVrgXUfUxvfkKDNH4coIk
 PmrkEP7f4ZMRCeH+FPviM9yPmWaOC2X8pL42UmzMY9MoT0lD7dn/lfgLCc26RIlJwVLZ
 hE9MVglGMuGA71Bm8O6Gc6s5Ib10n9hNAgQIDwsQSDQmPFkuYF/TljYIuQGpj9+pv3KM
 NdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FmcUnv18kZBCHt68h0g3YxtplKhaEBNEZjZM5Uh4chw=;
 b=zerPj5b17NElW4x2SFRPGQ8DaPgFh+8//AewQzvYj3hu4/mcMifP+wGDaw39yYa9II
 oPhb2Kf+qdDWEETBfvfzXNX89bhm35mhYz9i/aRW7U8T9Leoio4ZZd9VEIY6e3wSu/dY
 u1qJVXixqrK18/9G0pNtIe/zXak6CLAoHEiDMfiWWELelZBW02z4VHYbQ5cMtSc9HJUV
 Y82rAN81sfWXrXhX+OKuzsBwEGh3rPDUcW378028k2VTAz7Bt4C5JOYExaYzOBQWFZEa
 SdkStE9/ujIaaOKQPDh8k5j/wZENhhFeF1xEAmnN7/M8DAsBdArW1Jsz95Ume+Dx87H+
 6BLA==
X-Gm-Message-State: AOAM532CQt+YaH9fFEsaAfIhM4ge25hqwb99TKmybfurnByNP69+rwgq
 NYobkx+v3pWZyjv5X9FGDTPTDf/sUe1drw==
X-Google-Smtp-Source: ABdhPJyHX08li9uKfFcDUVsFYDFjgfG3kAmCSYRmm80Yu7toNUbevf8MdoMf10iQ3KebxgTvi8biZg==
X-Received: by 2002:a17:903:41c6:b0:149:49fc:315c with SMTP id
 u6-20020a17090341c600b0014949fc315cmr9071903ple.41.1640408975210; 
 Fri, 24 Dec 2021 21:09:35 -0800 (PST)
Received: from lxb-server.lan ([2403:18c0:2:7e::1926:817])
 by smtp.gmail.com with ESMTPSA id kb1sm15055294pjb.56.2021.12.24.21.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 21:09:34 -0800 (PST)
From: Yunhao Tian <t123yh.xyz@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 13:08:53 +0800
Message-Id: <20211225050854.1138268-1-t123yh.xyz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cage: only enable XWayland if wlroots
 has X11
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Yunhao Tian <t123yh.xyz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cage requires wlroots to be built with X11 enabled
in order to enable XWayland, otherwise it will fail
with error:

"ERROR: Problem encountered: Cannot build Cage with
XWayland support: wlroots has been built without it"

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 package/cage/cage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index a661857a95..6f1046eb2f 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -11,7 +11,7 @@ CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
 CAGE_CONF_OPTS = -Dman-pages=disabled
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_WLROOTS_X11),yy)
 CAGE_CONF_OPTS += -Dxwayland=true
 else
 CAGE_CONF_OPTS += -Dxwayland=false
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
