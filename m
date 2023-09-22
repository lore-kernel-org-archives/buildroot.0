Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F340CE7A86
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 21:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A795F41995;
	Fri, 22 Sep 2023 21:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A795F41995
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0JhT0k-Pv-V; Fri, 22 Sep 2023 21:39:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECB6E4052E;
	Fri, 22 Sep 2023 21:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECB6E4052E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74C9A1BF476
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 21:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3815560586
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 21:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3815560586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApmMZVdOoV2I for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 21:39:44 +0000 (UTC)
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73CB4600B3
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 21:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73CB4600B3
Received: from localhost.localdomain ([84.33.144.138])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jnsCq21Eai8ZBjnsCq7tNE; Fri, 22 Sep 2023 23:39:40 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 23:39:40 +0200
Message-Id: <20230922213940.200046-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEN03sBvIoVQ17VvJl57cKpfR75PzxBwaVOXYTlLPIUD9Q8RNP2IUmTpzr2+zemDWySvn0d9cYUQAoovXZGXcsQLmFhSYh/XPF8Wy9pYaruFnWL1x3TQ
 nWNiDJeT9ntXJmh6NNccu0sHECig/WwFJ53a/iWAupiioYvPNrrFN4JGNihCCG62JqZKuCrTdZklUYEDq9Y4Y8r0Gchp2+P4/+R09sma8KtoNZr16YBY8glg
 HNjYNQX35Tk4JxSqhZTS98CtjVDtJg7oagO+e5j0rzxePXVa68xPR5NJZUjBGGlvef47JzuX58TQvAF1scfG7A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695418780; bh=iRdppxCFKvbUlzAH064paqG1GIKvgldRCntqQV8LF3Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=ivGAQ6iGpuzVgDv6UHRkJ8sqipMiexVrVpY2hXBf5q6k+AWMXxWkBil+zSu+SdDK0
 bUGTk9L/IBexq0vfBzvNEjFylHIuRdYMFzJmMb/EN1MOd8+FmT6eVtZH6GObpe3c+9
 RYlQrujVjZ7Iv/orWN42sIMmVKQfUM3EuqJz5VTtSyh3M8ut3aB9gTun0PzZopGFEC
 /3gNdHFozWMiqINtEkSwRTr72WyNB01CtAW8S9rYhrml9V0tR9kCjENxa+8PX7SrMn
 +RGYPIHx0KosziatOIlpDi4MaEef4ApmaCghfubgjMpBAWzaNM2dnD3CKhvcY9GXLu
 MJFm0du9hLfFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ivGAQ6iG
Subject: [Buildroot] [PATCH] package/minicom: bump to version 2.9
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
 Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 42a4499c85..dd10450262 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  38cea30913a20349326ff3f1763ee1512b7b41601c24f065f365e18e9db0beba  minicom-2.8.tar.bz2
+sha256  9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c  minicom-2.9.tar.bz2
 sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index e31964f17a..a4e8fa04ef 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.8
+MINICOM_VERSION = 2.9
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.bz2
 MINICOM_SITE = \
 	https://salsa.debian.org/minicom-team/minicom/-/archive/$(MINICOM_VERSION)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
