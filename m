Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18116C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 21:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B654405B8;
	Fri,  3 Dec 2021 21:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GGu1C8wN6si; Fri,  3 Dec 2021 21:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74EB0405B2;
	Fri,  3 Dec 2021 21:02:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAAE91BF378
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C41B1400FD
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bl6voR5LQ4H for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 21:02:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8CE7409C9
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 21:02:53 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u1so8202166wru.13
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 13:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OspPnvhlEgpCt+w2D280vHbl5OPznx6Vv8ikFXhe6CI=;
 b=GXNdupgH5OgEvDDmYJdJ43OlCE1DYzKUaXrJ0IVtegpO5/TROCn2isknV9GFy71a55
 75AYQ9n8tnnXcaKioLQAVk+oR/xYZeUHH1pE20BXor5tmgSenpXcbQyILmpZ7LaQBp0d
 gZqxIcG69SbmgFWjjLdZq8Gz4O9hIN8X7hgoX9uAYvEreGll0sPhM4xUnF+wRRTRdomW
 haTVupzogI1ktmTICQ0y1JohK3l1v/v6jbQxhIx7VSmmJS4o0JSpU+tStSqhOZZJSCZJ
 X5BTRLC85NAa160uU0BSBLa5CksHV04VewwXcB+kS8TOg5eM+LDbeS8F5yDm5alabwMR
 OewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OspPnvhlEgpCt+w2D280vHbl5OPznx6Vv8ikFXhe6CI=;
 b=DHYsQJsRZHRRjzKyIGbIg0Dl22u0J2i7paepJyGORtcvgYtICEaLVsccpY+5qlxAhh
 SBfYLLnohusePwMENsXvIL+wujj0VFMc2w7M+IaqIurt78UmKzRROUp6Ekne0WfUrx1A
 HFFw5rnLtbmfOij0eRs6NhvUWZ7kU32MSMBLx/HlI/in0+loaCqX1m/+S4iYXk+0y+tZ
 XFF1Zz9samwIm2puFg8EvZAcWq3BXmrLYnsXDSTDEzc9iKPTTBZcgXgLoLIAKuxZQYYZ
 7E6UnxhmlhE6dzGxUAljJfsacVF+vklvvlPP+ZUOxQJolp45HPu/ogUHnQQ6ys4bkKlq
 u+TQ==
X-Gm-Message-State: AOAM532kdwawlTIINmof/FsuvRwSQ5qgbz6/TYGND8VSzam7LjPne0PO
 Wfc6WvQhC9GU99ETOKDYRYgjKIPYQBsoJA==
X-Google-Smtp-Source: ABdhPJw9bg2+yEbmu7rWdaGnBGFo7ySstWNoSxvgWgtqWmUFDEMRL3n+qvINQFVGEsEZpnJlN/zdkA==
X-Received: by 2002:adf:fb47:: with SMTP id c7mr24341114wrs.602.1638565371865; 
 Fri, 03 Dec 2021 13:02:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id b11sm5918484wmj.35.2021.12.03.13.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 13:02:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 22:02:55 +0100
Message-Id: <20211203210255.1924371-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lynx: add LYNX_CPE_ID_VENDOR
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
Cc: Mario Lang <mlang@blind.guru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:lynx_project:lynx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alynx_project%3Alynx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lynx/lynx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index 44d52d90a5..3f62f4f5b7 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -13,6 +13,7 @@ LYNX_PATCH = \
 LYNX_IGNORE_CVES += CVE-2021-38165
 LYNX_LICENSE = GPL-2.0
 LYNX_LICENSE_FILES = COPYING
+LYNX_CPE_ID_VENDOR = lynx_project
 
 LYNX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
