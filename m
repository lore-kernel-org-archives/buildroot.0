Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011A3D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB7E4115E;
	Thu, 11 Dec 2025 19:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjuxrLdyqvNr; Thu, 11 Dec 2025 19:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD6041151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481411;
	bh=s1Otj9p4+9Mr38Z2lEArAJDmSteC3kS+I7aBtKNzaQA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pA32BovTRPcvMVvIRCJSq+it4y2hE6xVV4cxW/wMLfQjNqNPbHI7sqVE1azcH5kF+
	 1hoSwY74pABzlt7f14uFEoM1IPHQ7ajuNl5loNz2lv4LHlZEB0Rl6lZe6yQr5IkvWU
	 oSpUgwQS1GuoX8IbEwEmvFfCwyiUDdbgpMNlFKfn4v7Qu6ffy2gm28MduQmK6mg454
	 jD1zWGlkD1dxYeVv4ITiKHHR7dCOVxYU/cKsKyXsjpVpxxZMwLIV4HodqZd8fshzZx
	 yYKKQybKJ9kodWB0pWzcq8TY8gKG9OKAqs4gQShhupVKSxJcjBK7CVHUKjxhmEeOdK
	 IJKxPaWO8Qa2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBD6041151;
	Thu, 11 Dec 2025 19:30:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 137AF2E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9AA7410C0
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgmqSo5kraKt for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B33410B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43B33410B2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42DC186BE7; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:34 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 032e91d9ea7487e6c2adbce57cd60f21cb8f0cc3
X-Git-Newrev: 2270004c9b206d4a94e59c779e7b6e52399a768b
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.42DC186BE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/unzip: bump to
 Debian patch level -29 to fix GCC 15.x issues
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2270004c9b206d4a94e59c779e7b6e52399a768b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

unzip currently fails to build with GCC 15.x. We're already fetching
from Debian, using patchlevel -27, and it turns out that Debian
patchlevel -29 has the GCC 15.x fix, and very few other fixes:

unzip (6.0-29) unstable; urgency=medium

  * Ignore invalid "Total number of disks" field on Microsoft ZIP64 files.
    Closes: #661956, #1064000.
  * Drop conflicting declarations of gmtime() and localtime().
    Should fix build with gcc-15. Closes: #1098043.
  * Fix zipgrep handling of escapes. Closes: #1054628.
  * Stop using update-mime. Closes: #1072396.
  * Add debian/source/lintian-overrides for *.a files.
  * Do not trim Debian changelog.
  * Add debian/salsa-ci.yml.
  * Add Vcs-Git and Vcs-Browser fields.
  * Update Standards-Version.

unzip (6.0-28) unstable; urgency=medium

  * Drop debian/source/lintian-overrides, obsolete since version 6.0-18.
  * Update URI for Info-ZIP license in copyright file.
  * Update standards version to 4.6.2.
  * Run wrap-and-sort.
  * Update Homepage.

So let's just bump to this patchlevel version.

Note that the .dsc file link in the .hash file was wrong, it was still
referring to patchlevel -26.

Fixes:

  https://autobuild.buildroot.net/results/d81cb9d7c9e87dd233dde350d15cb03427ba2036/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd:
 Updated _SITE from /debian-debug/ to /debian/ (Baruch)
 Updated comment of UNZIP_IGNORE_CVES to reflect bump.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 15bb41a461d798484387ecd824225a3577d29a55)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/unzip/unzip.hash | 4 ++--
 package/unzip/unzip.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index bbf4f7d71f..0b371e5454 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip/unzip_6.0-26.dsc
+# From https://snapshot.debian.org/archive/debian/20250311T215724Z/pool/main/u/unzip/unzip_6.0-29.dsc
 sha256  036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37  unzip_6.0.orig.tar.gz
-sha256  67bde7c71d52afd61aa936d4415c8d12fd90ca26e9637a3cd67cae9b71298c12  unzip_6.0-27.debian.tar.xz
+sha256  14043e5ea351c02b3bc8676e1e6d20d79b9a690b6d7520e8138ac629cc048417  unzip_6.0-29.debian.tar.xz
 
 # Locally computed:
 sha256  7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b  LICENSE
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 5effebee4a..8dccaf6ce3 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -6,13 +6,13 @@
 
 UNZIP_VERSION = 6.0
 UNZIP_SOURCE = unzip_$(UNZIP_VERSION).orig.tar.gz
-UNZIP_PATCH = unzip_$(UNZIP_VERSION)-27.debian.tar.xz
-UNZIP_SITE = https://snapshot.debian.org/archive/debian/20220916T090657Z/pool/main/u/unzip
+UNZIP_PATCH = unzip_$(UNZIP_VERSION)-29.debian.tar.xz
+UNZIP_SITE = https://snapshot.debian.org/archive/debian/20250311T215724Z/pool/main/u/unzip
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 UNZIP_CPE_ID_VALID = YES
 
-# unzip_$(UNZIP_VERSION)-27.debian.tar.xz has patches to fix:
+# unzip_$(UNZIP_VERSION)-29.debian.tar.xz has patches to fix:
 UNZIP_IGNORE_CVES = \
 	CVE-2014-8139 \
 	CVE-2014-8140 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
