Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C530FD767FB
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 20:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F04160D5F;
	Thu, 31 Oct 2024 20:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2pe249BfyTd; Thu, 31 Oct 2024 20:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EDA860D5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EDA860D5B;
	Thu, 31 Oct 2024 20:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D643F5E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C458140F4D
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0p1G_WHP2Rc for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 20:05:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5D0A40F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5D0A40F4B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5D0A40F4B
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:05:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 563D1A4C10A7;
 Thu, 31 Oct 2024 21:05:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60236)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t6bPh-000000001WT-2PEz;
 Thu, 31 Oct 2024 20:05:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Daniel Lang <dalang@gmx.at>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Thu, 31 Oct 2024 21:04:56 +0100
Message-Id: <20241031200501.1107802-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730405102;
 bh=gKvw96rX6D77nT0Gva0qaEQZ1goKr0mJ3wj9pfKAE4I=;
 h=From:To:Cc:Subject:Date:From;
 b=G7ymg1efsUloamQ9/Yr+ecEUBMH0reR/wGUo3eeohAW5iAGAuQR9PkjVlDsX76PQo
 Iify85fJzFVW+hjbCtS6He+/Wow5MLNI0Dubi4oidgen97uF2re9yDyVC6l0Pj2489
 nsuSib2Fx+lp1+CXsiTsGYmgaQYH/idxsoiQCgmlyFQVxUkXRVhvS/eSsRPCQr/7fr
 7rA/TC4QNFDDfSgTI8mYRsNZc9cxlRVINYDXlAC+7YOHXl/Q6LdeooqmcZ32nyZ6XY
 P1aut6OOfeqAXgd2DjULyNMaiX/9bVptzHHrfx1M6DAfV8oX9mVmrpspW1myaN5Kkb
 W8YqVSpAVW5hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=G7ymg1ef
Subject: [Buildroot] [PATCH 1/6] package/libdrm: add host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for mesa3d bump to 24.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index fcf7f17e78..021a575474 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -116,4 +116,25 @@ else
 LIBDRM_CONF_OPTS += -Dtests=false
 endif
 
+HOST_LIBDRM_CONF_OPTS = \
+	-Damdgpu=disabled \
+	-Dcairo-tests=disabled \
+	-Detnaviv=disabled \
+	-Dexynos=disabled \
+	-Dfreedreno=disabled \
+	-Dfreedreno-kgsl=false \
+	-Dinstall-test-programs=false \
+	-Dintel=disabled \
+	-Dman-pages=disabled \
+	-Dnouveau=disabled \
+	-Domap=disabled \
+	-Dradeon=disabled \
+	-Dtegra=disabled \
+	-Dvc4=disabled \
+	-Dvmwgfx=disabled \
+	-Dtests=false \
+	-Dudev=false \
+	-Dvalgrind=disabled
+
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
