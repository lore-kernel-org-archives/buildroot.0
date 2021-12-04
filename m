Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A75C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A0D834AE;
	Sat,  4 Dec 2021 21:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WoZ-WebS_45; Sat,  4 Dec 2021 21:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2943832D8;
	Sat,  4 Dec 2021 21:25:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD7F21BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA47B832D8
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o2vMH6hMzmOX for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:25:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6585B832D4
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:25:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u17so6266844wrt.3
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 13:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7vOvM3TFOZ8bX65PcCkKbCMiDDeMx+S5VWyz+Tka0co=;
 b=XZnVfNv7T8iAeJMgoBt2kpw0M1O5T+XP0yD3aYkJTwqdC9RG442Utr//a8ZCf9oE5r
 XB47o4g4CkrHhBUv9uiOxttQ5k/l+hnXeTHDpolXsbHQzgT8/KnlXTVz0Y9cWHV4737J
 wjEBO3Cha14Kpfg0qAqkm7X/J7e5hc/1HSgpc+m3TKbKFMikDRSv7t+AzZb7BpRf5pgW
 f+Yt6VhM1xwb5m9PRWvlj3bRRv+gzZbf37AAXWclyDUbhXsM3r5in4BoQ8r0RFdK2owo
 IZeSkQ6mo7yKaevEXoCh6zMCPhWcDKa989kXjRidpVLzjzW9rR2WJIGxMJH24cfAkRj7
 vrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7vOvM3TFOZ8bX65PcCkKbCMiDDeMx+S5VWyz+Tka0co=;
 b=2/oS2XStYiP7hoAlNB6qCSf+H+KPc6wiDXeLcmtjqfXMidfCZrCVJi/RB7IMCyWFK4
 Qq6lYuTAqkRYzO9yTorj3K++DGRvbb2/7soViFZYs2Mzm9dMl0duaiVFn1j+3IRLhfrY
 QxIKLFB47HqQUjH7nCRHGPyxKaGqaL499MypQ2Sr0B1J5z3kF0asCqhfBr6KwjjwYLvt
 aKsQUwapf2i8+juIGhipO+wEPZIZiT/TBa/UZJKU+0wezlepBODItJ4bFMv8Pu64q0gz
 RHswMY7mYeG+KnhXztB6Ufhc7S9CzfKC91ubHWiwAJ9FlMUNYrgU3g6eQcAiZan26swk
 mUEw==
X-Gm-Message-State: AOAM533Y9bhczqXms873CxG/J/sjLYSf5v3wmBKhE/WIfYqlSim8Ui9E
 lDNGkUqg2ee+xl1i85L/LuNn/ekKwaMNZg==
X-Google-Smtp-Source: ABdhPJwj6rQ64Vh7jBaC7Jumucn+isucjdAAF8t2VTG0ygQCLyENBQA9MRzJaugahGRqDnvA0E+qCw==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr31269055wri.241.1638653145291; 
 Sat, 04 Dec 2021 13:25:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t8sm8036370wmq.32.2021.12.04.13.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 13:25:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 22:25:47 +0100
Message-Id: <20211204212547.2019391-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/util-linux/util-linux-libs: add CPE
 variables
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

cpe:2.3:a:kernel:util-linux is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akernel%3Autil-linux

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 3a3a655e62..f1a4334c5c 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -19,6 +19,8 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
+UTIL_LINUX_LIBS_CPE_ID_VENDOR = kernel
+UTIL_LINUX_LIBS_CPE_ID_PRODUCT = util-linux
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
