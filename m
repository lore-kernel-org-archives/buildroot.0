Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22D1E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 21:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E1FE40729;
	Sun,  8 Dec 2024 21:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qw_V5OdVi4fS; Sun,  8 Dec 2024 21:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BAAA40728
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BAAA40728;
	Sun,  8 Dec 2024 21:25:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C45AD979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FF1B40A47
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-dmkRh2jdIm for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 21:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81D6B40A51
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81D6B40A51
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:25:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65BBC86BF9; Sun,  8 Dec 2024 21:25:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Dec 2024 22:01:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb24a208f774a2f4eab59a327899ad7b0519a853
X-Git-Newrev: 8807493d63817a62df2fe90a84c6b54a514f0e3a
X-Patchwork-Hint: ignore
Message-Id: <20241208212532.65BBC86BF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.9
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
