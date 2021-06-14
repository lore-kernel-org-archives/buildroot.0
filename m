Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A990C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:07:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC8C60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEC8C60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B41B460904;
	Tue,  3 Aug 2021 23:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enYmLsC5uvbW; Tue,  3 Aug 2021 23:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E1A860884;
	Tue,  3 Aug 2021 23:07:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 190551BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49BA34065F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFoRoLZ8nxVl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5AE040620
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1A19A8674F; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Jun 2021 22:16:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 19727355cb9ddfd1c0dfc985246eff7fd0d92e54
X-Git-Newrev: c82446b03e8d590a772d0357655ff43518b052ae
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.1A19A8674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/intel-microcode:
 security bump to version 20210608
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0594558537435944946=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0594558537435944946==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c82446b03e8d590a772d0357655ff43518b052ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issues:

- CVE-2020-24489: A potential security vulnerability in some Intel®
  Virtualization Technology for Directed I/0 (VT-d) products may allow
  escalation of privilege.  Intel is releasing firmware updates to mitigate
  this potential vulnerability.
  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00442.html

- CVE-2020-24511: Potential security vulnerabilities in some Intel®
  Processors may allow information disclosure.  Intel is releasing firmware
  updates to mitigate these potential vulnerabilities.
  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00464.html

- CVE-2020-24513: A potential security vulnerability in some Intel Atom®
  Processors may allow information disclosure.  Intel is releasing firmware
  updates to mitigate this potential vulnerability.
  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00465.html

For more details, see the release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20210608

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 23191d9531..6687d4c0eb 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b855c81f78705f35341248a0603aa1a6e199ca7f59cd425e061b579329aa9eaa  intel-microcode-20210216.tar.gz
+sha256  fd85b6b769efd029dec6a2c07106fd18fb4dcb548b7bc4cde09295a8344ef6d7  intel-microcode-20210608.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 2089003880..af7f6fa804 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20210216
+INTEL_MICROCODE_VERSION = 20210608
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license

--===============0594558537435944946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0594558537435944946==--
