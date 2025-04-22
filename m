Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8897FC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A63405A2;
	Tue, 22 Apr 2025 21:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOKcB9n-Cu94; Tue, 22 Apr 2025 21:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E76740983
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E76740983;
	Tue, 22 Apr 2025 21:25:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 932AB1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 792A8411A1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwQ853EfrSUQ for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:25:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9F5A4004A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9F5A4004A
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD3C886189; Tue, 22 Apr 2025 21:25:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 23:24:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b59d64c50d3d8bd486ac72a4c71bc3a9dd08e420
X-Git-Newrev: d65ceed345089383b6af2d0b32c4dcab4a2998d2
X-Patchwork-Hint: ignore
Message-Id: <20250422212515.AD3C886189@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Add changes for 2024.11.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d65ceed345089383b6af2d0b32c4dcab4a2998d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Colin Evrard <colin.evrard@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit c9e65c2cd7d81f775bf17b2e480c7e86fe419c3b)
[Anrout: drop Makefile changes]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/CHANGES b/CHANGES
index 836871373c..92c976fb97 100644
--- a/CHANGES
+++ b/CHANGES
@@ -77,6 +77,50 @@
 	- samba4 build failed in master
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/86
 
+2024.11.4, released April 22nd, 2025
+
+	Important / security related fixes:
+
+	- xserver_xorg-server & xwayland: CVE-2024-9632, CVE-2025-26594,
+	    CVE-2025-26595, CVE-2025-26596, CVE-2025-26597,  CVE-2025-26598
+	    CVE-2025-26599, CVE-2025-26600, CVE-2025-26601.
+	- exim: CVE-2025-30232.
+	- mbedtls: CVE-2025-27809, CVE-2025-27810.
+	- augeas: CVE-2025-2588.
+	- libarchive: CVE-2024-57970, CVE-2025-1632, CVE-2025-25724.
+	- xwayland: CVE-2024-31081, CVE-2024-31083, CVE-2024-9632,
+	    CVE-2025-26594, CVE-2025-26595, CVE-2025-26596,
+	    CVE-2025-26597, CVE-2025-26598, CVE-2025-26599,
+	    CVE-2025-26600, CVE-2025-26601
+	- libopenh264: CVE-2025-27091.
+	- libmodsecurity: CVE-2025-27110.
+	- tinyxml2: CVE-2024-50615.
+
+	Updated/fixed packages:
+
+	libgeos, freerdp, libsoup3, cairo, linux, apr, mali-driver,
+	libcoap, python-fastapi, python-twisted, tor, mc, linux-header,
+	linux-tools.
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
+	- support/download/svn: use 'svn info' whith LC_ALL=C**.
+	- dillo: Fix an issue related to _SITE url for make show-info.
+	- kconfig: Handle backspace (^H) key.
+	- pkg-stats: add -v/--verbose option
+
+	Build issues/problems solved for:
+
+	freeswitch, glibc, v4l2loopback, ls1028ardb, ls1028ardb,
+	mesa3d-demos.
+
 2024.11.3, released March 24st, 2025
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
