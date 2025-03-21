Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E634C36002
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 17:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E29F40DA0;
	Fri, 21 Mar 2025 17:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cge_OhG4q_65; Fri, 21 Mar 2025 17:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E87412D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67E87412D7;
	Fri, 21 Mar 2025 17:35:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A226E2
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C54840475
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id He17XAeoquU4 for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 17:35:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AFE2400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AFE2400C5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AFE2400C5
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:35:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5f9.dip0.t-ipconnect.de [79.214.197.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7520A4C362F;
 Fri, 21 Mar 2025 18:34:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50732)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tvgGd-000000008Lx-1M0k;
 Fri, 21 Mar 2025 17:34:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Lang <dalang@gmx.at>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Fri, 21 Mar 2025 18:34:43 +0100
Message-Id: <20250321173447.71453-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742578487;
 bh=fUzo7Rwa3McL58jeJVDfFTn2GrhvhaVq+bN6vyWpkK8=;
 h=From:To:Cc:Subject:Date:From;
 b=XgeoUkLP3r00+hD8WP1FfUOBWb0m9frqi4HC0Im9EUFXwA/pD29ewnzlP+CV4BeQ0
 gvHp5UWHhyet0NXQc1YOJXCk/W3QZ/SuHllYmkVu5xvJlYNWq+Dixa43F8YOnGfrYP
 /lpsFPzvXi/0TUpv/l6lCI0OC8QxCESIADL1ycUWfDlBRdHenEv/b0jg0NMSDe3cSU
 7iTjcYxpVOiJfr9HAIyRQAIEYo9pGJ/gFbSIAHkKvRy5fF7n/dyHr7m7PqhszWvK8J
 VrWi2jwZiizhftlAzS84MzxW8wb9INirBwPuJ4QV1YOkDxR4cfnD/EJ3KS3Dq9rbC9
 h8fR/VpNIyKhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=XgeoUkLP
Subject: [Buildroot] [PATCH v2 1/5] package/libdrm: add host variant
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

host-libdrm is needed by host-mesa3d (introduced by this patch series),
which is needed by (target) mesa3d, when enabling the Gallium Iris
driver since version 24.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Clarified why host variant is needed (Julien)

 package/libdrm/libdrm.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 9d463ca01e..a8a912859e 100644
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
