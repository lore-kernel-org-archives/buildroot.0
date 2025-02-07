Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15063C0219D
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7BD584977;
	Fri,  7 Feb 2025 21:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTs8SP0fsjfh; Fri,  7 Feb 2025 21:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 307EB849BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 307EB849BD;
	Fri,  7 Feb 2025 21:49:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0EBE1B7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D11F142CAE
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iVbifCp5MGS for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E156142C64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E156142C64
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:49:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBDDA844B6; Fri,  7 Feb 2025 21:49:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 22:45:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b28ec6f4313cc805dfb152e06408f1e7137c2ea6
X-Git-Newrev: c2f65f3a2b0201be14a740eccb189a503125b080
X-Patchwork-Hint: ignore
Message-Id: <20250207214917.CBDDA844B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nxp-mwifiex: fix build failure on
 s390x
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
Content-Type: multipart/mixed; boundary="===============4668788701131472261=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4668788701131472261==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c2f65f3a2b0201be14a740eccb189a503125b080
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x doesn't support Wi-Fi on Linux. See [1]. So let's disable the
package for this architecture.

Fixes: https://autobuild.buildroot.org/results/44aef9d74857d93d90cefb1d59110e857ff4dfaf

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f54bfc0e34dbd15e9df099a8e36a346c6c583f3c

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: add link to kernel commit hiding wireless for s390]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nxp-mwifiex/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nxp-mwifiex/Config.in b/package/nxp-mwifiex/Config.in
index 7399705b28..7d55a1cc21 100644
--- a/package/nxp-mwifiex/Config.in
+++ b/package/nxp-mwifiex/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NXP_MWIFIEX
 	bool "nxp-mwifiex"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  Linux kernel driver from NXP for WiFi chipsets

--===============4668788701131472261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4668788701131472261==--
