Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA1DD68B19
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 13:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1541B407EE;
	Thu, 14 Nov 2024 13:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDXD2IJkjuNH; Thu, 14 Nov 2024 13:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF69407F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF69407F1;
	Thu, 14 Nov 2024 13:50:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 991BA6C
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79DD960BB7
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdj3YxFt-LxP for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 13:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A00DD60BB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A00DD60BB9
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:50:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 865F6863AE; Thu, 14 Nov 2024 13:50:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 14:47:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46fa2fcb7a32ef28b1ae9f0ebba01ff1a3c6eacb
X-Git-Newrev: 5eeab05e48521a1e981138b740ed593bc90c313d
X-Patchwork-Hint: ignore
Message-Id: <20241114135042.865F6863AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.08.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5eeab05e48521a1e981138b740ed593bc90c313d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a91b9c7400fcd7813668f2fe6342cbd762c849e6)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 14 ++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 0e27c64ba7..0211e5e22c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -46,6 +46,20 @@
 	- ripgrep leaves /usr/crates2.json / .crates.toml files
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/17
 
+2024.08.2, released November 14th, 2024
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, asterisk, bind, cmake, criu,
+	file, fluidsynth, ghostscript, heimdal, intel-microcode,
+	iproute2, jailhouse, jsoncpp, libarchive, libcurl, libldns,
+	libgit2, liblinear, libmdbx, libopenh264, libpng,
+	libtraceevent, libxml2, ltrace, nethogs, nghttp2, ntp,
+	openjdk, php, postgresql,procps-ng, python-pyqt5, python3,
+	qemu, ruby, sqlite, sysvinit, tor, trace-cmd, wpebackend-fdo
+
+	New packages: python-pyqt5-sip
+
 2024.08.1, released October 20th, 2024
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 25a360d976..c3cb15d727 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.08.1'
+RELEASE='2024.08.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
