Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23553D5B845
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAEB2605DD;
	Mon, 28 Oct 2024 22:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMFMserA2he0; Mon, 28 Oct 2024 22:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7A77605D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7A77605D9;
	Mon, 28 Oct 2024 22:56:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0557C112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D898A6058D
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJs377_SRnKM for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:56:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBA61605D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBA61605D9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBA61605D9
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:56:56 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E3037B0051B;
 Mon, 28 Oct 2024 23:56:52 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 28 Oct 2024 23:56:48 +0100
Message-ID: <20241028225648.1260830-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730156214;
 bh=/TZGowtLt4DP0S6QDtd67g2cZPnknb26WK9sse4p5ck=;
 h=From:To:Cc:Subject:Date:From;
 b=vRiMpBoZzLnXb4hDiKzeZtEH2mgtBGxPBgrDPyg8IPco8rpvkvsw2dzh4yuyv7JmH
 nnL2PfN3w5/OjK8K088jJb+l62bAjk6cO0gIeoGGH85fWlDEZJKY12EXUTY3RXfF5U
 2zCTiVMF8YbtWks48IOBGScXzurpZkShIi7UX4xkS74WmQHeP90TbsvWscmj3u2lCX
 T3Ba2Hj7VFaC9uLD1Cm98QXey5+ihZUvMBKQrshv1zSG4miM0gp8oPAhMyotv3o9o1
 kVei2XvWtHQsv0xCCY2UJ9lrtTmoRxJSnA+vcn3eqp/p4Rs5eZo9HSm5JvvwGWIv9V
 8Rt2N98PfDjvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vRiMpBoZ
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.13.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 4.13.2, see:
https://github.com/Z3Prover/z3/blob/z3-4.13.3/RELEASE_NOTES.md#version-4133

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch runtime tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8209936599
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index f138f39de6..8514043594 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fd7dc6dd2633074f0a47670d6378b0e5c28c2c26f2b58aa23e9cd7f0bc9ba0dc  z3-4.13.2.tar.gz
+sha256  f59c9cf600ea57fb64ffeffbffd0f2d2b896854f339e846f48f069d23bc14ba0  z3-4.13.3.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index 4763b1cc78..16db30ac21 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.13.2
+Z3_VERSION = 4.13.3
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
