Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ED4C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 22:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A19B260F7B;
	Sat,  4 Mar 2023 22:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A19B260F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmVHSyNOzDNQ; Sat,  4 Mar 2023 22:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D546460B35;
	Sat,  4 Mar 2023 22:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D546460B35
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFD311BF591
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A68C881EA5
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A68C881EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORGCk_3ZtTGt for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 22:26:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D6DE81DF7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D6DE81DF7
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 22:26:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id j3so3583510wms.2
 for <buildroot@buildroot.org>; Sat, 04 Mar 2023 14:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677968772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gJq4mTnMT8KmRjqAx63Kbj40dMMJ2ZTsQnL50fZ/5oo=;
 b=7nK+V9zQwbXfWRT1W8yloAv6+nWdvZ50aVPOPQVzltV/WWiTa3tOGFcFv3XGf8seZk
 eLZA5wLvaQ5TBajcjO+yq7u85Zc3FFx9N3WjIel/3BktgmSL8PcLFkCK8Jv0c15DIZ2c
 DNLw9HYWtYzlh7l03gUXDcRlLedK40bQLPpf6iY5RvgJ2ghKWF+CbvCXJgIV5ofvKK41
 hmH0NYc5xBiRWP7CYuTNfPCc0ZnVbUdJmyY5/ZWv1LrBh917JyA3mQzjM587fKuIsm8I
 4rKakNJ1Wbm10GQcnGGgsvsFbwCHhthu+jIqfyTaA5OyTW8ruDU3EbVr3xkbO8QNCAzU
 TQfA==
X-Gm-Message-State: AO0yUKWCyk1qDL/XagrzY93CJTBdKbeKnGrdJWwW7MpBwZATIaOLK6MP
 5vCvjstjMElQOIxwIcAWq86/Qq4DoC8=
X-Google-Smtp-Source: AK7set+nZZCqlFOiWJynFOtjIG1IPz0b+C86ZPtY/tvxiKWeCEe1qPJyZFqEO7LeKIA01rkTUdz+JA==
X-Received: by 2002:a1c:f304:0:b0:3eb:29fe:734a with SMTP id
 q4-20020a1cf304000000b003eb29fe734amr5267748wmq.39.1677968772087; 
 Sat, 04 Mar 2023 14:26:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x21-20020a05600c189500b003e71a6be279sm6073128wmp.37.2023.03.04.14.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 14:26:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 23:25:44 +0100
Message-Id: <20230304222544.20754-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677968772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gJq4mTnMT8KmRjqAx63Kbj40dMMJ2ZTsQnL50fZ/5oo=;
 b=o3K0o2fSCZc25VqNt6SqKBJmfOPlSsJz8G96G8kmArnu2RLbqs46PISWC6Qz4YcZpZ
 6JIE24WsGzDu5QSNaBFmhb2MdHqTWZ+Fjqv5IL+EGNaFvLsOcZaFqSGydFJX3u2uQ/RG
 SqBCHHYz/UydWxIilS9ta9xJyIHtxckTG6gYbQ2pglgtRNqfbhGAPo4zHm7UHxeLUfd2
 Ae3Sg/H8+a7NavnTW6z7HUkVTXSwLPX4CHNImLybQb4Xgkph3kTyyfx9L5XxaZCWRGee
 BsQLarPVTWq13Cl0XFtN7qd+Wn/39X2nbwcC/DZ93xxoGbWIc6VWIz7HO4LVLYuM1DJ5
 88rQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o3K0o2fS
Subject: [Buildroot] [PATCH 1/1] package/quickjs: add QUICKJS_CPE_ID_VENDOR
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

cpe:2.3:a:quickjs_project:quickjs is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aquickjs_project%3Aquickjs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quickjs/quickjs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index a026eec4f0..ff39209100 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -9,6 +9,7 @@ QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
 QUICKJS_LICENSE_FILES = LICENSE
+QUICKJS_CPE_ID_VENDOR = quickjs_project
 QUICKJS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
