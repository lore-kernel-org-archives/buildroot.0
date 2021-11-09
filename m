Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C01C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:00:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C62E61130
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C62E61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF58540110;
	Tue,  9 Nov 2021 10:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBSUopjjfLYe; Tue,  9 Nov 2021 10:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52F264022B;
	Tue,  9 Nov 2021 10:00:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C67351BF9A4
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1FC180C7F
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6lpdlU8lrMa for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FD3A80BB8
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BB09C8B79B; Tue,  9 Nov 2021 09:56:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 10:51:46 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 49a21ecfcd5dbe53235567090102f895afda0feb
X-Git-Newrev: 965b0248df5e22039daba7320a766ff64e3b0b8d
X-Patchwork-Hint: ignore
Message-Id: <20211109095622.BB09C8B79B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/samba4: security
 bump version to 4.14.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=965b0248df5e22039daba7320a766ff64e3b0b8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes CVE-2020-17049:
https://www.samba.org/samba/history/samba-4.14.9.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 825bf865293e4e5251dae7d65e94e03f906d79b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index f33b61e262..a571ba79f4 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.14.8.tar.asc
-sha256  c936b782c2aced8cd7299c13bec67c495fd4affdb217a6ed6150f4fd6d770fde  samba-4.14.8.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.14.9.tar.asc
+sha256  7fb11818ef7f9bb817a3b21019358b1469aec98799057cc9e55933563361c409  samba-4.14.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3faeb88e09..83eb2dacda 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.14.8
+SAMBA4_VERSION = 4.14.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
