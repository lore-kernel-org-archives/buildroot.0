Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00CDC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 18:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 649FF61093;
	Wed, 21 Dec 2022 18:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 649FF61093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCuT7DbtTUhp; Wed, 21 Dec 2022 18:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE9FF61089;
	Wed, 21 Dec 2022 18:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE9FF61089
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AFF21BF94D
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E810A61089
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E810A61089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dS-8JlPqBIlO for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 18:01:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07BA760BD0
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 18:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07BA760BD0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA58E86C5D; Wed, 21 Dec 2022 18:01:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 18:58:34 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: fed0532cb8be5cee9f4c929fee6a49ffc4258847
X-Git-Newrev: e16a6a0dfa030c7cd7e93648862edcd3aa30cbfe
X-Patchwork-Hint: ignore
Message-Id: <20221221180153.EA58E86C5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/intel-microcode:
 security bump version to 20221108
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

commit: https://git.buildroot.net/buildroot/commit/?id=e16a6a0dfa030c7cd7e93648862edcd3aa30cbfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fixes the following security issues:

- CVE-2021-0146: Hardware allows activation of test or debug logic at
  runtime for some Intel(R) processors which may allow an unauthenticated
  user to potentially enable escalation of privilege via physical access.

  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00528.html

- CVE-2021-0127: Insufficient control flow management in some Intel(R)
  Processors may allow an authenticated user to potentially enable a denial
  of service via local access.

  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00532.html

- CVE-2022-21151: Processor optimization removal or modification of
  security-critical code for some Intel(R) Processors may allow an
  authenticated user to potentially enable information disclosure via local
  access.

  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00617.html

- CVE-2022-0005: Sensitive information accessible by physical probing of
  JTAG interface for some Intel(R) Processors with SGX may allow an
  unprivileged user to potentially enable information disclosure via
  physical access.

  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00614.html

- CVE-2022-21233: Improper isolation of shared resources in some Intel(R)
  Processors may allow a privileged user to potentially enable information
  disclosure via local access.

  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00657.html

For more details, see the release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/blob/main/releasenote.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: extend commit message with security fix details]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f83377b7b30c82da363c7937f693fe979318f598)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 6687d4c0eb..56f0237277 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fd85b6b769efd029dec6a2c07106fd18fb4dcb548b7bc4cde09295a8344ef6d7  intel-microcode-20210608.tar.gz
+sha256  8d14a914815f56c27b1f41be0fd699d1afcfdbc05432056427e455100798975e  intel-microcode-20221108.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index af7f6fa804..787537da78 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20210608
+INTEL_MICROCODE_VERSION = 20221108
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
