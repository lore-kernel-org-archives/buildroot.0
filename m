Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7718C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55C6140605;
	Fri, 28 Jan 2022 21:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3nnVW6XvJJW; Fri, 28 Jan 2022 21:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D4B040BE4;
	Fri, 28 Jan 2022 21:19:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8ED1BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2B3561189
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AF12ZiYHVHkU for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:19:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 786D661194
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:19:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A581582A96; Fri, 28 Jan 2022 21:12:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:12:39 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 42d642acc16c69783a40d1d00d5e5419ae850232
X-Git-Newrev: e81847715fb0e43cd79ef170d22e94938e16c9ef
X-Patchwork-Hint: ignore
Message-Id: <20220128211207.A581582A96@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/clamav: security
 bump to version 0.103.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=e81847715fb0e43cd79ef170d22e94938e16c9ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

ClamAV 0.103.5 is a critical patch release with the following fix:

 - CVE-2022-20698: Fix for invalid pointer read that may cause a crash.
   Affects 0.104.1, 0.103.4 and prior when ClamAV is compiled with
   libjson-c and the CL_SCAN_GENERAL_COLLECT_METADATA scan option (the
   clamscan --gen-json option) is enabled.

https://github.com/Cisco-Talos/clamav/blob/clamav-0.103.5/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f92c093c7a39b8e0d6754c452268b0af20ef860b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index d68b04af76..73f4ff88f1 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  def0ad15500fa6aff81d8e68b9f83aa75ee5b607a01335c1d26dbcc959932f85  clamav-0.103.4.tar.gz
+sha256  1e74b1e1d2a8a9056449c313f48a6983b9d5ba0d6fb5ef0b2be6ad3c841a5426  clamav-0.103.5.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 94b589b975..cd2d06e6b3 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.4
+CLAMAV_VERSION = 0.103.5
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
