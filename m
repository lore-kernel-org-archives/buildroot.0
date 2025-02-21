Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB549C021B3
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 16:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D0080DA0;
	Fri, 21 Feb 2025 16:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1G8RmAKaYfY; Fri, 21 Feb 2025 16:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 973FD80C7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 973FD80C7A;
	Fri, 21 Feb 2025 16:44:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1D46D92
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 16:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82FF960706
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 16:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWvakGH4SH9I for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 16:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 539C4606F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539C4606F8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 539C4606F8
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 16:44:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc6a.dip0.t-ipconnect.de [79.214.204.106])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 821C9A4C4F15;
 Fri, 21 Feb 2025 17:44:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54578)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tlW8U-000000003JJ-3skB;
 Fri, 21 Feb 2025 16:44:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Lang <dalang@gmx.at>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Fri, 21 Feb 2025 17:44:18 +0100
Message-Id: <20250221164422.47060-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1740156263;
 bh=fUzo7Rwa3McL58jeJVDfFTn2GrhvhaVq+bN6vyWpkK8=;
 h=From:To:Cc:Subject:Date:From;
 b=JFmc/HL3acl3FFJhY2X/WjRnaEOFIGvfaZTCmZKoPg1n+UJ3qTHySyjrFPDR6e99z
 AHd+gjQvp58pVATMARJac0Ayufpu3iJNYTHjkucTTp02zkwrMxisXl0aydNIhHzAos
 P4pX38anikv8CeSrNGb73sDfvLPqVwU20RDp58tfKhy0FPTbgCkLb9EN9NWvH9mnFm
 3C8c4xuJZuTHTWOgRjvocklgZQMBn6RphiTkLEiGIQpMT4RcLgmR7ZZ7lDkJHm54rf
 UyRxfnpMlOkZ6B5H8u63vZC9HxCJBylp7Q/4J3CS1b+KRCN9N8D8QOh2/6GBdOYkQ9
 5BmQDg1zupgSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=JFmc/HL3
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
