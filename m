Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FF2C0015E
	for <buildroot@archiver.kernel.org>; Wed, 19 Jul 2023 20:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC528204F;
	Wed, 19 Jul 2023 20:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC528204F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfjKWyZ2qgPQ; Wed, 19 Jul 2023 20:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998478204E;
	Wed, 19 Jul 2023 20:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 998478204E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82A751BF32A
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 20:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C0DB61117
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 20:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C0DB61117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtIZZNtrYZ8y for <buildroot@lists.busybox.net>;
 Wed, 19 Jul 2023 20:10:09 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFE4160E11
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 20:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE4160E11
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF5C1A4C029A
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 22:10:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46942)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMDUr-0005Xy-1U
 for buildroot@buildroot.org; Wed, 19 Jul 2023 22:10:05 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Jul 2023 22:10:05 +0200
Message-Id: <20230719201005.1641739-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689797405;
 bh=69eXe3ZcsiUNCoaI3dmyaVYRQNbLbX3R48+tSydtKuM=;
 h=From:To:Subject:Date:From;
 b=d1KzMGNb+Z043Htiep3CynfdfJF8dwgMCkspfudPF5iWqdEK8s7VHF9GqryUJdP3w
 dM8mj39cHm9g5nQbHHaUW0nNndXSFQXCoz7dldLnwfatH19lkwhOQ+oEquugBf+4He
 pEAGWvOb8m+uB2lXJkUp7Z/iY2hoKMCnIdZ9ZfFR1Vd1wZFP59tgLankYx1N+e+SgM
 b7Zgp3jEJfOECeilZXxvF6ZNMt3NHOqQGCZAoV6JEWUlRzW1B2yQfJAijVBpFZ+tw+
 bnqzgrN0kQ7vGz38kobEty5zeI3p+hUquJFKfYguGINjix/hQb76nzElYUslpDJ+3h
 1OJTJzd/LKQuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=d1KzMGNb
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.18.5
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

Release notes: https://www.samba.org/samba/history/samba-4.18.5.html

Fixes the following CVEs:

o CVE-2022-2127:
When winbind is used for NTLM authentication, a maliciously
crafted request can trigger an out-of-bounds read in winbind
and possibly crash it.
https://www.samba.org/samba/security/CVE-2022-2127.html

o CVE-2023-3347:
SMB2 packet signing is not enforced if an admin configured
"server signing = required" or for SMB2 connections to Domain
Controllers where SMB2 packet signing is mandatory.
https://www.samba.org/samba/security/CVE-2023-3347.html

o CVE-2023-34966:
An infinite loop bug in Samba's mdssvc RPC service for
Spotlight can be triggered by an unauthenticated attacker by
issuing a malformed RPC request.
https://www.samba.org/samba/security/CVE-2023-34966.html

o CVE-2023-34967:
Missing type validation in Samba's mdssvc RPC service for
Spotlight can be used by an unauthenticated attacker to
trigger a process crash in a shared RPC mdssvc worker process.
https://www.samba.org/samba/security/CVE-2023-34967.html

o CVE-2023-34968:
As part of the Spotlight protocol Samba discloses the server-
side absolute path of shares and files and directories in
search results.
https://www.samba.org/samba/security/CVE-2023-34968.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index cc7eee620f..1901707f3b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.18.4.tar.asc
-sha256  6ba7b3503cc59c9ff4f6fcb1b510c2c855fff93e0b366ab891a32a4732e88e53  samba-4.18.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.18.5.tar.asc
+sha256  095256ac332e1d9fbf9b7ff7823f92a3233d3ed658ce7fc9b33905c2243f447f  samba-4.18.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index a14cc63c01..edc0fee286 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.18.4
+SAMBA4_VERSION = 4.18.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
