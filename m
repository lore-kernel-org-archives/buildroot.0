Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82584C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B6D47169;
	Fri, 28 Feb 2025 16:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQKULfPSUrIY; Fri, 28 Feb 2025 16:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 452BC41687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452BC41687;
	Fri, 28 Feb 2025 16:41:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D8C711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2D58425A5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_zsju4eilKh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9625F424DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9625F424DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91D0E844AB; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Dec 2024 21:06:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fdea0d10dc5f95f4dcf7884177a42f3662d55a8c
X-Git-Newrev: cf8e9610c51a61cc8913356ba073b67f546c9717
X-Patchwork-Hint: ignore
Message-Id: <20250228162942.91D0E844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linuxptp: bump version
 to 4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf8e9610c51a61cc8913356ba073b67f546c9717
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The released package is no longer available under sourceforge. So we
switch the download URL to the official download page [1]. Also the info URL
about the package source is changed to the official LinuxPTP project page [2].

The release note [3] and annoucement on the mailinglist [4] give more
information about the changes.

[1] http://downloads.nwtime.org/linuxptp/
[2] https://linuxptp.nwtime.org/about/features/
[3] https://www.nwtime.org/news/linuxptp-4.4-released/
[4] https://lists.nwtime.org/sympa/arc/linuxptp-devel/2024-09/msg00020.html

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[Julien:
  - switch _SITE to https
  - keep the original _SOURCE using _VERSION
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linuxptp/Config.in     | 2 +-
 package/linuxptp/linuxptp.hash | 2 +-
 package/linuxptp/linuxptp.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
index c88b7a0619..5f2f267bf1 100644
--- a/package/linuxptp/Config.in
+++ b/package/linuxptp/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LINUXPTP
 	  Linux kernel. Supporting legacy APIs and other platforms is
 	  not a goal.
 
-	  http://linuxptp.sourceforge.net/
+	  https://linuxptp.nwtime.org/about/features/
 
 comment "linuxptp needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index 1d5c590ea7..06ba8eb12b 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  70e38e5d2764e0217443da6f14e8846fe401a472293ac138d8419c07a665447a  linuxptp-4.2.tgz
+sha256  61757bc0a58d789b8fcbdddf56c88a0230597184a70dcb2ac05b4c6b619f7d5c  linuxptp-4.4.tgz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index eea41f0baf..a537eac4cc 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 4.2
+LINUXPTP_VERSION = 4.4
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
-LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
+LINUXPTP_SITE = https://downloads.nwtime.org/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
 LINUXPTP_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
