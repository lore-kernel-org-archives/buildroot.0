Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AFEC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 954DA60661;
	Thu, 11 Jul 2024 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Y_rFTEzsfHP; Thu, 11 Jul 2024 21:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A59B1607B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A59B1607B7;
	Thu, 11 Jul 2024 21:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCC861BF2A4
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9E6141154
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uT_zCngqXtp for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 21:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67E7C41150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67E7C41150
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67E7C41150
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 21:02:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 94C68B0053D;
 Thu, 11 Jul 2024 23:02:07 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 23:01:51 +0200
Message-ID: <20240711210151.986453-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720731728;
 bh=g+wQapNjxS5lrch4jHIJVZROJEUzZEQMeJwvYQkJFJY=;
 h=From:To:Cc:Subject:Date:From;
 b=dcBPw0wa1H+KI3UsKw10a9FiDQ753B10cwWAbLyDz8Olp5XmH6PAuXtQ1DYFC/rbX
 7Cl2cjDsk3W5dJ47iqfIRMM8m04GY66n3XbXkB5q/Txv6J9JPRBs7LlGdsclhJfMFx
 sYgmG8QUE7SiyRpcD3WyExObaP2EPDXHarhK2O61kg6HNsqLx7j04rxvOBXK1+89Xp
 MHAUWMEwlTSCvuiBxG6wAx4xcpgBKHMdTTZ4C4FoZnEtft5zIAJ6ZS5jx2C/AinuJp
 oSrZfYjauQ8nc3a3LIfwsmfzX6fsJ1pGjxJ04j4OdRV0RJN0V4nexoVXD7/HoBirEZ
 vMCHNIWrZNeDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dcBPw0wa
Subject: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.5.3
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

For change log, see:
https://github.com/Linaro/OpenCSD/blob/v1.5.3/README.md?plain=1#L329

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index 43a5a38683..9800d21377 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  ef27fe6afa6402b051aeae5c2827fa6d8c2d174170a5dc244f7f721db6908219  opencsd-1.5.2.tar.gz
+sha256  86ee4248f26d768f60f4f4a09f62acaf63989a6448fe1f65a1539478123d95df  opencsd-1.5.3.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index 8aafeeaad5..42712133a3 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.5.2
+OPENCSD_VERSION = 1.5.3
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
