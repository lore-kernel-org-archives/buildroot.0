Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7DEC001B0
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 17:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B1364031E;
	Mon, 24 Jul 2023 17:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B1364031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5T8gBPlEdwPN; Mon, 24 Jul 2023 17:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27CB9404F1;
	Mon, 24 Jul 2023 17:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27CB9404F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8A81BF42D
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 17:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9C666106D
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 17:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9C666106D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUsmZFjQDgym for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 17:01:21 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A06896062F
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 17:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A06896062F
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2CF2713F87F;
 Mon, 24 Jul 2023 19:01:16 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 19:01:09 +0200
Message-ID: <20230724170109.6853-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690218077;
 bh=58y6oy/eCVVPQByauZT4az+Vm1nkdSr2DObqttFctP4=;
 h=From:To:Cc:Subject:Date:From;
 b=lieHJ/pt4uyrKbP1njAZNrl3IIkBp/0itzXNWHKUHUn2O7GOf4qXy7kNwzxu6e+zg
 NQpkyDK5cQcmx/zS9YHEUbD4lF7ZicjO9ZDs+RGEfOKAxEP559XUVb5mnECkeYZPgt
 J7yy5c3mRP4A7cnbq5peqJBW+knGqTDLFPeAVgIlCt6tIX8TjWeaOCOGCJWHJypsth
 y9k/LoHBDwujhnftFD+BjbKy8sKM3UUAIQt9AI4paEO5HsIo5Q/CeVLn7hZ73m+Ja3
 LOOb4dZaAxiqVm0hsitkxaGaxMK5C6RRJ9wg6TJEM261lgEU8RMJT4435Sej5HrpUR
 h8BmCaF9pmxKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lieHJ/pt
Subject: [Buildroot] [PATCH 1/1] package/iperf3: security bump to version
 3.14
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
https://github.com/esnet/iperf/blob/3.14/RELNOTES.md#iperf-314-2023-07-07

Fixes CVE-2023-38403:
https://www.cve.org/CVERecord?id=CVE-2023-38403

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index b2c89df98a..02ada0dcc6 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.13.tar.gz.sha256
-sha256  bee427aeb13d6a2ee22073f23261f63712d82befaa83ac8cb4db5da4c2bdc865  iperf-3.13.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.14.tar.gz.sha256
+sha256  723fcc430a027bc6952628fa2a3ac77584a1d0bd328275e573fc9b206c155004  iperf-3.14.tar.gz
 # Locally computed
 sha256  35aa7c4618b9884d6faa9b43a4e70291b35ea9f89329d5d33becd852e85221b0  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 129319d78a..c00b16ce61 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.13
+IPERF3_VERSION = 3.14
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
