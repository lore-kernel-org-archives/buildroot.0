Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD80C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6678E4174D;
	Mon, 24 Jan 2022 17:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GuDABdUWecU; Mon, 24 Jan 2022 17:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1D914173F;
	Mon, 24 Jan 2022 17:25:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6B6A1BF296
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C48CC84BBB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kce-7bHqR0_g for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:25:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45A0184B86
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:25:08 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r14so4358760wrc.6
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ukH7ANgP8jlC1dthljE9vqPK6KF8YfsfwzQsyQENX4M=;
 b=fvjlzxmfPS6yaJJjs9CRFpxsGzqvND1yKMQ807CVJ8k0EH2GLFHQKCcA84iBNVXvzX
 wXx+JVUHjS+In4crv1MTmYD02naPfhlRzuMRQ6Qd5Uf6B39pOnu8zVDvhz3azwfRdQvz
 ZxWlIBAY2cTLxbysx3UqX9rjj5hctqmD6onPwgvB3TXhLOgUwm4MZD9rbAwT0hVeBhdw
 rj1logJPmh+PUzPYQI7L38+GWesX0FRAgX6GYNYTWJMBRMZFIJLgbpfXC1yCryT6PuAH
 XO4LpquniwtXxbRuKoKJ6lve/4CGJtMI1OMbpolajvDr2IyEQXexPmUpUFdbG4sKVZmo
 FlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ukH7ANgP8jlC1dthljE9vqPK6KF8YfsfwzQsyQENX4M=;
 b=WC2GEnmRYW6QuAd/jG2OvL1J9ng5z94pJdmju3pozCq/Qm5Tvga3q/qOzY89WM/jvA
 v1nC/lKeZch6Bg2vintgCfuM67HuyaIs9EH+XdQE6u5+/asbVQinEaumo1CN4yfjj+k9
 dwNEij6Ws46rjr8KdV6T9zRDjfQAtLBgxgRqwqrSLJ7VIeV7ZjPodS2y9G18rrhBrSgV
 opaguZRKysTiLDudixF4ZQeITSVlPKkQtfVIZ06hLPwmuRABgVj5avR9B7FI5/yJwzbk
 2JWAP3JF6PMQaoOg24lRUVPflKZ1/j22GWyI6plIDaqHDmmTimAsqGCGu//Ycm3B2And
 fYCA==
X-Gm-Message-State: AOAM531ja8Ty+xY/iYnn/GmLjnMnAcRdjzBlYcxeYZ3Pwgxr/9vQK7m2
 5+FpwQ1lj5MvgBU5FZ04CQkDyM/FkEU=
X-Google-Smtp-Source: ABdhPJzOsCHm10nLafow/Nhq12tvqzdbwnPym8qCSqbApSClLFi58O9w4GAPke+I6zcYuRr5eHXV1w==
X-Received: by 2002:a5d:48c2:: with SMTP id p2mr14959631wrs.543.1643045106941; 
 Mon, 24 Jan 2022 09:25:06 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id r2sm21773837wrz.99.2022.01.24.09.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:25:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:23:21 +0100
Message-Id: <20220124172322.2302364-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/tinyxml: add TINYXML_CPE_ID_VENDOR
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

cpe:2.3:a:tinyxml_project:tinyxml is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atinyxml_project%3Atinyxml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinyxml/tinyxml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index 15280517ac..b8b8e43c05 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -12,5 +12,6 @@ TINYXML_AUTORECONF = YES
 TINYXML_INSTALL_STAGING = YES
 TINYXML_LICENSE = Zlib
 TINYXML_LICENSE_FILES = README
+TINYXML_CPE_ID_VENDOT = tinyxml_project
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
