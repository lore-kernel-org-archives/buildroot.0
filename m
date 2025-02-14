Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B60C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 18:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB0F6085E;
	Fri, 14 Feb 2025 18:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dpafa-XMbdDd; Fri, 14 Feb 2025 18:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2FE86FC2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2FE86FC2B;
	Fri, 14 Feb 2025 18:08:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 545021E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E88EB40898
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peE_HlnDzT3e for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 18:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EAA0E408B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAA0E408B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAA0E408B6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:08:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07bc.dip0.t-ipconnect.de [91.58.7.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4B474A4C4BE9;
 Fri, 14 Feb 2025 19:07:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33662)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tj062-000000004sZ-2vDB;
 Fri, 14 Feb 2025 18:07:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Lang <dalang@gmx.at>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Fri, 14 Feb 2025 19:07:22 +0100
Message-Id: <20250214180723.37419-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214180723.37419-1-bernd@kuhls.net>
References: <20250214180723.37419-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739556447;
 bh=hWbiP2ZxvpMFZZ/NfU1LOmPr0TKoWQ/657+8kPOcpuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jg6n0TWjRyC3UWd/OcNVyMAUkJtXvsGcnd+9hPZDY0ctF5Qgx7g7JardpfBpqgi4g
 lcDzU89NnXBvwpfaf+9FQjrVXkT8PC+jPULB4kp0YrnyGi/xn/G+2R2Olc1rLYP4st
 EG21r3galreC90rrckwS4WFZ4FF7jhdj+m635Sr8PX7eOCM1bjYQaEm+TFUHsrUtN1
 ano/0mTpGB+J4ARIWCVcls7SNmEXuBiH9k52hHQHrY+Qw+xNm4l4P9057sZ/qoOBfE
 FlXUThWy01ATNOEcBd1fynHi76b6X3u1PjC+w1IMSlXduNeHxoz90iNcgwXQLGX+xF
 l4sWLbwu6rWcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=jg6n0TWj
Subject: [Buildroot] [PATCH 4/5] package/spirv-tools: add host variant
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
 package/spirv-tools/spirv-tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index e863911b03..51b1c9f22a 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -10,6 +10,7 @@ SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERS
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
 SPIRV_TOOLS_DEPENDENCIES = spirv-headers
+HOST_SPIRV_TOOLS_DEPENDENCIES = host-spirv-headers
 SPIRV_TOOLS_INSTALL_STAGING = YES
 
 SPIRV_TOOLS_CONF_OPTS = \
@@ -18,4 +19,11 @@ SPIRV_TOOLS_CONF_OPTS = \
 	-DSPIRV_SKIP_TESTS=ON \
 	-DSPIRV_WERROR=OFF
 
+HOST_SPIRV_TOOLS_CONF_OPTS = \
+	-DSPIRV-Headers_SOURCE_DIR=$(HOST_DIR) \
+	-DSPIRV_TOOLS_BUILD_STATIC=OFF \
+	-DSPIRV_SKIP_TESTS=ON \
+	-DSPIRV_WERROR=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
