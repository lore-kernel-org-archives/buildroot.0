Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A70AC433FE
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:20:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DB9361381
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DB9361381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E4A80D85;
	Sun,  7 Nov 2021 20:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tzcizarRYDw; Sun,  7 Nov 2021 20:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2533D80D77;
	Sun,  7 Nov 2021 20:20:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 285BA1BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1862880D77
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q9V_NVy4lbWQ for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:20:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79C8380D71
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:20:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B4BDF8B495; Sun,  7 Nov 2021 20:16:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:17:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 839ae7519215e488f586ef6afac2b61e98734468
X-Git-Newrev: c4b312914f93ab7722553bd2ea79c27b47d20826
X-Patchwork-Hint: ignore
Message-Id: <20211107201628.B4BDF8B495@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/audit: drop autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4b312914f93ab7722553bd2ea79c27b47d20826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit aaca5fa97198fa1836a477f2fb2e3ba5872a0be2 forgot to drop
autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audit/audit.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 6c75bca53e..c89404f570 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -8,8 +8,6 @@ AUDIT_VERSION = 3.0.6
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-# 0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
-AUDIT_AUTORECONF = YES
 AUDIT_CPE_ID_VENDOR = linux_audit_project
 AUDIT_CPE_ID_PRODUCT = linux_audit
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
