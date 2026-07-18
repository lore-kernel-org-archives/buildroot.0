Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1367C4451B
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 12:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BBEE80EFC;
	Sat, 18 Jul 2026 12:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvN6cyvDfwtE; Sat, 18 Jul 2026 12:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65AE680F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784379346;
	bh=O34HcuBzq/ZtzipCWJyn2AfWHxQ7iF4FyYyBDZrPv+M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VicP26QzEsQPq65SsgBhvBiC6gKbU/M+Akg+wyTo3ZNyP8TAI0w9b4Du2s55U/jfs
	 9uIRw4NegkUoySm/2tYf9O3A0qkz1Nn0/orbfBzDBM4rTCgUfBSribyJQ90zYYhPzn
	 dYkZqPxqAkEphCGWIfTlvbhd409TkpjyYtJZTlO7d37T9t/WrabSYGXgL553Exnj0d
	 QpJs82Qd/3U0GolWr9aPydIfIRbREqcaPeZss07RSlzfcE1JRgyUweO0BqWf9I8rCw
	 IqmL6Pbht7PL7cS4OCjdY83BIQv7bhAiFlqzAzh2Lf4wtKT7RMXiQSr3sUksNhnZ+P
	 fn/7gu2f9FF/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65AE680F02;
	Sat, 18 Jul 2026 12:55:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4E0536E
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 12:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9172E40076
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 12:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mifsQCWYkbM for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 12:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB0740054
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DB0740054
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 12:55:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C282E88DA0; Sat, 18 Jul 2026 12:55:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Jul 2026 14:32:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac4e557628d9d9d1c6f1b520e5e7a4581476d923
X-Git-Newrev: 8faa8ad7be0d9883af81872a44e563d5a32a6415
X-Patchwork-Hint: ignore
Message-Id: <20260718125507.C282E88DA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: bump to 25.11.2 version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8faa8ad7be0d9883af81872a44e563d5a32a6415
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release note of the new versions:
- https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#release-notes
- https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#id1

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/dpdk.hash | 2 +-
 package/dpdk/dpdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
index 7e8ef0674c..adafe2dac6 100644
--- a/package/dpdk/dpdk.hash
+++ b/package/dpdk/dpdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  52e90d2a531ef3ded0283bd91abc94980698f1f6471fa09658a0217cf6609526  dpdk-25.11.tar.xz
+sha256  418bfe3212640ee95a1cb10af6ed360cad2387686fe2721f8a3a9cd02d5ef4f2  dpdk-25.11.2.tar.xz
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
 sha256  ec514554f1b9e90c4f55167267c22da9d511f884877c32a5b18bee6b7c8b18cd  license/exceptions.txt
 sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 080f924329..147bdb23d3 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DPDK_VERSION = 25.11
+DPDK_VERSION = 25.11.2
 DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
 DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
