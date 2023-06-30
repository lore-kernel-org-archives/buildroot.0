Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F2BEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 30 Jun 2023 20:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C74F41F31;
	Fri, 30 Jun 2023 20:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C74F41F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPyBGB8YJ78z; Fri, 30 Jun 2023 20:53:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9736241F21;
	Fri, 30 Jun 2023 20:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9736241F21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8764D1BF2BB
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 20:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ECAA416E3
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 20:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ECAA416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UF4KDK82LTu4 for <buildroot@lists.busybox.net>;
 Fri, 30 Jun 2023 20:53:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4422F400C8
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4422F400C8
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 20:53:49 +0000 (UTC)
Received: from localhost.localdomain ([146.241.103.123])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FL7iqrNApnKsAFL7iqDbnf; Fri, 30 Jun 2023 22:53:47 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jun 2023 22:53:46 +0200
Message-Id: <20230630205346.404448-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDQrNk0mOk6Ty7sHfMKLLm3OS0koGYYEjCFj6QTB21dZMKpawSlW1OoXNxUnBxCG0FipPyIDzk6DC/Hfqn6jBnrUKv1lJbIetQmFppETNIZSH4pFbu1Z
 sPvEMBgIlwZRR9Rxj0RZqZbPEcHtak8idG419IhZicp0L+WDrY6MU/Nb7T8g7AGHPhq9ioUcYicNfh0i/i2hccrI2cEGg36aEhQ2uRJklC7uIqC4YKH+l96e
 E5EJJ1n2Kc7+2ooI/dVimDUmovIzkFHDqozbCu0KelNnl29hUfkBHIwLqvzIhpk1H1Fdk3/D7M1RIJpOcm9Eyg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1688158427; bh=O8U+xegLEW4LTStvUF9+Dnu6DZFZQaz7s2VF/nkmZu8=;
 h=From:To:Subject:Date:MIME-Version;
 b=M2JpbM3raNKGR0BjsN0I0NSmQPGlYWWGRZKO+bd/RZ+bXTK1FFnnZ75d8qChiK+26
 g4ZgCSYFVOnyzMzIDg4kRY3Fxah2vdVsDUXoVv4IPE8RiMcHIZ9PifZMDnwI1zXrFN
 z+GC9FdAU2Qrkdu4MRMaIxRwmuYcujEOjdZsGlYhQaoKZh63+yaVnQzlHRuLAqYjs0
 7J29wnxJSgRc0XoLX0d0gPAjX92YHKsyA6L9cjszJWXguif+4CiugNbAm13vhvaac/
 fGbbs0QNy7W0rCokJRWvm7S4aDbi2bNpZ2xzRQ0nlUvb/VYXFA/3sFeGzbR6Hpvc2N
 C60icmGCl6NYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=M2JpbM3r
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.91
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 63a35285d7..5a4fde42b6 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_89_1_RTM/src/SHA256SUMS
-sha256  3adaedb9e70c3c5f40603bf60a01e336190a6dbe01929d395f16b01fe84a0156  nss-3.89.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_91_RTM/src/SHA256SUMS
+sha256  84bd46376df17118c55f6d73d30fd93a0af21296c66e7690471547e5898fc4b3  nss-3.91.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index d3f227e909..09ac971d35 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.89.1
+LIBNSS_VERSION = 3.91
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
