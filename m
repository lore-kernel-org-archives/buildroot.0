Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C02EB64DA
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 15:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E8881EA4;
	Fri,  7 Jul 2023 15:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E8881EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wmORPPFsTSt; Fri,  7 Jul 2023 15:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2975581E8B;
	Fri,  7 Jul 2023 15:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2975581E8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 228A61BF39E
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 15:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F183240439
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 15:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F183240439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WB2MsW0ucpPS for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 15:17:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6843440195
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6843440195
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 15:17:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 648ACA4C00B2
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 17:17:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43446)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qHnCj-0007CI-0W
 for buildroot@buildroot.org; Fri, 07 Jul 2023 17:17:05 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Jul 2023 17:17:05 +0200
Message-Id: <20230707151705.276916-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688743025;
 bh=wGhJtthhaFGkvhbEPG+q5mSL1kR1exTPyzk30pfJaqA=;
 h=From:To:Subject:Date:From;
 b=M0Ee9ljCupaSJmZLaiOiS50G48fqKwxCEf1TEYsiLAwSXyOtjE0mbVCs2NPx3t+yA
 rFghFPAP3tN1upqtLr4DYHfZdyKfzQpz0Uque67O35quUl4c69CLhrPXr8POZHH7O4
 2QWuC8dePtaiQlkLuaIelJgxTSnI+Bw+GDdkDVOMUdQvetvaYQECoq3yiWjS5mbLh6
 kqC5jc0uZKOew3b6/0iuM+0WGM+5pLkSxpmUrchWnsnTuKK4Y/ks1tRN7V6oSK+ETr
 g1rDhRNbUbgpkMNvXOfdFQ/C3M+Igwrt9LeeH4KB2UEvWMY2OTKXDG6voXL4MJ7Y/i
 mW9yb/BR4yUzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=M0Ee9ljC
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.20.0
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

Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 4eccef4806..eab24a7eab 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8c7e48690c8e0f6cbc22c2ad2093328152e34208d1c33dc24008dfcab22ea3eb  xmrig-6.19.3.tar.gz
+sha256  86c62eb6db83981b21ac1faac69c28fee2952cbbc207ea7476707d4f1799633f  xmrig-6.20.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index a49580fc7f..982ccc8c5d 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.19.3
+XMRIG_VERSION = 6.20.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
