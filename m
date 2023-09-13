Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D49EDEC4D
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 13:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7387827D9;
	Wed, 13 Sep 2023 13:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7387827D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYkO4MFJnULt; Wed, 13 Sep 2023 13:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C793582360;
	Wed, 13 Sep 2023 13:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C793582360
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A22221BF5F8
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 13:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A72441D6C
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 13:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A72441D6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzdV2JnEClfc for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 13:17:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C7B841D6B
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 13:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C7B841D6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A77086DE7; Wed, 13 Sep 2023 13:17:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 15:09:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f46d1c7d9f632faf2d120f2934218202b96e07ed
X-Git-Newrev: 70c694ef492f7d816c12a6c1d2418c4b0e94095e
X-Patchwork-Hint: ignore
Message-Id: <20230913131738.5A77086DE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/clamav: security
 bump to version 0.103.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=70c694ef492f7d816c12a6c1d2418c4b0e94095e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following security issue:

- CVE-2023-20197: A vulnerability in the filesystem image parser for
  Hierarchical File System Plus (HFS+) of ClamAV could allow an
  unauthenticated, remote attacker to cause a denial of service (DoS)
  condition on an affected device.  This vulnerability is due to an
  incorrect check for completion when a file is decompressed, which may
  result in a loop condition that could cause the affected software to stop
  responding.

For details, see the announcement:
https://blog.clamav.net/2023/07/2023-08-16-releases.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 27f9b16a39..e8173cd0f9 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6f49da6ee927936de13d359e559d3944248e3a257d40b80b6c99ebe6fe8c8c3f  clamav-0.103.8.tar.gz
+sha256  bd9345671c8089b2bbbd8c34be3bca04cffa3142cf7a3afc12527037dfd3aa88  clamav-0.103.9.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 0f0491bf0d..c4ef395cec 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.8
+CLAMAV_VERSION = 0.103.9
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
