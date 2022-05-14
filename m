Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA101C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 22:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3886060DFE;
	Sat, 14 May 2022 22:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtuYnEdLgGKu; Sat, 14 May 2022 22:28:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2291860C2C;
	Sat, 14 May 2022 22:28:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C7441BF5F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 248044089B
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5mUa4KjeeJ4 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 22:28:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D417B40350
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:28:14 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id d3so8118005ilr.10
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOO1/3EjGB/m/t5VV0BVRYQBT9H1fbGZHGPS+pCHzU8=;
 b=UydmGfGY0+t5sm+Oprqr8rJydMMErK6XNEgSvnSYFXFkpHpVrdXGxVwT0uy9oT1PBJ
 NPvMiisIV/19bU2do+9a8nzMlaawABjp7qOI/fr4p6v5Q09ChTq/qcaFdBkiZcF0oiVM
 eMGoTKIrmratyA7pk8NJA4P/+uASFZz3ZXN5g/1us8UKOh+xIbGNe+SBGapwbjKjzKMh
 J+PYeTwLaSR10r/SK3lF38hTgUwzBoflbnvBCM4hhulV7mxEe6bFcJTpKUVZIHBTqhID
 3AmFRPNrhJXR1yLqQeA6tzTHRCse7HEjqK0buOaEFj3eZIQLhPw1a7h2dk08VEQ7bV/P
 rbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOO1/3EjGB/m/t5VV0BVRYQBT9H1fbGZHGPS+pCHzU8=;
 b=1wZxT8qZK2ylFuZ+i1Lsj29jBwe6JHMnN811DiLmZ2ZZB+wiE3J9gTKWWgclP532BF
 6IP6UIToxwoQfuaAiDqQV7oWL5CTmCAZcbPLlBtPFD1y92npndMfOmEjznQDBtoU+M6H
 e1azMCuRQGClmhf83j9sJsu4ud1vhgyCecu8cemugId7nu+MtvWBoNLxc2Bcis6Q5K2q
 cKlYF2HHb8ZS+ZzhLRPbCrTC6vu9BPd9rPHLSyseRZJf9J73ZSvt51qdfBOFT4zxTUKW
 iXLE8uFarGZBb1xJX5eovIziiDBZOCOIvLFZf2qd1unOeo7Zj7q5jCFUV/Is630it1/h
 zUgQ==
X-Gm-Message-State: AOAM531YQ3OAMHpbLWHsxqBEgIWhofKnxKts0ZdqeIFX3iCuYa9PJvoS
 DMEQLtP2mqJe8jvLFIzmzUVx4QSMHWU=
X-Google-Smtp-Source: ABdhPJxPT25zCif7iVmOZ5Nj6zRxWkb8qFdwhBx7Zy1B1ZgO+MxvgMrItg/BKCQnehkRPUgy9a2rtg==
X-Received: by 2002:a92:d644:0:b0:2cf:a21c:3381 with SMTP id
 x4-20020a92d644000000b002cfa21c3381mr5602932ilp.116.1652567293735; 
 Sat, 14 May 2022 15:28:13 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 x19-20020a02ac93000000b0032dd4d6f57dsm1713327jan.77.2022.05.14.15.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 15:28:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 16:28:11 -0600
Message-Id: <20220514222811.3925140-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/midori: add missing
 !BR2_PACKAGE_GNUPG dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The !BR2_PACKAGE_GNUPG needs to be propagated from BR2_PACKAGE_GCR.

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_GCR
  Depends on [n]: BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && !BR2_PACKAGE_GNUPG [=y]
  Selected by [y]:
  - BR2_PACKAGE_MIDORI [=y] && BR2_PACKAGE_MIDORI_ARCH_SUPPORTS [=y] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_HOST_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_USES_GLIBC [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_LIBGTK3 [=y] && (BR2_PACKAGE_LIBGTK3_X11 [=y] || BR2_PACKAGE_LIBGTK3_WAYLAND [=n])

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/midori/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 715295e5a6..54e19d4d34 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_MIDORI
 	bool "midori"
 	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # webkitgtk
+	depends on !BR2_PACKAGE_GNUPG # gcr
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
