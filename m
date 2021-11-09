Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4F1C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:03:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A070611BD
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A070611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7E6C80C40;
	Tue,  9 Nov 2021 10:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiIBbZnrYyCl; Tue,  9 Nov 2021 10:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 499D080BE6;
	Tue,  9 Nov 2021 10:03:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7BF1BF9A4
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D72180BB2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOP9lckVcq8B for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:03:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E2CF80B90
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:03:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EAA238B7BE; Tue,  9 Nov 2021 09:59:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 10:54:36 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f177ad5ae99a8e29fa0316f26129d2192c5fe8ab
X-Git-Newrev: bc3da522ed19577ef99414c1699c46642fb7d2c4
X-Patchwork-Hint: ignore
Message-Id: <20211109095933.EAA238B7BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/socketcand: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc3da522ed19577ef99414c1699c46642fb7d2c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Don't override SOCKETCAND_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2bb820cb9ef7d52dd97504761c13fc5e65fe556a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socketcand/socketcand.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index b11aa3c91e..dbf859d3f9 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -11,7 +11,7 @@ SOCKETCAND_LICENSE = BSD-3-Clause or GPL-2.0
 SOCKETCAND_LICENSE_FILES = socketcand.c
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
-SOCKETCAND_DEPENDENCIES = libconfig
+SOCKETCAND_DEPENDENCIES += libconfig
 else
 SOCKETCAND_CONF_OPTS = --without-config
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
