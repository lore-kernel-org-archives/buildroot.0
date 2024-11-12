Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDB0D32D8B
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 10:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD644006E;
	Tue, 12 Nov 2024 10:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_vIZEDslxl8; Tue, 12 Nov 2024 10:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B3440052
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B3440052;
	Tue, 12 Nov 2024 10:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D170DB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 10:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A951600CB
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 10:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ndb8eEt0QTth for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 10:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.187;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5A4260597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A4260597
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5A4260597
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 10:36:24 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1M7JvQ-1t9iKf1Iaa-00AjVL; Tue, 12 Nov 2024 11:36:21 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 11:35:29 +0100
Message-ID: <20241112103557.7691-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:oVM8d1VukPcof9tocKBy9cV0NzYCd9GoNSGO3PmLmJG6eEPX33X
 QAQZeIAqD3kGW5znjnnOl3nwtL6ZesnCUMRsVdsDCCJgjXYutIAhZxeUSmanCw/g35+cyb8
 cLDgLDIRixEIJzT770W/jbNm1z9Fm/YC4QiBXSD1uYrQQppQBdhXf6dS8e2Pj2vLYp0UmOM
 MpsRxfKABxF6TkVk6fQSw==
UI-OutboundReport: notjunk:1;M01:P0:+mUIBIn6KEI=;A1jUg3p+RMv73xkmdS69yJBJ4UT
 YhjUo81HNviR/LgJs76VyO6zfeTOCKI5qeJDLWErnCgR2gtuGvnvKL+UjP+UNhXHBCFLO0hsK
 RTPjDDe4oMInYD5OTuXEWfVAre6448TVlbwZUQnSx4XOpNtJkA0/URY0Qz9ne+LJDYtdTFX2D
 vm+AMjx9RLoMlOPi9waiawO4gIAK5mW4WorkEPBKZj0zT83SKTp2xbicZYxT3G4/XzAZwvdi3
 s4VdC1U1rtZ09wMu0Q8IKI0VA/eCQ891i0xFfRQWufUMVxgfVgtB2sqzAC9Ft9cDkONKeS77K
 l1hxv8RUbsauq4lZ5gprMvV/B9X+5rMHT9RwBtEKwMxga0Z1WbJJ+6zk9PpqADNh0BY5nsizc
 zZmcJ0J4VU+qXbqCeZtNzg2U1igV7k5YNNxIPpfea7pBQLYw0hlwC8dz3L8dkUhdnpc99IU1c
 tosk+YxLNzDMBypioELqEoLefWxXXvsg+YyRfeJPfxpif5ypSC2pMngXVRKPuwJm7SMYl9AXe
 tat6nQXTMauytxfiAqW9ZYulzkQGwB+Xuaotovbc71xN90/G0gWP1VlxNQohAL4ZhvcqlFJ4o
 lZiFabGRMhDGjPygERUl3zmsSsWmdpAC2zVqn0f30B1RWBoOxkZ7uCIpAnifP7+T/YfsH5bRb
 7HNaE9PGvDWMOuga/umraTDETOMJYnFte6b5OUaXT7YNlc0/klE5wdhD/l7YEqL26ZeuYb/xY
 d9BSV1SP1TKJ4KBsuvLdF5obzZ+u/su01WbrwIvHTUkF0n2H8aNXm3UX/JAwDjqipzQeJgNvK
 Ecaubdg+EiOviAo+DxTpWySEgmynzQTKCALGWKQ73Kt0MH6aRb+FPynXs+s7hEEtRG
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.8.4
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

upstream mistakenly based 1.8.3 on 1.8.1 so it didn't include the
1.8.2 fixes.  1.8.4 includes fixes from 1.8.2 and 1.8.3.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 0a34bedf79..536a0b7405 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  868810a5508d41dd7033d41bdc55312561f3f916d64f5b7be92bc1ff4dcae02a  libgit2-1.8.3.tar.gz
+sha256  49d0fc50ab931816f6bfc1ac68f8d74b760450eebdb5374e803ee36550f26774  libgit2-1.8.4.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 22ba507acc..3bf3dbb647 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.8.3
+LIBGIT2_VERSION = 1.8.4
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
