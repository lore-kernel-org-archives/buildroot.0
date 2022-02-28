Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638F8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 12:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAFB14059E;
	Mon, 28 Feb 2022 12:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XDFTaJmkU35; Mon, 28 Feb 2022 12:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4B4840588;
	Mon, 28 Feb 2022 12:02:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4E71BF228
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 12:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4750D813FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 12:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGOrna-Nk_N9 for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 12:02:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98E1580B1A
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 12:02:48 +0000 (UTC)
Received: from localhost.localdomain ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OejlnEvDS4NL9OejmnK6Jy; Mon, 28 Feb 2022 13:02:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1646049766; bh=Xwx6Dt2Yj4UdOq5htNXkRH6s88MVSxLItj+Eiu3Eoxw=;
 h=From:To:Subject:Date:MIME-Version;
 b=OXvxtQ/AV3G0R1RAwhOx/EETZctFBu9G1YsAjieo4t8T/j54OWj/7/YEIP5hZWiXS
 HAN5aEgqvLfDoSRdu5J3rPEVyx2yuJ9tjFN9vDglkUH03KdxVKBNyd00m+MtGakF1t
 2+2K5F10pvY8lzF0SVZhAwY6mPq+KsM7wVa83EHHSE9GkL1/P0eLX2K2b63Ez/H5wu
 7piQ6DGf4E1KJl2maZXkvZyNYXVO2xh7QQSPgWKUlFH4hvyw4YqyGCxXEAdGykYx7R
 6mByxG07NU5LlJt+G1Je7iWFUdqt/9ZkPrbxRbQ2bVXaLSO8LHRm4kkscYw9bU+utM
 eYLsXfiORMfdA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 13:02:43 +0100
Message-Id: <20220228120243.3361127-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH9Q9MdygrHLYaoozv9xZWuoCMLiwcMbVgix4448MKD6S0hZF/Gs8Ine9TmAWn+mnYMZtbIhdK13TKBe0ogseIgmsDaNkJaRWTtQz4ox7NvnplvgnlOs
 ny6rkJ/kwwUKEJ9D+eikIu2h3J+zfbLzuixjvz/3T148FGdkInSpkuldd3MdWudN0zGWhIzaSm4HxjfZhfD99dWVP1JvjA80++0wA3NZx5d+3L23jcEKSwAE
 Opz9QgFQ2bFCngxGLSIOVm9t03t+0NGPyD1FiN5AzqY=
Subject: [Buildroot] [PATCH] package/at: bump version to 3.2.5
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
 package/at/at.hash | 2 +-
 package/at/at.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/at/at.hash b/package/at/at.hash
index d4ad9aa436..be3e82f9f0 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  76990cbb6f4b9bfedb926637904fdcc0d4fa20b6596b9c932117a49a0624c684  at_3.2.4.orig.tar.gz
+sha256  bb066b389d7c9bb9d84a35738032b85c30cba7d949f758192adc72c9477fd3b8  at_3.2.5.orig.tar.gz
 
 sha256  01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/at/at.mk b/package/at/at.mk
index 26c44f5287..ed38def337 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT_VERSION = 3.2.4
+AT_VERSION = 3.2.5
 AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
 AT_SITE = http://software.calhariz.com/at
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
