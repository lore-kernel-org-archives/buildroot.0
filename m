Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4078C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 08:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 829BE607FC;
	Sat,  4 Dec 2021 08:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLMcomEraUM0; Sat,  4 Dec 2021 08:53:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCC7D60810;
	Sat,  4 Dec 2021 08:53:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1F931BF5E9
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1F026080B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cgsTs8qorbSN for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 08:53:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEE43607FC
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 08:53:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t9so10860641wrx.7
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 00:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zRVDkbpN/Y/Sh3fpm4wyIQ3UGgI0q+sCMX/Oqek9zUA=;
 b=HUUK0R2CXf0Eb4qnFfXxtfaUWPMpR0Oq1DAsvCq3AI2dcM3OEZSZZ0YtyI1+EH2/iT
 JP080wxiqHbgBkzhX5oM8Ue3dbxr2Yu/KjRTIafIzWwDEOXzbso69ZSBAyy2iW6i5+4o
 axeS7fN+gNYoEcbcRTR6geK46wuDmt4VdG/QmzOxV25n8QlNA/f5MlwIdMIrDQqysivL
 axIVP5CDG4mKtK6sxt3xUvAZFs0e/GpOpp5ZxXOp7sbDGGlRC4dFpKQ/f8pAeu8IVlmZ
 kWJjkrmoVWUoOTiBuxFyyxVigmVtxpj4ba6cOkiMHyfy++3HOdSCD0agOJoz/Kn8DS2c
 E22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zRVDkbpN/Y/Sh3fpm4wyIQ3UGgI0q+sCMX/Oqek9zUA=;
 b=wJGDp8Ejk1OqhtNp1ea7iJ6Xs/VjE92VPaijWFFjxnmLSoqOSKQv5Kg8bZ65Gb5CDi
 p/AiX4ceDiMTTGACZVu43euIgOp3rrVaRfdTTQN36r0FZ/HYdY5U2/Py88l0rNJCqZ6Y
 8if/sEBmqfNzL81l+e17nPCNM3yTd4H9/95WYCqVDdLi9XC5h57f2aLMg34ASi4t2Iho
 dQ7lyB9AHwu2GLclAIjpLbXE5SGJSDnwiwbSv2l39ystpHGG1r3XG/5wEt4wUk9bH6nv
 rHwnGz27BdAYXnwon1e9yazkumTYsGWivm0TT2srIL4mjxdB5OTJ4amkQHZMt1gS+y3z
 8WrA==
X-Gm-Message-State: AOAM531ljemwoDKSP9lx+oWOU2hgVHovTsPx/GPplZbGPFCjRmzMexjH
 HynaV/ivU+vcrKjEPiFRHOS2lT/adPfgBw==
X-Google-Smtp-Source: ABdhPJzdEqu4PQsjwCOJxIskDNim8cJR7rCAO+ojJZvO90VZNHQaa5K2u5YRUPngieMLsbIyB3T3fw==
X-Received: by 2002:adf:e3c3:: with SMTP id k3mr26636022wrm.599.1638608008783; 
 Sat, 04 Dec 2021 00:53:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id r83sm7559966wma.22.2021.12.04.00.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 00:53:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 09:53:38 +0100
Message-Id: <20211204085338.2015391-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libhtp: add LIBHTP_CPE_ID_VENDOR
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

cpe:2.3:a:oisf:libhtp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoisf%3Alibhtp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libhtp/libhtp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 382750ea79..532eaa340b 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -8,6 +8,7 @@ LIBHTP_VERSION = 0.5.39
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
+LIBHTP_CPE_ID_VENDOR = oisf
 LIBHTP_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	zlib
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
