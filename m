Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C82AE7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 20:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE250410B7;
	Tue, 17 Dec 2024 20:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdzkshTPdfuT; Tue, 17 Dec 2024 20:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 749ED4133B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 749ED4133B;
	Tue, 17 Dec 2024 20:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A54BCC5
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 20:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BA93410B7
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 20:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beYYkc2yMTdF for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 20:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B334133B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77B334133B
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 20:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 594FA87314; Tue, 17 Dec 2024 20:09:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Dec 2024 21:06:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdea0d10dc5f95f4dcf7884177a42f3662d55a8c
X-Git-Newrev: cf8e9610c51a61cc8913356ba073b67f546c9717
X-Patchwork-Hint: ignore
Message-Id: <20241217200955.594FA87314@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linuxptp: bump version to 4.4
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
