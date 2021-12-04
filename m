Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B00C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 08:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 555ED4035A;
	Sat,  4 Dec 2021 08:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azKwRF8r_F2Z; Sat,  4 Dec 2021 08:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C16C140352;
	Sat,  4 Dec 2021 08:49:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EA6D1BF5E9
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EE24607FC
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dh7V4AG2RCsA for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 08:49:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05813607F0
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 08:49:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j3so10933219wrp.1
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 00:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wM99pIScD9TTGX7JsAbsRwOQ0UCJhLNC5kTyvBKU4yk=;
 b=KmQiJH9Wad6/WldzDsFUM0BBtJ98OpvfvNTZv4HIIih+1cD/QQ1I069BHGKSyb8agu
 JS6/cjFx0EGcuCBrVow6z47U3U18wakk22NoDpxErfuQnWfkz4c/93923/+/BVkg5xXb
 oynwB3yCPjYBtF2GeM43EUkA5GPdFJ6FI8eIFSFc0k4pmlVLyQzDtLFDv9Kt3L74Hbxn
 rAM43WhgenvPchn9mHVe+JpKHkEpnfjsY/UnN0yBo2b3unFego5UfzxajwzWG4XUQTn6
 admXDc7Bh+e7YVHqOehIVVpDN5sXKCijWGHdSlLE13oxtRIu5ewdPklZVHpwfnfvq3S2
 s7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wM99pIScD9TTGX7JsAbsRwOQ0UCJhLNC5kTyvBKU4yk=;
 b=gl7CpQvjWoYw0YzD7c1FobdlANuIpXC6PokRD5xUZdrvHEge0KJUPYGBwtrqddGkQP
 YWqpK5SMNU7ff/1vbuRVUkxUSsrlOpG2jQzkvqP60mf70jIfMoWj8IOgnB9POdb/Go8f
 HrWZZkqihjPk9oT0njSppAho3ImE3gfb0W9g+jubUkXvorpQk/hJJOGawND4Bz+Sqjxt
 gRt4jx4sdsx/GSR9vzFPVUcV7DzQSAL8Cy4wpEl/n2/yFGoHecsQMaD5rMk8l777pKNX
 H8nt+J0gqau9/lHWajpEseYnrTt/FhJok+zlq684Mx0iW0oFK11D7iDx721zLIY6UcCq
 N/sA==
X-Gm-Message-State: AOAM533Pcu9WnpMwUs7JNYa4ZZz4kLexF/NxMuRi4Uw2+KHipsgBeF5d
 abIa4S1H7QuPe7HYGSrmp+s1aJuaaUtGrQ==
X-Google-Smtp-Source: ABdhPJwEfgrFKzYbDxqVPoOay28qcDLRlVel4mn30B4EpoQk2Em+uc/zAmeRfHuiC7ntJBE6G7Eypg==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr27901531wri.69.1638607767970; 
 Sat, 04 Dec 2021 00:49:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u2sm5454324wrs.17.2021.12.04.00.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 00:49:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 09:49:37 +0100
Message-Id: <20211204084937.2015052-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgdiplus: add
 LIBGDIPLUS_CPE_ID_VENDOR
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:mono-project:libgdiplus is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amono-project%3Alibgdiplus

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgdiplus/libgdiplus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index be4a9168f9..97cb595c71 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -9,6 +9,7 @@ LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
 
 LIBGDIPLUS_LICENSE = MIT
 LIBGDIPLUS_LICENSE_FILES = LICENSE
+LIBGDIPLUS_CPE_ID_VENDOR = mono-project
 
 LIBGDIPLUS_INSTALL_STAGING = YES
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
