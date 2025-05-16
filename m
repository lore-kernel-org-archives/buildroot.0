Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D89C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 19:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C75861354;
	Fri, 16 May 2025 19:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyZFbv0E4Bac; Fri, 16 May 2025 19:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D58561364
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D58561364;
	Fri, 16 May 2025 19:25:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0994E1F5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1F4A60A95
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SZSkIAtOl0Z for <buildroot@buildroot.org>;
 Fri, 16 May 2025 19:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95CA8608BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95CA8608BE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:25:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84EF986D6D; Fri, 16 May 2025 19:25:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 21:24:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 585eeb464018f2c5865b71251df83e10a02cb8b0
X-Git-Newrev: 0645c83cd6a6d2caf1fdc62cbed81023fb509a2a
X-Patchwork-Hint: ignore
Message-Id: <20250516192540.84EF986D6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/Config.in: introduce
 i.MX91 silicon revision
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0645c83cd6a6d2caf1fdc62cbed81023fb509a2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit introduces the silicon revision number configuration.
This value will be used by packages for specific configurations
(such as security firmware).

Signed-off-by: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
[Julien: split original commit 1/3]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/Config.in | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 6d196a052d..77d6547cec 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -93,6 +93,21 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
 
 endchoice
 
+choice
+	prompt "i.MX 91 Silicon Revision"
+	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
+	help
+	  Some packages related to the selected i.MX platform need to
+	  know the silicon revision of the platform they will run on.
+
+	  Note - mismatches may result in a failure to boot!
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
+	bool "imx91a0"
+
+endchoice
+
 choice
 	prompt "i.MX 93 Silicon Revision"
 	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
