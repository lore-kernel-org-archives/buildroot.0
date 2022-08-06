Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79FCC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ECC182D49;
	Sat,  6 Aug 2022 22:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ECC182D49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnzlJoU6wvV3; Sat,  6 Aug 2022 22:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DADD828DA;
	Sat,  6 Aug 2022 22:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DADD828DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88B9B1BF580
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64378402E2
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64378402E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usp_fR_ERjW5 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:22:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41B6B401DF
Received: from smtpcmd03120.aruba.it (smtpcmd03120.aruba.it [62.149.158.120])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41B6B401DF
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:22:06 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KSBHoy4Go5XbvKSBJoQj1E; Sun, 07 Aug 2022 00:22:05 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 00:22:02 +0200
Message-Id: <20220806222203.1115664-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220806222203.1115664-1-giulio.benetti@benettiengineering.com>
References: <20220806222203.1115664-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJuvYLUffpk/3yLTBziBH0kfV3Y4C305EqjN+BbF8rBZlodzWW+ZBAdrlvOYEodgqXpVMd0bVNYlurGCmK5Fr1f8WOUs3ubXuWg5w0xgH42Dm2/OrWJc
 LBuK2T5pzLZVsNddriAFOg6qRWhiZI5YwFPz9x37+hXH/9emUPWDnceECdl3Rma2U0Dq81jpel1gKBhUyILbBaZb/MUGd/givInr02eqOrVA6esgtBcYF9fO
 OP1Ec5vhiRVNrpZ8u+oLRvv++JTsnRDxOdifXFAVYOnqed1GBA6gpMH1IB7vbpjNcJhTfZRlN6sywCF65BMj4Ctxia4fwyaXfGI3K7NwTSOVCZQUsjNXspA7
 Dv3acWLO5EL/2qjZyZX3a9NcZZuGx6wgbqH2i2P7a+AW877uLt45C2QBuqvXNH7tooC2fq4sMCoeLoR+JI/excasy3sjIQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659824525; bh=G6OwAXoNaG+AXjuMhgmTWWBrN8V69kzmVzlh4MxFfGI=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZBhgTBflJoDe1KgX1uijQM8Kq5sp5xAZua98VFvG6MHymmAQs/n3wGveTX1BEebAR
 a06HNuOt6VhLNMJU8K456FcbKMuHnRIUJufSnabbSqmEQ9YBJ1TU9oJI6KHRU4sGKO
 1GnlCw/vucVT/f+4/w0RT0fyQUQFQogrnWllSjDC9nszM2QT/K6eUbQyvM5UkjwSwM
 cFPuHqG804cLqfFwsIrq3Bpclp+zGYKSz/Y8f15KExNcgd71iIU7tPTY5ke9PU5esf
 ytdxNGr+/wNhjz8aGYGZFpEWiuGv/zAXQXpK8jI/gMxCNUIkdHUYsmGmI2RL9asqKb
 DygPrdLCKsuyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ZBhgTBfl
Subject: [Buildroot] [PATCH 2/2] package/syslog-ng: work around gcc bug
 101915
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Chris Packham <judge.packham@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With Microblaze Gcc version 12.1.0 the build fails due to gcc bug
101915: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915. The bug
show up when building syslog-ng with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_101915=y,
we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/b57/b57d51ed320a8e1bbfcf8d44875c113d868f82ee/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/syslog-ng/syslog-ng.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 6cad6a5ecd..64b3b24498 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -17,6 +17,13 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
 	--disable-java --disable-java-modules --disable-mongodb
+SYSLOG_NG_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
+SYSLOG_NG_CFLAGS += -O0
+endif
+
+SYSLOG_NG_CONF_ENV = CFLAGS="$(SYSLOG_NG_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 SYSLOG_NG_DEPENDENCIES += geoip
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
