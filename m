Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4860AC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E1D442D5C;
	Fri, 28 Feb 2025 17:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Mmu0MtgABTB; Fri, 28 Feb 2025 17:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D977942D2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D977942D2C;
	Fri, 28 Feb 2025 17:21:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F001DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8A784711B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swxH1PmUFR8z for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3192347203
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3192347203
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29A7680807; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Feb 2025 15:49:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2461b340778c860654c4b6e1cd075842fd9cd717
X-Git-Newrev: 396219f0539817b03437fb7c9394dbfd2d5c2ef9
X-Patchwork-Hint: ignore
Message-Id: <20250228163045.29A7680807@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2024.02.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=396219f0539817b03437fb7c9394dbfd2d5c2ef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4d772ebe75a922695e3c0c71ae7236c89ba76e01)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/CHANGES b/CHANGES
index 272db0af69..b83a30c8b2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -520,6 +520,25 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
+2024.02.11, released February 21st, 2025
+
+	Important / security related fixes.
+
+	Updated/fixed packages: acpica, apache, assimp, asterisk,
+	bind, busybox, clamav, curlpp, dillo, elfutils, ffmpeg, foot,
+	freetype, git, gnutls, go, gpsd, heimdal, imagemagick,
+	intel-microcode, libbsd, libcurl, libopenssl, libtasn1, mdnsd,
+	mpg123, musl, nginx, nodejs, openjpeg, openssh, openvpn,
+	postgresql, python-django, redis, rsync, sdbus-cpp, socat,
+	tor, tzdata, uemacs, unbound, usbutils, webkitgtk, xen, zic,
+	zlog, zmqpp, zstd
+
+	Issues resolved:
+        - OpenSSH 9.8 broken
+          https://gitlab.com/buildroot.org/buildroot/-/issues/11
+        - samba4 build failed in master
+          https://gitlab.com/buildroot.org/buildroot/-/issues/86
+
 2024.02.10, released January 9th, 2025
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
