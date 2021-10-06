Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598DEC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:55:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F928610A1
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F928610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F054983187;
	Wed,  6 Oct 2021 12:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Zzutdxkfal0; Wed,  6 Oct 2021 12:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5777682B75;
	Wed,  6 Oct 2021 12:55:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9EA1BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB61160E7C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvB8MtaEO1xg for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 12:54:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 263AB60D55
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 12:54:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3B0C492109; Wed,  6 Oct 2021 12:51:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 14:45:41 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 866763c0438324a3e67758246e64e029fba5be80
X-Git-Newrev: 6203e3fbda470424b5058386b86172238bf02f13
X-Patchwork-Hint: ignore
Message-Id: <20211006125133.3B0C492109@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/micropython:
 Update LICENSE info
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

commit: https://git.buildroot.net/buildroot/commit/?id=6203e3fbda470424b5058386b86172238bf02f13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

The various micropython ports may include code licensed under different
licenses compared to the core micropython. List these in MICROPYTHON_LICENSE.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4dc40c21ea2f4c2682855231fe409a74d6cbe911)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index fa28da9be3..03811be714 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -6,7 +6,10 @@
 
 MICROPYTHON_VERSION = 1.14
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
-MICROPYTHON_LICENSE = MIT
+# Micropython has a lot of code copied from other projects, and also a number
+# of submodules for various libs. However, we don't even clone the submodules,
+# and most of the copied code is not used in the unix build.
+MICROPYTHON_LICENSE = MIT, BSD-1-clause, BSD-3-clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi $(BR2_PYTHON3_HOST_DEPENDENCY)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
