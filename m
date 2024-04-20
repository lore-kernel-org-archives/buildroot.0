Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A52C4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 10:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A7744074C;
	Sat, 20 Apr 2024 10:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvndB5WrrqDe; Sat, 20 Apr 2024 10:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5175640988
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5175640988;
	Sat, 20 Apr 2024 10:52:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72D971BF591
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 10:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CF4F60659
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 10:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_RYKRppZ-9H for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 10:52:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 549C660655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 549C660655
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 549C660655
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 10:52:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 15146B0055E;
 Sat, 20 Apr 2024 12:52:34 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 12:52:30 +0200
Message-ID: <20240420105230.34710-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713610356;
 bh=DBo4LijqvnHQfkiD8FonssFixoebtLrGqN6NqVp9eqc=;
 h=From:To:Cc:Subject:Date:From;
 b=GkDL+Wdw4EIhpDpHX9ZVfhH44JvNh6kin6ZummOrtfGmWpvsL3Ja6fvXLFRhPp+VF
 05dgpBBCiCB6qCAejVARWz2ACdExWOViaK/DnZtJKo+3ORnNv+PcKx6B6CZGhLUpBE
 PcGHNNAaZ/+P98l5TPv50Eu7izBqvPrFqPIau3sKdmAby+6aYlo5dqcFpBctTYkoan
 BQ3FHOD+RaRGHjAzvHVoGhk6atqG8qjLhRa53WRfr9HQPVukBYlB0+D5qUzbQe5lw5
 ikUH63ezO7361qBoTxk1gvKV0Uevj0jY755i18D03utVrQXbWyxF4UrkyW3LLFODEj
 q6fcQ/pcvpKgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GkDL+Wdw
Subject: [Buildroot] [PATCH 1/1] package/iperf: bump to version 2.2.0
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

For release note, see after the file list at:
https://sourceforge.net/projects/iperf2/files/

Note: the md5 file hash is also added, because it is published on
download page.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iperf/iperf.hash | 5 +++--
 package/iperf/iperf.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index eb6088649d7..e4d40d5940f 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,6 +1,7 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1  e7b669c2e8747df95b59956e83ff53d3971d7a5f  iperf-2.1.9.tar.gz
+md5  34bb6ac1abeb801bf3f729794dc5ac36  iperf-2.2.0.tar.gz
+sha1  bcbd101ab36f3faacaab1a765a96806ca49a1495  iperf-2.2.0.tar.gz
 
 # Locally computed:
-sha256  5c0771aab00ef14520013aef01675977816e23bb8f5d9fde016f90eb2f1be788  iperf-2.1.9.tar.gz
+sha256  16810a9575e4c6dd65e4a18ab5df3cdac6730b3c832cf080a8990f132f68364a  iperf-2.2.0.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 1347f766d1a..303614668a3 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.1.9
+IPERF_VERSION = 2.2.0
 IPERF_SITE = https://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
