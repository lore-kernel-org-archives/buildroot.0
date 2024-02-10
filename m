Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D226C48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 22:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF9A814BA;
	Sat, 10 Feb 2024 22:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiW8eG2NoIqr; Sat, 10 Feb 2024 22:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D50815CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D50815CC;
	Sat, 10 Feb 2024 22:29:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8733E1BF290
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 22:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81AD8815CC
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 22:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5BKe2TY-k0Y for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 22:29:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72477814BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72477814BA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72477814BA
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 22:29:50 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D23AA13F861;
 Sat, 10 Feb 2024 23:29:45 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 23:29:40 +0100
Message-ID: <20240210222940.806905-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707604188;
 bh=bI6DUPlFZNkRMtMTkZTuMKUfMpRxr/qetG9XSJW+oiw=;
 h=From:To:Cc:Subject:Date:From;
 b=uw6OvHojvJ+9UrqONs7JVd/HZPwtfSadRu0aGGd1eEPv6oX8sz53pyf0rVxpqrQY2
 LYocndsaaPA74wxlSeiNud4BcFwOr55773fVgCJ0/mXWfM/u60aPRwoCbjshx57/kO
 /UqGKsKBjpNl0GHEh4zwOblC6RdJ3sdDNiTGFMSQQsVBJqTz/iL95OVHGWEFYF0ee6
 aK5kSI5CSTnlCMZUZEQ13JCgeNxiXcYsEfkNAt3GgIIxUT3Rers78GYfbhHp61xTWt
 LaQEhn+W6L8vmazcYRcNFrOa+soKSZY2Czzq+/dGTrC4n5Ec01eGg0rT/7VExhiZmK
 A24KD8uUA7mrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uw6OvHoj
Subject: [Buildroot] [PATCH 1/1] package/jailhouse: bump to commit e57d1ef
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
Cc: Julien Olivain <ju.o@free.fr>, Carlo Caione <carlo.caione@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last Jailhouse tag is v0.12. It dates from 2020-02-04, which is
4 years old. This version no longer compiles with recent Kernels.

This commit updates Jailhouse to the latest commit e57d1ef, which
dates from 2023-01-10.

For commit logs, see:
https://github.com/siemens/jailhouse/commits/master/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jailhouse/jailhouse.hash | 2 +-
 package/jailhouse/jailhouse.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
index 297d0f1930..96d5819847 100644
--- a/package/jailhouse/jailhouse.hash
+++ b/package/jailhouse/jailhouse.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3777a553c2acb2b693843fe4d16ab80333879daedd47d9c9f3717c9644e6cf93  jailhouse-0.12.tar.gz
+sha256  38ea5d2d9672ce7f76fd0c163edaa8968711aca58f245aec3c8934f140e828b6  jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560.tar.gz
 sha256  3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index c239e75e76..907ad92c0f 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JAILHOUSE_VERSION = 0.12
-JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
+JAILHOUSE_VERSION = e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560
+JAILHOUSE_SITE = $(call github,siemens,jailhouse,$(JAILHOUSE_VERSION))
 JAILHOUSE_LICENSE = GPL-2.0
 JAILHOUSE_LICENSE_FILES = COPYING
 JAILHOUSE_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
