Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF7FC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00526424E6;
	Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cf3OPrDXD4tD; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5BEC4240B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5BEC4240B;
	Fri, 28 Feb 2025 16:29:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59FD868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38A8441881
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XRlQYhjIEUm for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2144640DCB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2144640DCB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1893787A71; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 17:37:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a7ed78badc49a8b3613d51414e0e6745fbd3b24f
X-Git-Newrev: 945f3f6c450a16659af5d7a818b5a738f687fb7b
X-Patchwork-Hint: ignore
Message-Id: <20250228162929.1893787A71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2024.02.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=945f3f6c450a16659af5d7a818b5a738f687fb7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e843fa764bfbdd64e6b15344a01014c6dccf0ce9)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/CHANGES b/CHANGES
index 0211e5e22c..a53bfdd69d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -438,6 +438,19 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
+2024.02.8, released November 14th, 2024
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, asterisk, bind, bootgen, criu,
+	file, fluidsynth, ghostscript, heimdal, intel-microcode,
+	jailhouse, jsoncpp, libarchive, libcurl, libldns, liblinear,
+	libmdbx, libopenh264, ltrace, lightning, nghttp2, ntp, php,
+	postgresql, procps-ng, python-pyqt5, ruby, sysvinit, tor,
+	wpebackend-fdo
+
+	New packages: python-pyqt5-sip
+
 2024.02.7, released October 21th, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
