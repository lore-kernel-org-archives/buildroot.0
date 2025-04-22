Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E78CC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1CAB607AB;
	Tue, 22 Apr 2025 19:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYV_6IV94baw; Tue, 22 Apr 2025 19:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C58660E62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C58660E62;
	Tue, 22 Apr 2025 19:20:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06FD41BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E149860E62
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZRSwDA8GOCD for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44D1960D62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44D1960D62
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:20:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 364E386115; Tue, 22 Apr 2025 19:20:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 21:11:43 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 361c6d14f00e092b88a1142f4a08b4440e75b193
X-Git-Newrev: c9e65c2cd7d81f775bf17b2e480c7e86fe419c3b
X-Patchwork-Hint: ignore
Message-Id: <20250422192050.364E386115@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] CHANGES: Add changes for
 2024.11.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9e65c2cd7d81f775bf17b2e480c7e86fe419c3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Colin Evrard <colin.evrard@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES  | 44 ++++++++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9cc41fd14d..3f2644f624 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,47 @@
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
diff --git a/Makefile b/Makefile
index c0a8aa3c02..68fee2eb40 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.11.3
+export BR2_VERSION := 2024.11.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1742834500
+BR2_VERSION_EPOCH = 1745347000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
