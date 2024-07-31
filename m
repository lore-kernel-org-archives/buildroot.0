Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38221C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 20:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC4C680D5F;
	Wed, 31 Jul 2024 20:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0KSt_sFQONP; Wed, 31 Jul 2024 20:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B579680DA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B579680DA4;
	Wed, 31 Jul 2024 20:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 781271BF3F2
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 20:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FE22607AB
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 20:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gpt1uX9Wxfkh for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 20:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3056A6070F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3056A6070F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3056A6070F
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 20:45:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 43AA0B0055E;
 Wed, 31 Jul 2024 22:44:58 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 22:44:53 +0200
Message-ID: <20240731204453.322627-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722458700;
 bh=tEhuQy+NxRhDmxOs8QDfqEeRu4SwygaBJHYFjbM6TdM=;
 h=From:To:Cc:Subject:Date:From;
 b=D9BT5WUIyBHlIkpTdxvEsguj2ccSxX1VJPT5E6fMEea249O0NK1x7A4Jvff+Gr8kN
 M9xx2IhU3NRVwFd5lOPswaIvqUisZ3Qt665MgE/PeglK1FO3eTz1/yV93DE3rejmcv
 r6dX+CM7fiVaS1NSlw4FzYcbZdO8OJ05/Usz/0Q9MmcGDxiQT1Jk0v5is86djxHUlR
 SXDJKVDko+lnfaR2m3asaVgwAqqhD7SyAOPQdYJsh23tYZ8AeMFWrKN/EQmo/QD2k9
 jmwyJsi36vnef/CvNJURoFRgOoWod682JN1QG09bZTIVVQKagI+O8EIwqsURnYTrGp
 qaGHRmn/omtbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D9BT5WUI
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump version to
 2.11.7
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://www.freerdp.com/2024/04/22/2_11_7-release

Note: this release is flagged as a "security" bump from the upstream
release note. While there is no allocated CVEs, commits in this release
are backported fixes from oss-fuzz. See:
https://github.com/FreeRDP/FreeRDP/compare/2.11.6...2.11.7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 9ac9b25066..1007215cd6 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.11.6.tar.gz.sha256
-sha256  ad5a0c7761b18af914041ed50902d6c9fd553e65eeba8a1bea41c4149980b84c  freerdp-2.11.6.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.11.7.tar.gz.sha256
+sha256  5a2d54e1ca0f1facd1632bcc94c73b9f071a80c5fdbbb3f26e79f02aaa586ca3  freerdp-2.11.7.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 8e359cbb4f..e8c8f320a9 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.11.6
+FREERDP_VERSION = 2.11.7
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
