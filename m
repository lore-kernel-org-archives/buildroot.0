Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0A5EEAA79
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E86F5608A6;
	Thu, 14 Sep 2023 21:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E86F5608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJTRD7GMTbtj; Thu, 14 Sep 2023 21:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3616A612CC;
	Thu, 14 Sep 2023 21:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3616A612CC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D0531BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E0B400E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E0B400E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wv7OG1okW9Ev for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:04:57 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F4FA4157D
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F4FA4157D
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31c4d5bd69cso1333510f8f.3
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 14:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694725495; x=1695330295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WCu9TXilTGlfIX1S4+vtdMUcAMzjWWhrUyTRs1heVOc=;
 b=N2pTsI3GxOM1Jfxb7OD11IBlA9wCQ9q+bEd6w2UwKjAlXX7aN72MuECs/ee4QFOZr5
 kFrPbTIB85WUxSnX1JP1Slo0wPa86KGi7kjH/YIkh8j6dmxd1s3rdSz9obN2sHxG/qEm
 DWdPU8AroUqAx0tpHOAUs3rACwmsSTZXQzmEwSGefhwNNYRmtiCigFsUfOlj4jQQlVcf
 jNMGRL01tMqKJ1QSakXikkM+iM8QNCCkijfDt5sXFA+j6sw7chD6U96TqLH7AB0PBG3b
 Gw1yG0cJlbAONMKVf6p2X+KicDmvjef8X+VGacbtNMFmcEFkyy57z2WQStjh4t5LYHyw
 c2Zw==
X-Gm-Message-State: AOJu0YzAYiPwZaLT/cUOMGLnAW00xhin8HsMXVznaTawZWrxZZ29cMC8
 r73APXm02K1PkdTDvzBZfQ+/UkHbEcA=
X-Google-Smtp-Source: AGHT+IHOv5Ff1o9ckmr+FzmpO8+vLqMNa1FouGKOygc7zF7rQukkIACDOGbj3PjY6pxX+MGN4AZ5tA==
X-Received: by 2002:adf:ec42:0:b0:317:3d6c:5b27 with SMTP id
 w2-20020adfec42000000b003173d6c5b27mr5693927wrn.46.1694725494699; 
 Thu, 14 Sep 2023 14:04:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y15-20020a5d470f000000b0031981c500aasm2681168wrq.25.2023.09.14.14.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 14:04:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 23:04:48 +0200
Message-Id: <20230914210448.439577-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694725495; x=1695330295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WCu9TXilTGlfIX1S4+vtdMUcAMzjWWhrUyTRs1heVOc=;
 b=n2l0G00G5O0hcXKmE8gpHGi4Od/5ts0NHcCL3n+YiO7Cqu9XLlabY+I+rjM8NDviEz
 nNz3/Q0JxHj3/IMr+Jej5PH5vpfQSoY0oKUkmEwOvaqQKfl/1IPi1ktLcSjw8lmt16co
 guHmq7Qh8kU6r40VoGO77bVoXKV3cTl10JHWKgAyJDm4UL5DL4TvWWpPq8oUYJMDTkEZ
 63E2gMN6cslD12dOnrnEgQe0yNUCkzOdDInlOp8Kvj2Pe2XIDyZxFG3GcbymHHPo2tUD
 j+nwq2UbizhoCVMW+PEFVY0TBWljdjZi+4SK2NeB1u36SiNrTwC04oAk7Yxf2mgpZzMV
 NR/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n2l0G00G
Subject: [Buildroot] [PATCH 1/1] package/libspdm: fix legal info
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hash of license file is wrong since the addition of the package in
commit a837a609a83428b56fa03e18c439b3878d14fdb6

Fixes:
 - http://autobuild.buildroot.org/results/2f9007ee40126cd57753bc97ae2d81c922d9f9f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libspdm/libspdm.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index d06af29397..5095d3c3b8 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  3a40daa59f32843062c3d2699acee09bd0ee217eb8ebf0378ae12b60b6db0636  libspdm-3.0.0.tar.gz
-sha256  337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  LICENSE.md
+sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
