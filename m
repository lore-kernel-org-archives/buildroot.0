Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCE2E74AC8
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 18:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC3281AC1;
	Tue,  3 Dec 2024 18:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKU6oKmAAtZO; Tue,  3 Dec 2024 18:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DCC081E81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DCC081E81;
	Tue,  3 Dec 2024 18:50:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0275E1DAA
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 18:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D727660596
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 18:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwCjz-Gfcbus for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 18:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CD2460BC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD2460BC3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CD2460BC3
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 18:50:04 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CD2DFB0053E;
 Tue,  3 Dec 2024 19:50:00 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue,  3 Dec 2024 19:49:53 +0100
Message-ID: <20241203184953.505225-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733251802;
 bh=Yqc2UybIzEqEocPXdaJlSK3ktqb5rcY9GTdBhdn8j5I=;
 h=From:To:Cc:Subject:Date:From;
 b=Zc7m0vQ3a3VmXH1Puxdgw4SemVTkocvNal1P2i5Jkq9XdJOm0PELQvZi191tXtoLI
 ukawwYVvB92ivq3HpgWP80JAexXfEYWrz8xpmeLjkNkhrT8TBy/HhRpL1YAbh2mdrI
 1SFDNAfGQtm4vthj/I2NaQI3q7fb1t9UorK49Q66RwkK2I5rHLMkQ9f3EYiN+vZIU/
 S+F/TBtAXOmGfJZ7/Kv6MLOkSmXzrGKAYxBPI/ybT0IGeYNdV22wWaXDDop1WDtjiW
 brHpbxHtzzS4kDa0lIo+yBSlyZvcg/QPdi17cxPii313xg+U84+cTDetT7qcvLuW+d
 NMq8ChmbhlwcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Zc7m0vQ3
Subject: [Buildroot] [PATCH next 1/1] package/kexec: bump to version 2.0.30
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

For release announce, see:
https://lists.infradead.org/pipermail/kexec/2024-December/031314.html

Fixes:
https://autobuild.buildroot.org/results/64f179d996e9111ffe7b8ad18948066ebb1c6f93

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1571444138
https://gitlab.com/jolivain/buildroot/-/jobs/8534474708
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 91496c06fc..d89a3772d0 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
 # After checking pgp signature with key:
 # B8868C80BA62A1FFFAF5FDA9632D3A06589DA6B1
-sha256  67b1ac503aade45a54db0bc79228a8830a35d5d4f83cee932cff3e7a81a4a9ec  kexec-tools-2.0.29.tar.xz
+sha256  748a5fa7af27a8059d1de907bddfc32ac530c7189b5770c83e6f3d898d82124e  kexec-tools-2.0.30.tar.xz
 # locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 5f798b6a3f..4637a51506 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.29
+KEXEC_VERSION = 2.0.30
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
