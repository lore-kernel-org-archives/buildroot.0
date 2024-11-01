Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD260E6F096
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49EF0406C4;
	Fri,  1 Nov 2024 22:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWfYtmRWS-XO; Fri,  1 Nov 2024 22:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17EA840690
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17EA840690;
	Fri,  1 Nov 2024 22:54:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FCEE112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DC1C40690
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5N4d6WYgFCnY for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:54:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26E4140697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E4140697
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26E4140697
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:54:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9AC2DA4C19EF;
 Fri,  1 Nov 2024 23:54:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34926)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t70X9-000000005lU-3M3s;
 Fri, 01 Nov 2024 22:54:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Fri,  1 Nov 2024 23:54:18 +0100
Message-Id: <20241101225423.278060-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730501664;
 bh=gKvw96rX6D77nT0Gva0qaEQZ1goKr0mJ3wj9pfKAE4I=;
 h=From:To:Cc:Subject:Date:From;
 b=FGZxowYyyL6rXxlnVTuR6yhWpF6oIl/ACoNaFqs6Bw01rInwc4qrsCHYOD8uY1e/v
 KAmcq7C3mS4g6V3bJJq0BqIYXpEwaymb974+g+YTYRDfXWrfx5RO5ip1uVtqDUts08
 av8SYYFb85rYhLCtdpqhR23Edamka1AYvARrNVGPWgwx/Kp92BilhkAiM9RKvB+iJN
 Domc5OO6seqh/IFvvH4NVWuFZFkT3NKEYBHpB05umxp8dt5niqgr0tmAFl611I8Svs
 vo3MShS2ka6zWrFf7aJi53hOwv3jm3KfeAJjIESDG+LtMouDvWGxScrj1De+Q3hUfL
 iGJTMWQ5QHrxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=FGZxowYy
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
