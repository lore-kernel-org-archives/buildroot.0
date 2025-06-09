Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613E7C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3273A61B2A;
	Thu, 12 Jun 2025 08:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPBvDfOg2fnQ; Thu, 12 Jun 2025 08:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A81A61B47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A81A61B47;
	Thu, 12 Jun 2025 08:41:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17BB81E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 398C142217
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QflMpOdrz0qx for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D939242228
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D939242228
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D63BA805F4; Thu, 12 Jun 2025 08:38:34 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 20:23:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8297f41ded82cc3be0e0cd2aef5d228cb4cc7f86
X-Git-Newrev: b52ff3766a576752c09b21778a4c767e287e818b
X-Patchwork-Hint: ignore
Message-Id: <20250612083834.D63BA805F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-embeddedsw: add support for
 xilinx_v2025.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b52ff3766a576752c09b21778a4c767e287e818b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for version xilinx_v2025.1 without changing the
default version.  This way, the zynqmp and versal defconfigs can bump
individually from xilinx_v2024.2 to xilinx_v2025.1.

In addition, new software apps were added to the Xilinx/embedddedsw repo.
While they do not change the buildroot xilinx-embeddedsw boot package, the
version xilinx_v2025.1 has a new license.txt file.  For this reason, this
patch adds a hash file for the xilinx_v2025.1 version, so that both the
default xilinx_v2024.2 and xilinx_v2025.1 versions will have independent
hashes for their license.txt files.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..0a42bab314
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  867b7c7652f754d1a3d6edfe76e53223670e2b4c7e4144d4db1604403d68f616  xilinx-embeddedsw-xilinx_v2025.1.tar.gz
+
+# Locally calculated
+sha256  fbee87edd32cf203fdd7925f0bab15c98e2dc1e0d61e70867f1190dc4a605b12  license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
