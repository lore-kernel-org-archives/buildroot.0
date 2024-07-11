Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913A9C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 20:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E3736066D;
	Thu, 11 Jul 2024 20:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJWfYMv1obh7; Thu, 11 Jul 2024 20:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F410607B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F410607B7;
	Thu, 11 Jul 2024 20:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8EDB1BF2A4
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D697783EF8
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 20:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZYkAUrXyEZj for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 20:52:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6ECF983EFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ECF983EFF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ECF983EFF
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 20:52:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AAB47B0053E;
 Thu, 11 Jul 2024 22:52:41 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 22:52:37 +0200
Message-ID: <20240711205237.979583-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720731163;
 bh=4kxyVHqiFqG0E9ntyrpGZABD56P8GKNGcJTTKmGmb+o=;
 h=From:To:Cc:Subject:Date:From;
 b=EO+HW3jmv2Nn7BNwHKdhwgsCGUzScd1M5AOYPscm6L1TBumKVMiW9FCLRAnK5FNsv
 X8lpQ6G7qYIXXSFtOABNZwxjKMLg5SyA3Xs4RQWgG+hqkjtwG+qm6PJdJr1+7rrf7W
 bV2Q6g/iSmfKkV8hHk3Jw5xksCx870tL91yGwstbg6ZL7vpOYm7OzInDVYvSO7576z
 tPnVHFTmI8lngjcC6jjHgaMEoD32ERt4EGW7LyHzMsHJEfyU/qoMrZdZXaY2VM3cuB
 4mMA5h2Zowv/zGpFoBSxmpOWkitSeF1X89arW+DxhBegwARIWM0havRGcXrdyedYmN
 KeDqRKdbJiRGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EO+HW3jm
Subject: [Buildroot] [PATCH 1/1] package/ed: bump to version 1.20.2
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://lists.gnu.org/archive/html/bug-ed/2024-04/msg00003.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 5deb5e74ef..d1d99309c6 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2024-01/msg00000.html
-sha256  c6030defe6ae172f1687906d7354054c75a6a9130af319d4e73c50a91959c5a6  ed-1.20.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2024-04/msg00003.html
+sha256  65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523  ed-1.20.2.tar.lz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index edfadf02a6..704744359a 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.20
+ED_VERSION = 1.20.2
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
