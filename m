Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1AEC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:58:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A6B61101
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6A6B61101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6446A6154A;
	Fri,  5 Nov 2021 15:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KHDKnB0AM2S; Fri,  5 Nov 2021 15:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD35F60625;
	Fri,  5 Nov 2021 15:58:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C11F1BF5DA
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AFF5401D9
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecEgkpX-O858 for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 15:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F2CB40012
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 15:58:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 402DF8A651; Fri,  5 Nov 2021 15:54:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 16:51:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8402b5263fd7f1a77128374485053e1bd2a3f667
X-Git-Newrev: 79e3cd1c78ac5f5f886ad587dcbf1d1512fd55ec
X-Patchwork-Hint: ignore
Message-Id: <20211105155414.402DF8A651@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/audit: bump to version 3.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=79e3cd1c78ac5f5f886ad587dcbf1d1512fd55ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with kernel >= 5.15
thanks to
https://github.com/linux-audit/audit-userspace/commit/6b09724c69d91668418ddb3af00da6db6755208c

interpret.c:48:10: fatal error: linux/ipx.h: No such file or directory
   48 | #include <linux/ipx.h>
      |          ^~~~~~~~~~~~~

Indeed, ipx.h has been dropped since
https://github.com/torvalds/linux/commit/6c9b40844751ea30c72f7a2f92f4d704bc6b2927

https://github.com/linux-audit/audit-userspace/blob/v3.0.6/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/1c8a959d8847d8942fbdf148c1b781df0d8bb4dc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 4ef9a42b0d..9e16a339d6 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  994c4250d8fd43f3087a3c2ce73461832e30f1e9b278bf5bb03c3e07091155a5  audit-3.0.1.tar.gz
+sha256  c3e44d77513a42401d417dd0ceb203cf23886cb89402dea7b9494faa3f4fcc5e  audit-3.0.6.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index df6650593d..6c75bca53e 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.0.1
+AUDIT_VERSION = 3.0.6
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
