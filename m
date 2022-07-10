Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4752AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 22:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96817840AC;
	Sun, 10 Jul 2022 22:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96817840AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCTLYadr12NE; Sun, 10 Jul 2022 22:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9996184098;
	Sun, 10 Jul 2022 22:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9996184098
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D0821BF34D
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 22:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40E304023D
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 22:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40E304023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BW0ddiTafIb for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 22:56:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AFC940146
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AFC940146
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 22:55:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.49.253])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AfqEoisf6bMeiAfqFoKvOb; Mon, 11 Jul 2022 00:55:55 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 00:55:52 +0200
Message-Id: <20220710225552.324219-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGnngccpMfvG1pk0le0433uwUcdsyYYTQFvkGv1NRMgh4AnzrU5qyvYgMMHs250/0lPuMbJBUomjGjzng1oWnZDa4ExtrTLbnqZku87Da0jQ4b/c6Sqd
 zi9MJ36cjKkC41Wv5UJOAoJ2p7UDCErZCexIci9VxJE31UHGIyisYJa+87oatUoNczRhMQ7fei2g61XSGJoSwDkpE7XJA2J1hr5dJXvJCR6FM+R28VdpNQCm
 EyhgnZDG5/UhHuH13jtSyBhCNqaCdiJttwVJfQZnUZrB50zXGT7nkXhb6YV/ZjA/
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1657493756; bh=7c/FteZrk3OPqR4nlNffhj3z91HzgptLgRj607UjFms=;
 h=From:To:Subject:Date:MIME-Version;
 b=i1he1ozpnFpXZigrdQCi1Amxmxm7bYQ0nMEgGl0E+Mn5WkDGGHUQHD7EU56ZVvZDM
 HSXJ613XvTTQV/wcNYIoS4GsIMc1YLQnL3MJeWUfGZ01NB5gocSsJHF12+2uzFmymY
 tZ+9O+ggcvubhk4Bft224JTiG/s0bglA3iZo5BuEtswXWTvSlj8Ero62oepuHEjLPz
 5BXWeyg0bHqNchBCPai3m9BO/TLXmAHKw1UBEMBEfAo08G/77EukvczJybCc/NOp+o
 81M+1shCjzW23qNIrAPL4VpfrHfoBxw10Q7IHVXRsqDoSMsz6dCd6mUmFIJEwYyDjo
 oi6Is2UqMHF+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=i1he1ozp
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 4.4.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 66743326a0..b054291ff7 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  02035eddb9d84112834abd1654ce0e177d14f41fd8ce0c29d5b4376888890790  harfbuzz-4.4.0.tar.xz
+sha256  c5bc33ac099b2e52f01d27cde21cee4281b9d5bfec7684135e268512478bc9ee  harfbuzz-4.4.1.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index e74657234c..726abaa61e 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 4.4.0
+HARFBUZZ_VERSION = 4.4.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
