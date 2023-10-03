Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45385E75433
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 07:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCA2B60DA0;
	Tue,  3 Oct 2023 07:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA2B60DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ExZcnzCHKaxH; Tue,  3 Oct 2023 07:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF52A6102F;
	Tue,  3 Oct 2023 07:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF52A6102F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA5F01BF3A1
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B060E4057F
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B060E4057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xjg5Ex8ynSP for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 07:15:41 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 415184034B
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 07:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 415184034B
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 616F5A4C031A;
 Tue,  3 Oct 2023 09:15:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41862)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qnZd3-0006ui-07;
 Tue, 03 Oct 2023 09:15:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 09:15:36 +0200
Message-Id: <20231003071536.297478-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696317337;
 bh=tnaJYk2UeEVWvlCcntb2AwCi2NMlHskTkzuobjNFz+Q=;
 h=From:To:Cc:Subject:Date:From;
 b=TRdOhVhbC4KceNLjlPuoiYppA38MkD8+GSsAnETwSH2Q7wG+2q1j+tNRXNLxvI4Ps
 dBrjCFlGAERqarzSIQl3X17k2VJdUdFUh50bbq0VS8apCQYwG0DA04j3le4VmegFj3
 D0F6T9BXtmTux1XRnNKMsz/OIJEe/drhOq84XPLzf+xMxZcRqiyL7UWmdq+7x4etLS
 pNE7V96UEDEJQirFiwpKljHkf3l/MHW14WE/RiYPq9Egvag+90xVhCISY7l53FTLQ/
 lqTP2Es16kpelvLguW3WAKCKT7KCBmJnMMdP1QOvTvYo22C0r/y3lOfylE30kRCPp3
 sfecRX6DqvL+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=TRdOhVhb
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.96.1
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-42114, CVE-2023-42115, CVE-2023-42116:
https://exim.org/static/doc/security/CVE-2023-zdi.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 2336aaa5c6..6cdeea0614 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  299a56927b2eb3477daafd3c5bda02bc67e5c4e5898a7aeaf2740875278cf1a3  exim-4.96.tar.xz
+sha256  93ac0755c317e1fdbbea8ccb70a868876bdf3148692891c72ad0fe816767033d  exim-4.96.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  6b863661465a0b9897c1b71875c5196a1903cf560dd85de45b08242b9731edb2bc10eb56945d62e477e5d15cc7a8d493915bff2ca81689673a8091c66f62c89e  exim-4.96.tar.xz
+sha512  ef1a0e57c59cdf4e915b3ac5dcdbc69f565b14dd92b0527f6796b2c46a9ec34f991f9790fb4171c99417f7e482cdd62d77e780cc71fab227c8bed876103f7fdd  exim-4.96.1.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b84a51d6de..f5695d048d 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.96
+EXIM_VERSION = 4.96.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
