Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1E2C32771
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 19:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66C0A41132;
	Thu, 15 Sep 2022 19:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66C0A41132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3ZVO2reT6f2; Thu, 15 Sep 2022 19:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73BEB41129;
	Thu, 15 Sep 2022 19:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73BEB41129
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 081DB1BF309
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 19:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7C3B83EE0
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 19:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C3B83EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmKgl0gDCSdu for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 19:42:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D797D83EDE
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id D797D83EDE
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 19:41:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YukHosPa7MW5FYukHo5Yat; Thu, 15 Sep 2022 21:41:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 21:41:56 +0200
Message-Id: <20220915194156.1700991-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEG3lg9LQi/N+tITlddR8/PlRplJXNYuk0CqPtyfcH9UPc5IzX+lf0icFOqf85r11UxeRU8LutB4JBn3rhqZeW1hvbDil/pHDHFHewoKHVJXzuwlMEhp
 D6ppO5/ImaA8K8kGQ4+1sRVshZV7F9n2gPJN5QcRTqdtnED0wJAX6TAuc4W5DsL7otLRcJ86HQIRAuop/k4iR/vm4iIemmegrfS1pSk7b3IO2nvbwxrMirq5
 LT/smImTBJdbYhhIWmsJajE3Z58zUsaCwRIVutyiIEqIvE2UcxY0JagFauDraGVrsfmJx7XXKATeLxIIKLCAaA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663270917; bh=BMHFxXEJPWH7yYHwkwaPpHN+Is84lnUmcMv8UhPkdpA=;
 h=From:To:Subject:Date:MIME-Version;
 b=Yn0xbxcSJzzWrjBjno/DRVf4IS0Bz8bD26CCLkCSUB/WCUPjJRyrrQAmuCgFz9Uzz
 sEb/6f8B4EBQ+6DyT6kExkpvbPwZkuvQujQegRueCITVvooShzm4IZc9Qxfk/WL8Lz
 y9YNaasY3cutni6hwdYFj5OTbgeJMT2DBTW9xHMhcLF/fQwsqZa0hiP5mXoOKDEbn7
 dt7tU9OJID4V3XnpPu3VSziU3agE9l/AFSDsbPb85l0Vz+rgTj4/3LdDkCGFcQVEV+
 ZZ6u8muIYMxZ09M5UxrcQWBasr/h7nvhl2z4rq7WOr06eYZclrGKM4vJ9cNMRPz+Wx
 tYxcDBsfKi1EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Yn0xbxcS
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.83
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
index 2133113a4f..026344668f 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_82_RTM/src/SHA256SUMS
-sha256  32bf673b72c2f9953ed3b4c7033abf5a6cad302854a24ae588c575a6567c1573  nss-3.82.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_83_RTM/src/SHA256SUMS
+sha256  ab23ea67f964090b8b73c80a674082571c36e5f4eba92057ac648c9c1def0128  nss-3.83.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 6e839cced6..1099ae199c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.82
+LIBNSS_VERSION = 3.83
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
