Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A8CC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC79B60BD7;
	Sun, 13 Nov 2022 21:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC79B60BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPruSHvmUEES; Sun, 13 Nov 2022 21:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E1B460C01;
	Sun, 13 Nov 2022 21:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E1B460C01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 372021BF86C
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1323280B4C
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1323280B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ci9-8l6c8oG9 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:23:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E8DB80B49
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E8DB80B49
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BCE7837E4; Sun, 13 Nov 2022 21:23:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:16:57 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 2ea33143716c2c3024c1f0012b8618d4080a584e
X-Git-Newrev: d9cfe1e805c47cf635128a5386dd90f46e86146e
X-Patchwork-Hint: ignore
Message-Id: <20221113212342.2BCE7837E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/udisks: install
 to staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9cfe1e805c47cf635128a5386dd90f46e86146e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

UDisks2 provides a Library API [1] for accessing the UDisks2 service
via "libudisks2.so". For development of UDisks2 clients, install to
staging as well!

[1] http://storaged.org/doc/udisks2-api/2.9.4/ref-library.html

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f66221589fe9a2107f1ef4709875bb8efdb41d2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udisks/udisks.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 2bf519a2cc..959333d01f 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -10,6 +10,7 @@ UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisk
 UDISKS_LICENSE = GPL-2.0+
 UDISKS_LICENSE_FILES = COPYING
 UDISKS_CPE_ID_VENDOR = freedesktop
+UDISKS_INSTALL_STAGING = YES
 
 UDISKS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
