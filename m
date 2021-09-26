Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FED9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BC9760F24
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BC9760F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25E574035C;
	Sun, 26 Sep 2021 21:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JNHk0SpfcKk; Sun, 26 Sep 2021 21:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F73E4037C;
	Sun, 26 Sep 2021 21:03:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8BBF1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18E3440327
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DA7PYmBRfUn for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B0E9402ED
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 161088D2AF; Sun, 26 Sep 2021 20:57:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:54:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a47f332a20bf3f79ef4903c8ddd2b7917217e354
X-Git-Newrev: 4dc40c21ea2f4c2682855231fe409a74d6cbe911
X-Patchwork-Hint: ignore
Message-Id: <20210926205757.161088D2AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: Update LICENSE info
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dc40c21ea2f4c2682855231fe409a74d6cbe911
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The various micropython ports may include code licensed under different
licenses compared to the core micropython. List these in MICROPYTHON_LICENSE.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
