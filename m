Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F285DCE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 13:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BDE160F3E;
	Sat, 23 Sep 2023 13:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BDE160F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDZ4PRQkRSsa; Sat, 23 Sep 2023 13:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25CE60D88;
	Sat, 23 Sep 2023 13:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C25CE60D88
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C707F1BF32B
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 13:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E14760BCF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 13:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E14760BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxbQL0qumBSO for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 13:27:20 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC1ED6107A
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 13:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC1ED6107A
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA692A4C0E06
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 15:27:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42122)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk2f1-0001UM-1i
 for buildroot@buildroot.org; Sat, 23 Sep 2023 15:27:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 15:27:03 +0200
Message-Id: <20230923132703.66338-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923132703.66338-1-bernd@kuhls.net>
References: <20230923132703.66338-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695475623;
 bh=8vJO+AsbkQNLCQbMJaaBrMmrB17kbDzLKoh7bF0zlNA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Lk7NbcpySUOXwKEPyppSy3S0PY/jhwlYXmrWfzBiLZDQw4XCb1KDIxDJT5k+VZRt7
 /tdZ2yRVZtasgayyKWICo0ojS0xOI5bhkMZz2DgM3389ns2VpAJ60qTJ+nuTcUnSFR
 xlawZMN37xRK2kjD0p3OPKzIGZiodEp350qrl2DQ3CsZoq+NT8gWRVEp4/yA3Iupcv
 850bR44zkckV0vMNTrCHBZpHGFkKl1FoSsAEdLxGJYnq+avaKOLW7XeU50YP5QgIaD
 oDyPVVYUx7n10cd5I8amAv5Ev8gY4h00hU3hY0e0EjySMYib4FxyPG5JEcVZ+f8/cF
 xR8UaYwvc7IgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Lk7Nbcpy
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
 0.5.21
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

Release notes:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/Y5SJWAIAVEAQ2KKSWJM7VSJUUFRMFAH5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 5c7ba322b2..8cd3356dce 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256  ae32bd4870ea2c1328ae09ba206e9ec12128046d6afca52fbbc9ef7f75617c98  dovecot-2.3-pigeonhole-0.5.20.tar.gz
+sha256  1ca71d2659076712058a72030288f150b2b076b0306453471c5261498d3ded27  dovecot-2.3-pigeonhole-0.5.21.tar.gz
 sha256  fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 0b64cb0d6f..679fd4db98 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.20
+DOVECOT_PIGEONHOLE_VERSION = 0.5.21
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
