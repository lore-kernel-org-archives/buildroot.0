Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDD4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 20:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6105B40A09;
	Tue,  5 Apr 2022 20:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJnsS4JaxiYr; Tue,  5 Apr 2022 20:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C28F40496;
	Tue,  5 Apr 2022 20:41:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47E821BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 342BB40947
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrVFa4qyyh41 for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 20:41:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCDD540918
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 20:41:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso360879wml.5
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 13:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEL0+sxREV1B3OyhocUowQtG0piZ9kA9x4DiGGMMhJg=;
 b=NBryOd4Ql3DN3hnHzaZr6GW9AWKQA6+32yRSFGmos+sQ1Fy+gmgojxGDIIc7Y8ixu3
 8eZRD12JGAL4YCjzKJVYy7HUidAQW8hbNj1PrnJJqCjhBVKnvpixIC9Kd2P4CXx04RnO
 Y2YsjZIR3QXDNwQtqYVaid3JJFxxkxudooCBq6JiD42aQx9AbK56xq/262AjOH0iMUQe
 FuMpga7zbytxUbxgDWc9VSSeidYU8zxkz2zlsMXN9Vmov2uDyVlIX4JgZvstGmZf8S4p
 gVz2f/d88NJ3mzdJRsbhVLURFLqG/uWbm9TvC7vVecTJn4pcI4UB94DrZsAApfn+DMRp
 VUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEL0+sxREV1B3OyhocUowQtG0piZ9kA9x4DiGGMMhJg=;
 b=0rAPFXDU0AVsnHRj+rdd+Gs2qAv91cFhDdSdYYtTPSiMhg/3OO5vzxh5XGsvmUdaC1
 tBa96bZ+r8/Upry4TQNhkAmn1Ft2Yw7CjqSt2muWLYgY3k9YpMMeUqkcJKrIUycO2R4A
 z2cwms5V+6TOFwxzBn0ZOuiHFQss29BuleA0W+4bk+NdVTgUrwVVOM+BcjNKr5jd7NWz
 1CKw6z0UAXPRehtfuuV4aqQ6feB9bQ18HgBdQunJp3M8nmeP/BZDvlIqIHARWeapRQYo
 sW8K4Tl30tMXypwr3uRkAPSMoL3ut7GNfkuwbuPY3L1scJQ1xW2O8N/KbXiSvyQbbxqN
 Ic5g==
X-Gm-Message-State: AOAM530MtBq0y2JPTN3+l9MC8e471XCBzJRLgh6e3Uo9QBsmxZJ8UQon
 4GrPCQlv3ZiGCDm9tqpoUEulawDSKRI=
X-Google-Smtp-Source: ABdhPJyAlWJvBRrIjD8w2vvR6uBoMqSEQVK2WtU9QxDfxiKi/K28PPkTdmJi/rwvtfZMwxTZ+PfuMA==
X-Received: by 2002:a05:600c:510e:b0:38e:346f:8a46 with SMTP id
 o14-20020a05600c510e00b0038e346f8a46mr4474147wms.153.1649191303845; 
 Tue, 05 Apr 2022 13:41:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c3b0800b0038cc8f116d3sm3279735wms.44.2022.04.05.13.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 13:41:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 22:40:04 +0200
Message-Id: <20220405204004.1967462-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liburing: needs MMU
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

liburing needs MMU since its addition in commit
03ca6f4e39874583060317e7e15e9e360220877e:

setup.c: In function 'io_uring_ring_dontfork':
setup.c:119:8: warning: implicit declaration of function 'madvise'; did you mean 'raise'? [-Wimplicit-function-declaration]
  119 |  ret = madvise(ring->sq.sqes, len, MADV_DONTFORK);
      |        ^~~~~~~
      |        raise

Fixes:
 - http://autobuild.buildroot.org/results/33f3c58e98daab07139b4f400b85f87c0e314240

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburing/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/liburing/Config.in b/package/liburing/Config.in
index d65a3f1322..fc13f1c17c 100644
--- a/package/liburing/Config.in
+++ b/package/liburing/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBURING
 	bool "liburing"
+	depends on BR2_USE_MMU # madvise()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	help
@@ -11,5 +12,6 @@ config BR2_PACKAGE_LIBURING
 	  https://git.kernel.dk/cgit/liburing
 
 comment "liburing needs a toolchain w/ gcc >= 4.9, headers >= 5.1"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
