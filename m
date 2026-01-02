Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CF1FA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F385180981;
	Fri,  2 Jan 2026 20:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oENNi6-UCzuJ; Fri,  2 Jan 2026 20:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AABB80999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387371;
	bh=H5PFvAlHmU9XAj3NFA5HGMdJncYlQ+N/6KlTZryCLpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l1EL791DSGPNh4LkwJYlrlIAGsrBYN0uVHLePhMDvKN3i5yaFwRAY4VYDcXNDoo47
	 ujPFZSb1MzBMiPIcNwW0w6dRbnm42tdvdtUc0St6OFvRhkI4S6rZNTFOjD+k+Xjef0
	 EDp1wTEnZqbKyGIHshAuxkfLANpT1oIcnFHs7wOkqq12skPPNwTIhgepRweYoZYVpx
	 VMdcniMFjOm+L1UPeeaSeVUKBQGMDKjYUzOWZFnsDVRRikSZfzH5E13TXxm00uc+1B
	 y90gaVgoXCEGlx9d+YtW4xH+uASZtAj5p+NO+hrZ3guVz2JNCgIwW+vo7GNMEewem6
	 7xYcpWd0DMj/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AABB80999;
	Fri,  2 Jan 2026 20:56:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8C1F19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA9C48097A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3q4-6z5Zu6Ca for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098D28096F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 098D28096F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:56:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFC0F8805E; Fri,  2 Jan 2026 20:56:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 21:55:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b12ef59c57c30f945b4606be41df5e7fe31764b
X-Git-Newrev: 5333fe8b46794e10738c59e171e7a33f3a3d4d62
X-Patchwork-Hint: ignore
Message-Id: <20260102205608.EFC0F8805E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oath-toolkit: bump version to
 2.6.13
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5333fe8b46794e10738c59e171e7a33f3a3d4d62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the release announcement, see:
https://mail.gnu.org/archive/html/oath-toolkit-help/2025-07/msg00000.html

The COPYING license file had minor updates in [1] and other license
files were removed from the source archive. This commit reflects those
changes.

[1] https://codeberg.org/oath-toolkit/oath-toolkit/commit/e0fcb3b73d788f0cafdaff0a069e8273d9987777

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/oath-toolkit/oath-toolkit.hash | 13 +++++--------
 package/oath-toolkit/oath-toolkit.mk   |  8 ++------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/package/oath-toolkit/oath-toolkit.hash b/package/oath-toolkit/oath-toolkit.hash
index a89dd6bb94..d44b7bb742 100644
--- a/package/oath-toolkit/oath-toolkit.hash
+++ b/package/oath-toolkit/oath-toolkit.hash
@@ -1,12 +1,9 @@
 # After checking pgp signature from:
-# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.12.tar.gz.sig
+# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.13.tar.gz.sig
 # using key A3CC9C870B9D310ABAD4CF2F51722B08FE4745A2
 # From release announce:
-# https://mail.gnu.org/archive/html/oath-toolkit-help/2024-10/msg00002.html
-sha1  0bfb6ad29d59628487c9e180c7a43f4ca301e4d1  oath-toolkit-2.6.12.tar.gz
-sha256  cafdf739b1ec4b276441c6aedae6411434bbd870071f66154b909cc6e2d9e8ba  oath-toolkit-2.6.12.tar.gz
+# https://mail.gnu.org/archive/html/oath-toolkit-help/2025-07/msg00000.html
+sha1  62807099befb8141e429d3e38750772041ea9056  oath-toolkit-2.6.13.tar.gz
+sha256  5b5d82e9a4455206d24fcbd7ee58bf4c79398a2e67997d80bd45ae927586b18b  oath-toolkit-2.6.13.tar.gz
 # Locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  liboath/COPYING
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  oathtool/COPYING
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  pam_oath/COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/oath-toolkit/oath-toolkit.mk b/package/oath-toolkit/oath-toolkit.mk
index 5e8fabb05b..37b00a8241 100644
--- a/package/oath-toolkit/oath-toolkit.mk
+++ b/package/oath-toolkit/oath-toolkit.mk
@@ -4,14 +4,10 @@
 #
 ################################################################################
 
-OATH_TOOLKIT_VERSION = 2.6.12
+OATH_TOOLKIT_VERSION = 2.6.13
 OATH_TOOLKIT_SITE = https://download.savannah.nongnu.org/releases/oath-toolkit
 OATH_TOOLKIT_LICENSE = GPL-3.0+ (tools), LGPL-2.1+ (libraries)
-OATH_TOOLKIT_LICENSE_FILES = \
-	COPYING \
-	liboath/COPYING \
-	oathtool/COPYING \
-	pam_oath/COPYING
+OATH_TOOLKIT_LICENSE_FILES = COPYING
 OATH_TOOLKIT_CPE_ID_VENDOR = nongnu
 OATH_TOOLKIT_CPE_ID_PRODUCT = oath_toolkit
 OATH_TOOLKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
