Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B6CC5DF7D
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 11:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 270C180E14;
	Tue, 18 Aug 2026 11:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f627YI6ic6Jc; Tue, 18 Aug 2026 11:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46B8580E25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787050849;
	bh=eg4TX704jD4rrDHXtFq30jJUSsqqyG1m7wqlbGcHUbg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WxskYzku2HSpORSpaXYDBgPcP8fCeDr+YgyWz/90reXRSxIhdQsQj7x/gglxKECNY
	 ZgxahP2ePXm9e4uL2epHlHgUrxa2WceJOmXw7f+wG7nn2/YlF27TU7n87Jc2fNl+J7
	 ZWRgYlLmJ6ajEZf5zXm9ZU68+Hb60dvYeLk7r42Gulzhdd0pXVUSJ/nQFio870G1pR
	 YgeTCqVUCnH7h2fL1SpIAx7RN85HwxTXFCOroqSngHGHl1BDqMKOqj0KhZ0t9To0uz
	 SdIAEsdT7FDart35hwLSAriM8OH/6LKGj3+4uZ8yt+NAcm/Jidp0664T44l9kKajnD
	 euwqO0jSMvjcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46B8580E25;
	Tue, 18 Aug 2026 11:00:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DF2A237
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 11:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 848224069D
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 11:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbA2l6M7fVaJ for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 11:00:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E77E540695
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E77E540695
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E77E540695
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 11:00:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9T1-1x5Jyy1AGX-00FyXf; Tue, 18
 Aug 2026 13:00:41 +0200
To: buildroot@buildroot.org
Date: Tue, 18 Aug 2026 13:00:25 +0200
Message-ID: <20260818110025.876790-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:GY+R1tnD3+6i4UUdvBGtIAdtVrdn4VCjoJ2vMXCvfQEzAMnjai8
 kTRjdZhny5oIQjSp9FbBFOLV63W3JpV+mBJlRMdgi/ALreLi4PpNUxplo6MXAbe6EJIXwYE
 aB5I1yJY5gC3LSI4w7jqztEKikbxWA7JR9GZs8qayHIe6Grympt7CHcemKD5vjtRYNq4b1V
 9nnH/H1hVnyCz4DgIlZJw==
UI-OutboundReport: notjunk:1;M01:P0:ntp/KQN+Plw=;syiqE9ProzrnJH6YUAJ0cPaXT0H
 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
Subject: [Buildroot] [PATCH 1/1] package/dracut: disable dracut-cpio if
 host-rustc is not available
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thierry Bultel <tbultel@free.fr>,
 "Fiona Klute \(Othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

Since upstream commit 89a86dcb0a3248606824de50f5c63f61cfe0369c (first
release: 106) if cargo exists on PATH the Dracut configure script
enables building dracut-cpio by default, and calls "cargo --version"
to check if cargo works. This fails on the autobuilders:

error: rustup could not choose a version of cargo to run, because one wasn't specified explicitly, and no default is configured.
help: run 'rustup default stable' to download the latest stable release of Rust and set it as your default toolchain.
dracut couldn't find cargo for dracut-cpio build

The affected configs either don't have BR2_PACKAGE_HOST_RUSTC enabled,
or build-time.log.gz shows host-rustc was not installed before the
host-dracut build, so presumably the "cargo" that produces the rustup
error is an external one already installed on the autobuilders.

To fix this, enable dracut-cpio only if BR2_PACKAGE_HOST_RUSTC=y, and
add a dependency on host-rustc in that case. According to the
documentation [1, see "enhanced_cpio"] dracut-cpio is supposed to
optimize archive creation for copy-on-write filesystems, so it should
not matter much for Buildroot. The --disable-dracut-cpio option was
added in upstream commit 4a4ab928a49e81e02104ec5466160664e59c3965
(same release).

Fixes: https://autobuild.buildroot.org/results/5f557d708cce997e7f039f17e30640b02ba9180a/
Fixes: https://autobuild.buildroot.org/results/f04ca3c4598f62a7e87d84bc111eb8b161b34a70/
(and more)

[1] https://dracut-ng.github.io/dracut/man/dracut.conf.5.html#_configuration_options

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/dracut/dracut.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 0bf755319e..1b356a5092 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -13,6 +13,13 @@ DRACUT_CPE_ID_VALID = YES
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
 HOST_DRACUT_INSTALL_OPTS = systemdsystemunitdir="" install
 
+ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
+HOST_DRACUT_CONF_OPTS += --enable-dracut-cpio
+HOST_DRACUT_DEPENDENCIES += host-rustc
+else
+HOST_DRACUT_CONF_OPTS += --disable-dracut-cpio
+endif
+
 define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 	mv $(HOST_DIR)/bin/dracut $(HOST_DIR)/bin/dracut.real
 	sed -e "s%@@TARGET_CROSS@@%$(TARGET_CROSS)%" \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
