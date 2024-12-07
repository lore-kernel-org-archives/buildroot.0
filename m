Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6F1E7717B
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 20:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 561AB40401;
	Sat,  7 Dec 2024 20:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2rjD-hi66kS; Sat,  7 Dec 2024 20:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D00C403EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D00C403EC;
	Sat,  7 Dec 2024 20:19:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10BABED2
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E586A80301
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ea8UD6LTvBU7 for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 20:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CE42802CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CE42802CD
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CE42802CD
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:19:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id K1H9t6ge47AmWK1H9t3iZK; Sat, 07 Dec 2024 21:19:39 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  7 Dec 2024 21:19:36 +0100
Message-Id: <20241207201936.103809-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOkpygfU9c0fBp9yjqDAr+58esW/Z0fzD0iJ+94VBJreyEsuroQBtLykwNOHG5jzvhIx/n3zN+PPEIsqUveRi6r3BB/KhuHB+6g+Rf+/ZTnqT5gJ9kWc
 9Dw0XBXa21Ec6DzDgrE9orUmV1ps6HacgXlr+i3O+bsruTT/XIGq93tSeLC2MO1UOuQaIQJUGiMNqlVse7Vs1UIIa/8avdvK+wMOhSKfJc6/eSTgN5gNznFf
 Ak3SsF+LPzBEspvJYMeYt/RzyYE5yKv9GZk6n0iwnLXw1tDb83plNV+e9nu9Ewe+DUttDx317qPidCsP0sLz0w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1733602779; bh=Dy1WRtcf6J/JjVsawx8jVKwTcC/nHO7FRPryYfBj32o=;
 h=From:To:Subject:Date:MIME-Version;
 b=Mo6wYhSLcqCfSd089HSKMhjnh4rGA2glntJoUduS429/zLwFxTKc9MdcKuX8RTtwi
 8TuK9SOr4xHUvkQFXSJkH6O4GKhxRaUeSM7ziXyMSeadxk6E0dZTE1MSD3sPq/D3HZ
 LNlxzK5b5o1Z2iepwxL+VzvkwaXi4XH3jb08Hxb2UD0T5GJENszkTELSrwXa1vmxCV
 VI3tGcD29v9vh3USR8+hyWTLP5HxtKYPqY1oiVfKrDBJekG76aakGKW2NwYk1E1nVN
 9NNIfIwF0mn1HgBQQYNJV4ZG68SX+WZl+Oq5jtsiWebrvrpmpw99XaMh4oqIE2dbue
 JTUJ75B9mtA0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Mo6wYhSL
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to 2024-12-03 version
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

This version allows to build with Linux 6.13.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index a8b7cb9358..3e70d36d57 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  8da0f54bd9ae094b5f61fe3c4dd207b2df62b4286970e2828f7c5ce1146447fb  rtl8192eu-56f672a8b9572c743148f2e60068fd341d52d5a3.tar.gz
+sha256  dbd565edc8d52a1429d8551795fb4da3ca44cf27867466010e0e6d00c86aef5c  rtl8192eu-6755ce9c15bbcb5dcffbca7f6f08e661ccdaacdb.tar.gz
\ No newline at end of file
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 0f00d301a8..9cd88060ce 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = 56f672a8b9572c743148f2e60068fd341d52d5a3
+RTL8192EU_VERSION = 6755ce9c15bbcb5dcffbca7f6f08e661ccdaacdb
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
