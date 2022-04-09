Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C81C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 02:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A6A8405D4;
	Sat,  9 Apr 2022 02:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxxXDXe6o1nE; Sat,  9 Apr 2022 02:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36FE9405AD;
	Sat,  9 Apr 2022 02:07:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3181BF239
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 02:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 698AE6080B
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 02:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhmxUbyDobfm for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 02:07:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95085607B0
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 02:07:23 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id b17so631284ilq.5
 for <buildroot@buildroot.org>; Fri, 08 Apr 2022 19:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRpilsE0XvYkw6lShCd8/w9Q7zqblzEcF9U0e+Y5TW8=;
 b=Vu/rVnaVPIn/R4US+bruerjCeGP3j7Uz5IZdVp2d06cwQIQaO8cKTjHyA5ZmvWLQ+i
 1OiCeITFhGNp1se5ej8UjCqMNQlfbPUMKztuuf9yHhGboaNyJTwmNoqmZ6bC9ooVQeT3
 UK7eDUxqb2Xwa28wdXEpJsX+rRLVs4bxw2DNrB9Ey7MBGdxOt2sq0UH2UQsEUNctGOuD
 1L1fEwqmN9VyLA7oIr2AYoQRH9CF3Uy3YlYutaGayIInIn/InjdMejZH9Apd+mfg10pf
 ky+dk+WCedNlfysKAAdDZ70SVkTALzuz9Aad+04xoR/nnRJ/c2OXZCg8LThKIrJaPr0t
 Wzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRpilsE0XvYkw6lShCd8/w9Q7zqblzEcF9U0e+Y5TW8=;
 b=qldeb337IV4ZaXna9TY8gjy6eIG80qDP5Xz2atf7/XBpR9eo/Vg22D7YBVXFqurzGj
 f05ufGLtpjt/oKs5/i07I10rOWhuADeSgjuiVwefiixbnTsgEPhZ6hZbgWwKJRfieoY9
 kUF2V8tpZiOJHTySBreOyGTlXMFCxbM/LA29qRW66oZlnR4LdgZFL1QKpi7xZBMwDjto
 e6ZFqOgbxZP4kes0hy45Dw0TjyFtn7kiGSt/XzUBVyaFMOduoxY/F9P+47nGvz2L0jhP
 jWCB62EJhpYbh4IAkhhjCCx1fiEdfSgfK9FsQv92IypDKCQNeRqzspPZQdBtm0DEqSWR
 /s7Q==
X-Gm-Message-State: AOAM531jNe3sZY6somdYY4QUDpLT50JKZfsdiWMJHOtNjR+ip9oSGPT9
 BFGU3Si3o6E5t0pCtghbLPZT4w7Z8//esg==
X-Google-Smtp-Source: ABdhPJwhHEtolTrxCqL39HkOCtZmnGGMxqeYbbnOCFc6YTo7P4nPmiUVfe7kVAlDWs5ezGYVQ0MUKA==
X-Received: by 2002:a92:bf12:0:b0:2c6:7aaa:9ff2 with SMTP id
 z18-20020a92bf12000000b002c67aaa9ff2mr9710255ilh.224.1649470042535; 
 Fri, 08 Apr 2022 19:07:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 f2-20020a056e020c6200b002ca4677e005sm9585448ilj.38.2022.04.08.19.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 19:07:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Apr 2022 20:07:19 -0600
Message-Id: <20220409020719.3126086-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/binutils: disable 2.32 on
 unuspported FLAT platforms
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These architectures are unsupported in config.bfd:
https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/config.bfd;h=0e1ddb659c3ab7160aab0a7c173b85052f870e65;hb=a9d9a104dde6a749f40ce5c4576a0042a7d52d1f

Fixes:
 - http://autobuild.buildroot.net/results/332/33277d4687ca9a04dbfb02c50e5755ff9e55b0b4
 - http://autobuild.buildroot.net/results/5e3/5e34d11393e14fc36fd6e72b69679bc4fd1e3798
 - http://autobuild.buildroot.net/results/63d/63d01d33ae30f86b63b9f42a9fea116f2f3e9005
 - http://autobuild.buildroot.net/results/45b/45bc90fd2dde7bb201d7f999db1a8024cf889a06
 - http://autobuild.buildroot.net/results/d1b/d1b1dfe449f82944bd48215da3cdffd05797e2e9
 - http://autobuild.buildroot.net/results/a3e/a3eb1ff6bf6357242ec7993db63e57d4afeccc7b
 - http://autobuild.buildroot.net/results/f4d/f4d52cabee61ee0f234b03c1ec1bd02e85e7bb20

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/binutils/Config.in.host | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ea1f020989..e1c59bfbd0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -15,6 +15,13 @@ choice
 config BR2_BINUTILS_VERSION_2_32_X
 	bool "binutils 2.32"
 	depends on !BR2_csky
+	depends on !(BR2_aarch64 && BR2_BINFMT_FLAT)
+	depends on !(BR2_aarch64_be && BR2_BINFMT_FLAT)
+	depends on !(BR2_sh2a && BR2_BINFMT_FLAT)
+	depends on !(BR2_sh4 && BR2_BINFMT_FLAT)
+	depends on !(BR2_sh4a && BR2_BINFMT_FLAT)
+	depends on !(BR2_sh4aeb && BR2_BINFMT_FLAT)
+	depends on !(BR2_sh4eb && BR2_BINFMT_FLAT)
 
 config BR2_BINUTILS_VERSION_2_35_X
 	bool "binutils 2.35.2"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
