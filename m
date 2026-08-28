Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C77CC61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D6E6811C7;
	Fri, 28 Aug 2026 14:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xPZidzdRk86; Fri, 28 Aug 2026 14:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927180;
	bh=ydw3ZHwCz08HtOznVI8171Fs3UJwvfFGuKtsa7mctNA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZWyXb/q2PGwq7lAE1YcXWjuLNqoWACM63hqm0Q0nt0Cpj9JJdCxUbptQLJODz+V4x
	 n1KiKn5NkhwAVshfMEy+XwVsuIuoabdEYV7v73mm0WSafxeo94xPFblMARS0ERp4h9
	 +eEYLRrgi4/nWsTo0R7LeHsHeFt17wi0hdw3YdZk/jTrOC83Gzsx60bw7wapHHf0jE
	 c83cf2dINbsFyESixxHXlVFnsrdRt7bX7ByRtduQgp6oDVkAMz5rU877STUDSPul23
	 NPURVL0lZaRnjUoSBh9pYH4NH8lDxl1uF41gEqFrhbd9k4IYppgkPrchVenrFeJHaI
	 5LbqPYLnE7Kvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7879F811ED;
	Fri, 28 Aug 2026 14:26:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 924CAD28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 784736072E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-SJ3K2llsKj for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6501760826
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63636921F9; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c267ef53bc00fb7226c757d95ca3eedf26601c3b
X-Git-Newrev: e419b2bcfce5b3b05380001e34a88c8315be77c0
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.63636921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/putty: security
 bump to version 0.85
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e419b2bcfce5b3b05380001e34a88c8315be77c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Release notes:
https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html

THe release notes has 4 security related fixes. No CVE assigned.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: mark the commit as "security" related]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 131952483b10e53c443f90b089fc7a050b2eeef8)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/putty/putty.hash | 8 ++++----
 package/putty/putty.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 362467e2d7..8a9dc4b5aa 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
-# Hashes from: https://the.earth.li/~sgtatham/putty/0.84/{sha1,sha256,sha512}sums
-sha1  d3ed01106667b42de322b266266e0d21b70adf12  putty-0.84.tar.gz
-sha256  06057862ae198f1dbd219d0c7493080d59f606194bb5056c549e342aa01b69fe  putty-0.84.tar.gz
-sha512  647c84490c01f8c0f9cf02f565081d80ea2ea4fb90207cfb2fbe13ba5e8c3cea7c4807504363d3d3a851df5edb6087c3b39084820bf20e818dd551db54af0765  putty-0.84.tar.gz
+# Hashes from: https://the.earth.li/~sgtatham/putty/0.85/{sha1,sha256,sha512}sums
+sha1  a9f0b3ed9b90a9f48615eb446a626fa107e33267  putty-0.85.tar.gz
+sha256  13fd4db2936d03b73812a7bcc2a658e4dd29cc776a56c3670a7fc6f1a0ee8af8  putty-0.85.tar.gz
+sha512  f52c3f580a0b9e52cb65c0bfddfa834f7362af22ac8c1a3803cefb11e43e35887b98209ae32d2abc0b56c2d0ddcc03c08b42542ce72989c1dc3ef116c19d761b  putty-0.85.tar.gz
 
 # Locally calculated
 sha256  3b02f87e0063430289d9681727a98818c844fc8a4d79b24b76047fa061e77f13  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 82b16b250c..5df29714b7 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.84
+PUTTY_VERSION = 0.85
 PUTTY_SITE = https://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
