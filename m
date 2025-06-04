Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B444C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A698A83BF9;
	Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ltcc5KBAJzZ2; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C772683BE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C772683BE8;
	Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFFD2183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1EFB83C15
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOjL0dAdgWun for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D7C83BD1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05D7C83BD1
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3D9A8354A; Thu, 12 Jun 2025 20:12:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 22:46:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0a0600590fd732ba5e6484d55c90499549503e95
X-Git-Newrev: c3bb99048c340b676b00bbe281cce929b89b15b3
X-Patchwork-Hint: ignore
Message-Id: <20250612201228.F3D9A8354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/freescale-imx/Config.in: introduce i.MX91 silicon revision
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c3bb99048c340b676b00bbe281cce929b89b15b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This commit introduces the silicon revision number configuration.
This value will be used by packages for specific configurations
(such as security firmware).

Signed-off-by: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
[Julien: split original commit 1/3]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0645c83cd6a6d2caf1fdc62cbed81023fb509a2a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
