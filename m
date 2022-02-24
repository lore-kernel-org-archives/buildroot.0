Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD0CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 15:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46CE341610;
	Thu, 24 Feb 2022 15:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLR3sOk-vDuE; Thu, 24 Feb 2022 15:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF78641617;
	Thu, 24 Feb 2022 15:23:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD591BF309
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08ECB41617
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lauEFEE9JRrJ for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 15:23:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CDC641610
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 15:23:42 +0000 (UTC)
Received: from localhost.localdomain ([146.241.16.188])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NFy1nb4YI0FuyNFy1n7e54; Thu, 24 Feb 2022 16:23:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645716221; bh=s870K+8EdpHG/Ei7qHl6MMUt3irP/nEqd8s1AAErjSg=;
 h=From:To:Subject:Date:MIME-Version;
 b=fBN5vBJPIJbMj7S1JmYxBWv2NX+x5OhtCUOk0mH50IvFL5Swdy8Jd+AYm9lpJcWTl
 NpkuC/0PqGPjrAyFd6LQQaN5zYiXFCxCSnFq69m8ovs3kwD4an2USsdL5DdPQqUsHq
 qfEHE+arx+XcSemoa7Wfd7bJueOsr7h3geeLQD1a1kzTRRW0LgbAnJ6X8lrfPlvDum
 92p22wA2FHjErXyf2XhLWTFtvASnhx+9TjQAPnk2sM0HwSCm58rm/H/Hr+flJuwpqe
 nTAPH+GRQYWZc+7ePhyFE6bHLjHHwJyeLAjdQ2Z8thfd58KHluM5+84b0iNRGVHN5X
 Eo1omxM2u4xOQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 16:23:39 +0100
Message-Id: <20220224152339.442421-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPIwMtPJnAhSAlYfvx+dQvcjzr8E3t1BsjPRllczpTwJ9eIvIjnv+1MVN8Q1/1Ey9z2iI3VmZUWLxnEaDDNWumL2+qieRdCgp3Wgd30fv0id0fiRUn7X
 PD5ICxqfTL0/K5MaBVYU7U2lyYP+NO/esTklsKYf83omQsZKycGGKcx85Fv61K34Z9+iOSnIsrzHC8+3cvMqJJagS/0M4cR0DnxnpnBRq/fCBlvqDVK4Wg3a
 2iaoi6ZvA5oZBRFD/sOuUXve3H3LDYbH01rnKsIu4DuErO27XB3R29eSctmq4jfSgI/+x6cvU32FFxNaqer8Yg==
Subject: [Buildroot] [PATCH] package/erlang-jiffy: bump version to 1.1.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 93c5e1f8c8..f172d1476e 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  45c224afe0ea2d3ece39e227f01f5585ad53b8b91d2d6924f9f50548874ae879  erlang-jiffy-1.0.9.tar.gz
+sha256  a999351d956d3ed10c33a6dd7e9435e674e519b5b82a46d60361afdb83062fd8  erlang-jiffy-1.1.1.tar.gz
 sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index cd94632962..de2e4749fb 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 1.0.9
+ERLANG_JIFFY_VERSION = 1.1.1
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
