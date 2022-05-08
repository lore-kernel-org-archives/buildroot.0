Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEC4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 523EE81759;
	Sun,  8 May 2022 21:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sbopHzAWReS; Sun,  8 May 2022 21:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D96981757;
	Sun,  8 May 2022 21:39:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 959E71BF38B
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 21:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83D9940438
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 21:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-GtSUymC3NK for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 21:39:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CC5940194
 for <buildroot@buildroot.org>; Sun,  8 May 2022 21:39:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c11so16990766wrn.8
 for <buildroot@buildroot.org>; Sun, 08 May 2022 14:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OxkjtnIewdI/owYnfD3xn+Gj9he4WqqYuLhJ1Kjr6gk=;
 b=eE72R2bhAmBzzru93y5HQPVTGa9owqwu2GEzh0KADzS2oW1kWUrfSX5hDCAz8piFaN
 q185krRhEY++iyg6xAS5AEGBiMugtE3n8Pe8LWc1hyZQX1KZAoE/8tV+9+xDWAoLXHRT
 pqZSIguqsvcL6ftTVaQjHSk0teMh+Lf3FhwVo1qlRXwcTTo4hOpyMRsC+Y9GGCxtYqWw
 Zdw1bNi1iXQdyqJBaJAiES3y9zCTO7rRefPv8YLdrow7khuJU+CGJZU302kZqr5axxf8
 SnlRTFUUdoRzMoEROdJz3fR/0qX17w9lOzNNib9AeYT+mWJrgBCMd+hGne9o5dSlX+/h
 R08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OxkjtnIewdI/owYnfD3xn+Gj9he4WqqYuLhJ1Kjr6gk=;
 b=B6vEJNWhgx1B2EdoY95ey6CSapeaNLZjm17fbIgh8mKKzDf7byWKgIbR2Z/+2xEFfH
 kKhj1RLtV80wQaHEzpRrPJE44TXBTwKIc8gcbz7TiOmKFgZ1hC3/VT7taWDMZL1+vRQc
 peLsCdx/0jMWjNdmZ3Q+h3fulLOYbsEAKJvDXOrnMLPbxd2dvEqi7UAIVEPf/lrtiBui
 hyz4zhqZEtSB3a4lSbbghNBNPKqcPR82doo2CuGonXzrf47c3ceGdx4Z0BA8Bdp4DjHd
 cViCxdcrqTGVymzu3mYSJq6SOIp5K2tSsCO5zIdTYKh1zL39sjSWAaaQZWqtyHchQQfB
 QHfg==
X-Gm-Message-State: AOAM531sZw0R1vnng7wGIWUQ056tLhO4rRrQqxWpmO53RUG0GvxLcf13
 C4j+tdkmE9q+hoHf5xdobZKmn4X4Lrg=
X-Google-Smtp-Source: ABdhPJwG4jLxIwKQ7+Du5aYQg7HOD+oMtTZw4p9SNvSIZ2ffheJt7GiFnNBKjHd/zZfPMbAzk+WQDw==
X-Received: by 2002:adf:f4d0:0:b0:20a:ca54:1fcc with SMTP id
 h16-20020adff4d0000000b0020aca541fccmr11470111wrp.681.1652045972445; 
 Sun, 08 May 2022 14:39:32 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a5d6349000000b0020c5253d8c3sm9286284wrw.15.2022.05.08.14.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 14:39:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 23:37:24 +0200
Message-Id: <20220508213724.1402946-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rust: add host-pkgconf dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add host-pkgconf dependency to fix the following build failure raised
since commit 4e3be3ae9d4c9f1b0c035eee0c923a724f9a9316:

  run pkg_config fail: "Failed to run `\"/nvmedata/autobuild/instance-6/output-1/per-package/host-rust/host/bin/pkg-config\" \"--libs\" \"--cflags\" \"openssl\"`: No such file or directory (os error 2)"

Fixes:
 - http://autobuild.buildroot.org/results/b046523960079cbf85931b8f67c3b98dd07fbbda

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 6ac75f39c4..445fde70a4 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -14,6 +14,7 @@ HOST_RUST_PROVIDES = host-rustc
 
 HOST_RUST_DEPENDENCIES = \
 	toolchain \
+	host-pkgconf \
 	host-python3 \
 	host-rust-bin \
 	host-openssl \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
