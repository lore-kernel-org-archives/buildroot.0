Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D464C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490544F10B;
	Fri, 28 Feb 2025 16:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wNnrfRDOA7x; Fri, 28 Feb 2025 16:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB484F110
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BB484F110;
	Fri, 28 Feb 2025 16:34:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B1268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E6341A33
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdzCCO2djxC2 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238B841807
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 238B841807
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F80487A86; Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Dec 2024 22:01:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eb24a208f774a2f4eab59a327899ad7b0519a853
X-Git-Newrev: 8807493d63817a62df2fe90a84c6b54a514f0e3a
X-Patchwork-Hint: ignore
Message-Id: <20250228162934.1F80487A86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2024.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=8807493d63817a62df2fe90a84c6b54a514f0e3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d37527ba498c34508b9f3fede34135686c94581e)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3816e5e13d..3c20d6bc9e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -488,6 +488,24 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
+2024.02.9, released December 8th, 2024
+
+	Important / security related fixes.
+
+	Updated/fixed packages: alsa-lib, android-tools, babeld,
+	bmap-tools, boost, ebtables, expat, fbv, foot, frr, gamin,
+	gnutls, intel-microcode, irssi, libcurl, libkrb5, libmodbus,
+	libvpl, linux-tools, lmbench, mbedtls, mosquitto, musl,
+	musl-compat-headers, nfs-utils, ntp, php, postgresql,
+	procps-ng, python-psycopg2, python-sip, qt6base, quagga,
+	rt-tests, sshguard, systemd, tiff, x11vnc
+
+	Issues resolved:
+	- procps-ng: builderror in 2024.08
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/38
+	- fbv package download link is broken in long term support branch
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/73
+
 2024.02.8, released November 14th, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
