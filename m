Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02724C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 22:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81DE341840;
	Mon, 18 Apr 2022 22:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m23BXn_sMsjB; Mon, 18 Apr 2022 22:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FD31415F6;
	Mon, 18 Apr 2022 22:22:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07BBF1BF30A
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 22:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7D6360EAB
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 22:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7XCVhXOr4Nl for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 22:22:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1217F60593
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 22:22:36 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e21so20082697wrc.8
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 15:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aYcp7g2SK2mAO/yzKhpVXzu2Y1GfeVUnPM1rlCk7XDM=;
 b=AGGs/927/HGFwL+CqrJVz9rInzfosIQqTQfCglqX/UtUS4tW1DZkiWtIjmEIDC3mS7
 gD4yL+J780Y9AcJPXaLVYVE6WsK9yuk+bazWhhhgrj5psvOKjJc8lQOB57axysqLMMjX
 JaUm34kc48FwZI3ml4pUAUw36I2NyDCC3no/aRV4XbbCWaBg0pO1V2APJDBsaZc4L9dH
 gBfejGkEL/DiZJOaKW81gtBGNNjHtGBAvPkSI2QVGynbiavvyBbPcD8fhSarqhTW3v7v
 +uQkS71UvZebpj54P/F1jbVN6TlujS2KdS2trDnaBIXKbgWBuxDYsnsc6jxEP6DLDciW
 /oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aYcp7g2SK2mAO/yzKhpVXzu2Y1GfeVUnPM1rlCk7XDM=;
 b=3uKTRyAcXgx8NJCv5GPW0zWlPq1/BMDMrd2SRr/FAbAwJqJ6WDFDsCFcWi9gCTHx/W
 1i9tI/sSplgu6uRKhAWQIJtgowWSefawVkBuae/CTyNBo4/iVXc+XXczmYidmvmyld6D
 e5HKpk8GXOkRvsORceLUFxGCfCUqpBGiHbG+HPy2c39pUbxflqsIHuifmKGY8cS4w1hr
 HhsFvQi2veC+vFtpvFBxDGLHBeDl2tLQRSL/voV8WMh5T9rsyuAtFTLj4mJy0p/jkx4t
 UKYozXbeBwjJRE7fx/8NhB9oAJ2eMG0eYo5+cM2MnAOAq0ffHuZfLq5A/Svh8kOqcZUQ
 Cnag==
X-Gm-Message-State: AOAM531ZdJBCPRyqRhcDwGp87s7fpIHwj2sq1EX7rvrTZ6PHujHaSiBK
 e45zHRXx7FsFwumwVUBcSJWuBjlKDi8=
X-Google-Smtp-Source: ABdhPJxbJuiZVPVTr9unwzq/mB/wlZ5IyCnrNrwasnjm44TtCI22d7Pcb7zL3Vwi019FhU2rMvL/1w==
X-Received: by 2002:a05:6000:1806:b0:207:a218:fcd2 with SMTP id
 m6-20020a056000180600b00207a218fcd2mr9338782wrh.706.1650320555091; 
 Mon, 18 Apr 2022 15:22:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a7bc08a000000b0039049f8b3f9sm12425221wmh.27.2022.04.18.15.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 15:22:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 00:20:33 +0200
Message-Id: <20220418222033.1279730-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dhcp: disable backtrace on internal
 bind
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

Disable backtrace on internal bind to avoid the following build failure
since commit 0c8dd6ebd656e06cf99a63eb93343715f4853503:

/nvmedata/autobuild/instance-15/output-1/host/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/10.3.0/../../../../armeb-buildroot-linux-uclibcgnueabi/bin/ld: /nvmedata/autobuild/instance-15/output-1/build/dhcp-4.4.3/bind/bind-9.11.36/lib/isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

Fixes:
 - http://autobuild.buildroot.org/results/074786f3f1e7ffc858dcb1de1855ee138793869e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcp/dhcp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 6ac9ed0147..e6f4c419f4 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -29,7 +29,8 @@ DHCP_BIND_EXTRA_CONFIG = \
 	BUILD_CFLAGS='$(HOST_CFLAGS)' \
 	BUILD_CPPFLAGS='$(HOST_CPPFLAGS)' \
 	BUILD_LDFLAGS='$(HOST_LDFLAGS)' \
-	RANLIB='$(TARGET_RANLIB)'
+	RANLIB='$(TARGET_RANLIB)' \
+	--disable-backtrace
 
 DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
