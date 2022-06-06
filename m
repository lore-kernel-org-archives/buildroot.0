Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66E5C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 337E760E2B;
	Mon,  6 Jun 2022 13:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTrvDjIMStvi; Mon,  6 Jun 2022 13:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5252F60A92;
	Mon,  6 Jun 2022 13:48:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 827B11BF2BC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E5C460A92
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmD1aAAK0BwO for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:47:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09D8460774
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:47:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t13so19947685wrg.9
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKYXps79VLeFdyRd7prGQQzVMkxFThdRUMDIpK1Jcy8=;
 b=nfQDzVhS/Ol5XbCc2bYXVYax+UXb2BIEr0Aci/8c+jrTEFjq8ZTGusNY2wt6yVocuR
 K5m4+WJ3mAmK9HfKSFo7pkPgqRvBv38THHsPTAtwAid7AhWwYD+oZejfdFmsAeGYhAMS
 +joWlFzawe4VLHNiaL6RyDvPo/U5jBpjBnIAWNXXSors25wt6W0T/nduf3c6CJv//Cec
 e4lJ2MfrsyfAtFM9wlPLdtfW3shyDYbmn/lm8MV/Ubt2KxdCTFm73mintUdX1fKhmGAx
 aebEPIJcrsKQa9br4c4XYXWP/0RcXdTIgrrob/l17eNa3kxnsn9aSiZVuJsGcZ1XUckT
 tDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKYXps79VLeFdyRd7prGQQzVMkxFThdRUMDIpK1Jcy8=;
 b=iV2ckfQ6UIjNrtWcdpVwtEgcrULHX+TW/dMEzdsAnHbbq4uZ2dOiIJPkphMoUkuApX
 3owBLZVsij8m6PS0H+yxr2gl6oW3HC3zIxScLTGgmAKpW2mqgWSMYg9OqtMxXUoF5eFy
 4jzvfZTn9iUo/0KfMQ7zxtNoY2pwP8W0svItZSmQEIVdnv8hIFT4I6VJYXWD9c9elBmt
 Jk9SBVgioyG1OYinfHl2YVOCbGOmxM0s26V5yv1UYqWFPfQnR4VWSlI1TzBzXFlPMUTt
 wPnMBdWyoglw7eakIt3ZzwJOai9Pzlt5caL3Ra+5E/XBXIggLBMH1ctfFyncIc5BJYpS
 AyKQ==
X-Gm-Message-State: AOAM533QY4n7UofeeKb2JjSh4YAazIPsZwUX9KkBh5DyeJNUo6YLueKZ
 tzrQWvUrq1hKKCXy5BmZAPW1WJCNWBo=
X-Google-Smtp-Source: ABdhPJwYJGohm3+UGB20osLR1fVjRI57o11JwoHTX7MWz14T6a9NjcqctXh2fNytrmd1fdBZ4nnVXQ==
X-Received: by 2002:adf:f706:0:b0:20e:6788:c2b6 with SMTP id
 r6-20020adff706000000b0020e6788c2b6mr22112786wrp.633.1654523274908; 
 Mon, 06 Jun 2022 06:47:54 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b0039c45514f16sm7989327wmq.4.2022.06.06.06.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 06:47:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 15:45:18 +0200
Message-Id: <20220606134518.791648-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luajit: disable on armeb
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

armeb has never been supported by luajit since its addition in version
2.0.0 by
https://github.com/LuaJIT/LuaJIT/commit/ed6c895ae56288b6982d1651c4ea638452c9e99b:

lj_arch.h:473:2: error: #error "No support for big-endian ARM"
  473 | #error "No support for big-endian ARM"
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3751096941ae16184b835fd6879b4904f28c6432

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luajit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index f27099e80c..d890d65b10 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_aarch64
+	default y if BR2_arm || BR2_aarch64
 	default y if BR2_i386 || BR2_x86_64
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
 		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
