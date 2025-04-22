Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCD3C369D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1215440CBC;
	Tue, 22 Apr 2025 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAOm8916aEFD; Tue, 22 Apr 2025 21:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E96EC40CE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E96EC40CE5;
	Tue, 22 Apr 2025 21:47:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BF0F1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB4A9411A1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WSPZyc9L8LP for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 114064116C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 114064116C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:47:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE4C3861A2; Tue, 22 Apr 2025 21:47:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 23:33:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ea8757fa59c0c9112b16ec1b20eaaf24c9c9c34
X-Git-Newrev: af34a630d0be0581043212e423cdbb0f4224e515
X-Patchwork-Hint: ignore
Message-Id: <20250422214719.EE4C3861A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.13
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af34a630d0be0581043212e423cdbb0f4224e515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Colin Evrard <colin.evrard@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit e687e3815f76c1c5ea9fb52b6558bedfe53ab117)
[Arnout: drop Makefile changes]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/CHANGES b/CHANGES
index 92c976fb97..3694c1d93f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -680,6 +680,50 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
+2024.02.13, released April 22nd, 2025
+
+	Important / security related fixes:
+
+	- xserver_xorg-server & xwayland: CVE-2024-9632, CVE-2025-26594,
+	    CVE-2025-26595, CVE-2025-26596, CVE-2025-26597,  CVE-2025-26598,
+	    CVE-2025-26599, CVE-2025-26600, CVE-2025-26601.
+	- exim: CVE-2025-30232.
+	- mbedtls: CVE-2025-27809, CVE-2025-27810.
+	- augeas: CVE-2025-2588.
+	- libarchive: CVE-2024-57970, CVE-2025-1632, CVE-2025-25724.
+	- libopenh264: CVE-2025-27091.
+	- libmodsecurity: CVE-2025-27110.
+	- tinyxml2: CVE-2024-50615.
+	- libndp: CVE-2024-5564.
+	- xwayland: CVE-2024-31080, CVE-2024-31081, CVE-2024-31083,
+	    CVE-2024-9632, CVE-2025-26594, CVE-2025-26595,
+	    CVE-2025-26596, CVE-2025-26597, CVE-2025-26598,
+	    CVE-2025-26599, CVE-2025-26600, CVE-2025-26601.
+	- libfreeglut: CVE-2024-24258, CVE-2024-24259.
+
+	Updated/fixed packages:
+
+	libsoup3, linux, apr, mali-driver,
+	libcoap, python-fastapi, python-twisted, tor, linux-header,
+	linux-tools, libmodsecurity
+
+	Test Improvements:
+
+	- linux-tools: selftests: Add path containing BPF binary.
+	- testing: add git runtime test.
+
+	Infrastructure updates/fixes:
+
+	- DEVELOPERS: change arnout's address.
+	- DEVELOPERS: add Dario Binacchi for ti-k3-boot-firmware.
+	- support/download/svn: use 'svn info' whith LC_ALL=C.
+	- dillo: Fix an issue related to _SITE url for make show-info.
+	- kconfig: Handle backspace (^H) key.
+	- pkg-stats: add -v/--verbose option
+
+	Build issues/problems solved for:
+	glibc, mesa3d-demos.
+
 2024.02.12, released March 24st, 2025
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
