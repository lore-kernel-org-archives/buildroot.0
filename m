Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04A9C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:05:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84406600CD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84406600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EFB04059C;
	Tue,  3 Aug 2021 22:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPx0iZ0iqBb7; Tue,  3 Aug 2021 22:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEB2140593;
	Tue,  3 Aug 2021 22:05:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04A741BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5804B40482
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_fRlfdYKHvf for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9131340477
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DA14C85E95; Tue,  3 Aug 2021 21:09:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 May 2021 19:49:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e0ba7321f808d812268cb6b9127302cbdd6f62bf
X-Git-Newrev: e87d5f643bee82a1907fef0316a1775059858dcf
X-Patchwork-Hint: ignore
Message-Id: <20210803210939.DA14C85E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/intel-microcode:
 security bump to version 20210216
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e87d5f643bee82a1907fef0316a1775059858dcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issues:

- CVE-2020-8696: Description: Improper removal of sensitive information
  before storage or transfer in some Intel(R) Processors may allow an
  authenticated user to potentially enable information disclosure via local
  access

- CVE-2020-8698: Description: Improper isolation of shared resources in some
  Intel(R) Processors may allow an authenticated user to potentially enable
  information disclosure via local access

https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00381.html

License file updated with the new year, so change hash accordingly.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: explain license hash change]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/intel-microcode/intel-microcode.hash | 4 ++--
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 289428b4b3..23191d9531 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e42a264b7b86e80d013d6d00062467352c1f37e0aaea10fe5b51e4d8687921ab  intel-microcode-20201118.tar.gz
-sha256  d9e989e1a7747f3ce93cb749aceca67a430d36c9bebc6e3205e0b3af3ca6304b  license
+sha256  b855c81f78705f35341248a0603aa1a6e199ca7f59cd425e061b579329aa9eaa  intel-microcode-20210216.tar.gz
+sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 5a13ca2cbe..2089003880 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20201118
+INTEL_MICROCODE_VERSION = 20210216
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
