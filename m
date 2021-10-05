Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF2BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 08:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4935A61425
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 08:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4935A61425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16CD583C5C;
	Tue,  5 Oct 2021 08:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ex50zbHDRJn; Tue,  5 Oct 2021 08:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B65483BB8;
	Tue,  5 Oct 2021 08:55:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 406251BF574
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 08:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D14C83BB8
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 08:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9B0p-c9DBTQ for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 08:55:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADD9C83BB7
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 08:55:23 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1N2lv2-1mv1zp2ece-0136rb; Tue, 05 Oct 2021 10:55:21 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 10:54:52 +0200
Message-Id: <20211005085452.12410-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:eVJYutZ1axDmF8oLXGKgANYjfer150rbEhP35BIbn7r2pFSpanN
 nW8R3d2E1v8X1ci+sDU6d7qCB5lZal06sS4+NKtfSvinkMTmnznJV1SsYd6F9D9N+vOxkJb
 Llifnn2plipdp4ptL3VT7OEFw/+prdZtcYkP+V/tBmTPmdoZPySoh6oKdaNjTLXdKyASa66
 HonID4rjHhTyBrXiIKyLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SwDiW3XsHLA=:B+lZZQJdC5MCwz8iuVBhnG
 OdjqcBaCMG34927P/+I12+of4AYToTYSyJl8nM8w2QsNwfPLZf3ohHL53MDAB6/2KVCQebqHD
 QiRhjhoVMQCPREPUTvackL+YvAkw5HUkE76nkDcKXec+fgi+s15axAMBi/KXX4zZ87QHpdocW
 KFDZOO0HCu6Jihvg7xNT7aS0jHJ2XvMGreHA5oU9whZxaifWGwmLJuk8sEHmsB4UVmW0QsV7b
 XJM03KVf0HGh+tMzr9gLn9FoCkeIsmu8zGemqwPAkI4OohZNnp6stuioLyN5NGiAK5Sw0Om5e
 f5B0GCZMIAbAU25JqZwIAfzYEHhP5vmXGC28E6gvFdGyp/LTltkwHZ5WRNZ+7T7hhqMczOQA2
 4R49CrciEgeCl5C2Mj7xEMhgyl4JORs5wzozuG4Gtzc3B0uRUNRRORhSNAb7TJzXBOex39c46
 8REgZfcwA2WLa5Lfq2tQpcEtOeIK87YlE2iyA+6V1aaSlIzBQNgvZ1l4tv7vjTkaBQy0f+zR8
 1pq3hizh9fsdesAtHqglddhAUH2v/uzHeYn3xGe0iafVJNHZrAO7FP2Jbh3umxLzW0Z4z73RK
 GQJfInguYQWq7x62ulO8j6qx4jbjAjaZ7pBSLxOW70TCy6sa16bkFTz24weswiSs5RLpx4eoG
 bl3qCYS0pSlnIQCl79iKGYYtnUng6UwiaeNlUpeNXy0DEgzyx9kCDp5/akbliwnWxu2UKKz+j
 rlNQ3ilHV7q/Pj45qgz73kNi1PtDcg4fI5z1JonWQb/IXKT6xKjnkuJQm7up7pnPwHtG51NOE
 41kmH26
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 5522f5fe45..07b1a260a4 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  701a5086a968a46f25e631941b99fc23e4755ca2c56f59371ce1d94b9a0cc643  libgit2-1.2.0.tar.gz
+sha256  192eeff84596ff09efb6b01835a066f2df7cd7985e0991c79595688e6b36444e  libgit2-1.3.0.tar.gz
 sha256  8b7e4f54f8bf210c8fe010a49571a1ee57463ef020cc43f051d4d3fbb74942af  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 4c715302d1..6cc0f1ea74 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.2.0
+LIBGIT2_VERSION = 1.3.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
 LIBGIT2_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
