Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3849BC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05CBF8130C;
	Sun, 11 Feb 2024 21:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhi1_457C5r3; Sun, 11 Feb 2024 21:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A08481F3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A08481F3E;
	Sun, 11 Feb 2024 21:49:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEAD01BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C2F68130C
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSN9YZx9WLgx for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:49:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2C4680B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C4680B87
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2C4680B87
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:49:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A6A1313F879;
 Sun, 11 Feb 2024 22:49:42 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:49:35 +0100
Message-ID: <20240211214935.1603160-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707688185;
 bh=XMJC52cXrKLxVVNZbNGkxcbw7YN62PRke5W0bYxauoc=;
 h=From:To:Cc:Subject:Date:From;
 b=NfFWn95bB4I4vfncSdnq277+fGKYpTm3+JwXSMpFWQaUSs4F+UT0TMsDHFXa/ebhV
 GM3XKkmuJxbHYqyd2+4O5GQy8nv5IwBxpL7RYNp0K3OWLbCj/ahdR49NvEhg3SAc55
 R+UorKcTzIbLKerFXX7JMzltSz0lVgVQ0pp9VCFL21oaLrvCWGQyqIkTW7nqDPZ7MS
 Xt4xjxmajGEiKDOPsayF6EoSSOA6MdH3dDqTsC6/JotDfX7DJLefpOi4CplBrKF1dZ
 dqHQPOALbmN0j6WJTrBC/e69B2r6QpLnwAESWc5b9Kl+xeQh91M9E0BQP7uJ8rXECe
 5oRKo6Di5zyXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NfFWn95b
Subject: [Buildroot] [PATCH 1/1] package/gnu-efi: bump to version 3.0.17
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For commit logs, see:
https://sourceforge.net/p/gnu-efi/code/ci/3.0.17/log/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnu-efi/gnu-efi.hash | 6 +++---
 package/gnu-efi/gnu-efi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 251a99e5d7..7d98650991 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5  192d94e995ddd4ebdce4903adfd06039  gnu-efi-3.0.15.tar.bz2
-sha1  40c8a4715cf8c409a093c8d2ca9f5d5b24d73058  gnu-efi-3.0.15.tar.bz2
+md5  832496719182e7d6a4b12bc7c0b534d2  gnu-efi-3.0.17.tar.bz2
+sha1  9715285022124b231520d58b26709f5ab338e981  gnu-efi-3.0.17.tar.bz2
 # Locally computed
-sha256  931a257b9c5c1ba65ff519f18373c438a26825f2db7866b163e96d1b168f20ea  gnu-efi-3.0.15.tar.bz2
+sha256  7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4  gnu-efi-3.0.17.tar.bz2
 sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 686a14be01..8b9a6aa4c6 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.15
+GNU_EFI_VERSION = 3.0.17
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
