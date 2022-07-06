Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F64CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 03:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D035A8332A;
	Wed,  6 Jul 2022 03:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D035A8332A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxp_ssYUyZl6; Wed,  6 Jul 2022 03:16:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EED6283312;
	Wed,  6 Jul 2022 03:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EED6283312
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793C51BF38A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 03:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FD1860DF0
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 03:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD1860DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlyZQM8GZPzB for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 03:16:24 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AEF860A46
Received: from resqmta-h1p-028588.sys.comcast.net
 (resqmta-h1p-028588.sys.comcast.net [96.102.200.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AEF860A46
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 03:16:24 +0000 (UTC)
Received: from resomta-h1p-028434.sys.comcast.net ([96.102.179.205])
 by resqmta-h1p-028588.sys.comcast.net with ESMTP
 id 8vF1o4KzfoFeY8vJmoMjBr; Wed, 06 Jul 2022 03:03:10 +0000
Received: from dmocelo-Aspire-E5-575G.hsd1.nj.comcast.net
 ([IPv6:2601:87:c480:2230::2f0b])
 by resomta-h1p-028434.sys.comcast.net with ESMTPA
 id 8vJGoreBdVyR48vJPoMQSa; Wed, 06 Jul 2022 03:02:48 +0000
X-Xfinity-VMeta: sc=0.00;st=legit
From: Danomi Manchego <danomimanchego123@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 23:02:36 -0400
Message-Id: <20220706030236.3818-1-danomimanchego123@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20211018a; t=1657076590;
 bh=GNe0ZvayCkHVEY2ZUQIqZJksS9C8qMXIZT569YKpHiM=;
 h=Received:Received:From:To:Subject:Date:Message-Id;
 b=G66UDcNquMapPKpd2OlQPzZz85toUPEhpNMhw0qM7msGxBxgfwIsyy16fHMk8aNr6
 ME8RAXI1U+omZ1f6ZbP/VMaj/XjHQoec/P2Up44ssqFff59hNV2fJQADVVoN68Krwz
 lORpDTXM6gEWn41NMX+KNeLFVKGYvtOyl+N5WWFmwyckOfRfSUo7TRjrZmUKd8SbXl
 ghRivnmcmG9IqLa16eQtyBYGxik85WaKRl7eYa0pTX/G+WEgatpVLDA90By0NiEF7o
 dJcXg/Y9MqB0aCYArlJYz4pwla7nHDhOa5njnG8NDL9VmjF9XpGIv0nkLAyoc7ItnS
 rrsNZxSCvMM7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=comcastmailservice.net
 header.i=@comcastmailservice.net header.a=rsa-sha256 header.s=20211018a
 header.b=G66UDcNq
Subject: [Buildroot] [PATCH 1/1] bind: keep suboptions below option
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move kconfig comment to are "if BR2_PACKAGE_BIND" so that the two sub
options are presented in menuconfig as subordinate to "bind" package
selection rather than equal to it as if they were unrelated.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/bind/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 9887403ed9..63ccd57db7 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -29,11 +29,6 @@ config BR2_PACKAGE_BIND
 
 	  https://www.isc.org/bind/
 
-comment "bind needs a toolchain w/ NPTL, dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-
 if BR2_PACKAGE_BIND
 
 config BR2_PACKAGE_BIND_SERVER
@@ -47,3 +42,8 @@ config BR2_PACKAGE_BIND_TOOLS
 	  Install tools (dig, host, nslookup, nsupdate)
 
 endif
+
+comment "bind needs a toolchain w/ NPTL, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
