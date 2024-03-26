Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A45C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 10:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 594CA40160;
	Tue, 26 Mar 2024 10:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBvOl_yYMZBX; Tue, 26 Mar 2024 10:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 598AB40ADF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 598AB40ADF;
	Tue, 26 Mar 2024 10:18:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69DE81BF383
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56B4780F3D
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HxVhqjGFSpn for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 10:18:40 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 26 Mar 2024 10:18:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0C6180DD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C6180DD5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.187;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0C6180DD5
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 10:18:39 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1My2lr-1snB923yjX-00zULS; Tue, 26 Mar 2024 11:13:32 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 11:13:07 +0100
Message-ID: <20240326101307.271392-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:N4ZBr+rw/WQQ3Xwk1hsFpv0C0ey87ymiYRAQJAvvA84QINtP1WY
 Q2pgklSpqMwblN+0Oxp7BC5Aoj4aD2qFcGNPM5p8rVpWmB+UINgTIap1wK/GjC7P0AeIdN/
 XXqTYRzeF7c844wUvPhV4ZKeLIIMiLM0D1m+xwtalxGzRrGtIlty0bTPXXSM7aknAvyoBdl
 zRVtwbAWy0nCoN4riqyzw==
UI-OutboundReport: notjunk:1;M01:P0:q2e2VGGo1D8=;OM+A5A4qZMUntTDNgETOwvUlGP7
 qtzoQ+rJhmsneP3c3t/+nMB7nrt2uao+5lmMJlikwKSKmtoPbdAjC7gKwoNKx+UbnuUKoOexP
 jRDyVPN60ln1StdbAG6Yg6IhqrXqdEwQd6sKWFCLK4Ww2c2u1CszW4ee5WRI0wIoldClp8CQV
 89ozSMoUwEik4foune6Vz8a58dNS/usuitB4Qtr1AqfqIl7SyASNQ3kNcGUbNF2IcetcmtxcQ
 oUkdTV0MXSO4kxWs9AGHfX7q8oVWgrg/8KofSQgYLM/WPOAV+DdWtUannE79lGixwySUSie+n
 ZB3VK9rtOI6C5DCw8lf7d7Afub6xcJUGdBOrMLRS4ee4cLjctqaG9uOHvJAwyJL6rrr6H9vbA
 0/YHPe/ZCuQDANg2UMEuQQCS0ODyOuJsCEUGmb3Mdd0qQFFl1k0dN7zja5zfGWGAtEmfCkIPh
 B2GNcKgksAZvy6sif9Y+wxJo/AW8c2SOdYxBYoBeryoAO/1pyFIc+ThZSAsvW0IZsxaYiL93X
 nF/47ORYb/s8vGcOz+XVIDKfIxI82kgDKjUkFOKR85IQOZD/7DhG+NKmZPif9j5zxmLRPsieo
 z86lkJZ49vqNxns9NXNsGTFPADYgCjsaluI0EpdfLq6JJ/Na6/QKbw0UpPFqpJTbXefoEfCOM
 +6bt3Glp2Ji7cYUbe5UFTA3i0lq/pCdvtJACJDhDRWjV7o8yjgQ4ezsfCEAxI/K4HqEIs6sXF
 ENKtHaax492FBbJeeiBozvSY6y/XK41o44A+cGDVOsaAC5neoXkN4E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump version to 9.1.0
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index af9087ede2..31496bbfca 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  867778afdd66cd29fe0f14ac4ed316a0ab393f5dccfd2219450848cd0347f1d6  v8.1.0-package.zip
+sha256  73acb923c0ef53c6b6bb34b6dba782e03e1d24279f5aadbec5e787269456a6d8  v9.1.0-package.zip
 sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index fde83d6e84..df29e04e65 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 8.1.0
+OPENLAYERS_VERSION = 9.1.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
