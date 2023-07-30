Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9011C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 16:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF7BE410D8;
	Sun, 30 Jul 2023 16:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF7BE410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T36SpPNsudfP; Sun, 30 Jul 2023 16:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4154091A;
	Sun, 30 Jul 2023 16:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC4154091A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79D001BF392
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 16:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58C0C4029F
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 16:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58C0C4029F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KlNVReCMZcl for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 16:41:21 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 675ED400D9
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 16:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 675ED400D9
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 00F37A4C0824;
 Sun, 30 Jul 2023 18:41:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41120)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ9Tp-0002Uk-2K;
 Sun, 30 Jul 2023 18:41:17 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 18:41:17 +0200
Message-Id: <20230730164117.3064024-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690735278;
 bh=63Zy4wzWAYO1OX6FOEV5wzGbzjDUfwDo6NbaFjB0hWs=;
 h=From:To:Cc:Subject:Date:From;
 b=ETZICaQStD8ktxR/W1C0Kck2vZz35Lw7MARMoVjFyn5y5pXaQo6N34BIxvbG4s9Qr
 y/gAhj/vYPW7ZU3OOrAYY5h1+9BxnMKEsREKtFaTzDHMhBoq/i/CppZwcUL6dyO7L5
 6mrbwVglVNZt7m+PZEP+RL9cIsRTlfSJjWyjs2PO18v4lx3DcZGaet4MZGAa0MdPZ6
 2bIbI3Euqjl3mu0Qstn4XK5Bhrq18P2j6Xdl2qoR/quE7Cz8gkVsMcvBtUtEMc1mnY
 Nvnz2Q3TSPJaN9j4JOO/MYSPHBMMxlOBWoSH1m9vYyZdy+salTqbDCnI+0f4LLc4Xb
 t4+K8Uae03O2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ETZICaQS
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 8.0.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 6b3dfc22b7..6b71e3819c 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  20770789749ac9ba846df33983dbda22db836c70d9f5d050cb9aa5347094a8fb  harfbuzz-7.3.0.tar.xz
+sha256  c1ce780acd385569f25b9a29603d1d5bc71e6940e55bfdd4f7266fad50e42620  harfbuzz-8.0.1.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 981d911014..3118ec62c9 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 7.3.0
+HARFBUZZ_VERSION = 8.0.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
