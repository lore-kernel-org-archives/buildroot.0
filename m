Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD73C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 21:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0059C84635;
	Thu,  8 Feb 2024 21:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjcOjOwgftOB; Thu,  8 Feb 2024 21:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D74784644
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D74784644;
	Thu,  8 Feb 2024 21:26:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD3FC1BF30D
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAFB96153C
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-68ppuNXknB for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 21:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF27761512
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF27761512
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF27761512
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 21:26:18 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CA29813F8D5;
 Thu,  8 Feb 2024 22:26:15 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 22:26:09 +0100
Message-ID: <20240208212610.256053-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707427576;
 bh=DpuD2+bU6Ahlo9tOKcYxwAiL5F88JUSPrr4kZK1fATA=;
 h=From:To:Cc:Subject:Date:From;
 b=WdAKC+MLYz1e2o/+ZcCowXZ6Xt7Qi2xiLFpbwetfAATyHnJMAk1SXzM5CEBYfZ9Jc
 KKovcrM5QXNoZsGLV/b6iea7Ez/UIDc9Hqks7qlcNKB8JK0dQeeWrFeEVBGwZMYJkU
 ItgbS0JhQPBzvy4yUNTHxJ4b6ycvVr+wOmunSizU0vNkFkItiJDHE19Qsc5TwFOJiv
 gvuXC648Y5dANZt8pUwKsd5++T2Sgu+eHQnNLMwueMIYrT46JCxlkpRkjvdnOFVA04
 Pzia1W1bHltdhH2n+9IjBh2yvw7Ojj2dGqNwJ2kG/DyyIJ/VjBczMkoXp5YA9oolkg
 eivEe9VmYhJ+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WdAKC+ML
Subject: [Buildroot] [PATCH 1/1] package/ddrescue: bump to version 1.28
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

See the release announce:
https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00014.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ddrescue/ddrescue.hash | 4 ++--
 package/ddrescue/ddrescue.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index 3caec5667f..4103d4fd6f 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2023-01/msg00011.html
-sha256  38c80c98c5a44f15e53663e4510097fd68d6ec20758efdf3a925037c183232eb  ddrescue-1.27.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00014.html
+sha256  6626c07a7ca1cc1d03cad0958522c5279b156222d32c342e81117cfefaeb10c1  ddrescue-1.28.tar.lz
 # Locally computed
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index f4376a9340..13798bb4bb 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.27
+DDRESCUE_VERSION = 1.28
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
