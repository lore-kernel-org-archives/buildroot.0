Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBB4D68B36
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 16:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3185E40630;
	Thu, 14 Nov 2024 16:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tl7cyStWY-9t; Thu, 14 Nov 2024 16:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB574071B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BB574071B;
	Thu, 14 Nov 2024 16:39:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8310C1ED5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A52780B7B
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLo9HvVLp6lF for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 16:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9EF480B93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9EF480B93
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D913863E2; Thu, 14 Nov 2024 16:39:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 17:37:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7ed78badc49a8b3613d51414e0e6745fbd3b24f
X-Git-Newrev: 945f3f6c450a16659af5d7a818b5a738f687fb7b
X-Patchwork-Hint: ignore
Message-Id: <20241114163956.9D913863E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.8
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
