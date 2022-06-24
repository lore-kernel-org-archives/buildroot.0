Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DBFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Jun 2022 00:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08B564017B;
	Fri, 24 Jun 2022 00:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08B564017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vq2SqOr-HweS; Fri, 24 Jun 2022 00:02:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2EED405D2;
	Fri, 24 Jun 2022 00:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2EED405D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35C961BF297
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 00:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10B8B84623
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 00:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B8B84623
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_-KEyr0N253 for <buildroot@lists.busybox.net>;
 Fri, 24 Jun 2022 00:02:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AC378460C
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AC378460C
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 00:02:19 +0000 (UTC)
Received: from localhost.localdomain ([146.241.55.231])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 4Wm9ofTRHr8wy4Wm9oAEil; Fri, 24 Jun 2022 02:02:18 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jun 2022 02:02:16 +0200
Message-Id: <20220624000216.85808-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFtwUDvYrIMsWK1NVGNEtPK61S+pCDY/cj5C2h0b+brTW2l5hgfA6UDZzzW1VOHPtPs3trmJIr+QICEl5nn2tXsQZ9GH9X2qVtXs/JGf6XiB4N0/R6bF
 sL4fDX0YcOf8AiJSLorHX+vMX8nId8NbssF7tBrtuanmQzpQvH3BpyeqT1ibj5/Te5fzfdAjOyuPjX7zBk2klTlLKbIBLgVasWTHEVYEl3W5eisJ60mitH3u
 7rgWkhOViD6ON4cwOl38mXeerPZCPwc6xammJnd2e88jR5MpQB29l9sFx9OEdBq/HFIex+ZXlM+VvheRkbdv9A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1656028938; bh=Dn1OubulAw2zusuYCEnrAV0ddUNN8itbE9vShtuu/8w=;
 h=From:To:Subject:Date:MIME-Version;
 b=O8C/Y9kCbHwhVT/235IGRtAnFvPdUALJh5ilPSEjV1A/h7ux1hiZC3eXvJJMTnBat
 R6Em/VmZkMueY7gf0ZOcVWRB5ZvJJAoUq115FNSszY8ZwZt88dftYsS9u1QYlMY68I
 sfI/Cu9rwF0TxWY+9lcs54vf5XIhaHJZHS4KnJpBDncTWkr94NUT+zb3KXklKfJO2/
 94ksj+mpJGc9fZ66fqOGEaS02Vx0Sd8n7Yr5qxXCTg5BGxvyW7u1vniS8c4PF5v385
 vBj7Vui7FDTg3ZjQJg4txs1lYruiLUVwIFgCDYFUSUlkHVjXma0gNw6JVXkIqIJIWv
 4uoKimjkBF7kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=O8C/Y9kC
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.80
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

Let's drop local patch that has been upstreamed:
https://hg.mozilla.org/projects/nss/rev/190801f7f1fb25490098487abacb1fd2ca5ef1e8

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...36-Fix-build-failure-on-Aarch64-host.patch | 37 -------------------
 package/libnss/libnss.hash                    |  4 +-
 package/libnss/libnss.mk                      |  2 +-
 3 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch

diff --git a/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
deleted file mode 100644
index 12b376744e..0000000000
--- a/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9d5900c1ee9000906a90923e861b0fd7f1061cde Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 24 May 2022 23:40:45 +0200
-Subject: [PATCH] Bug 1771036 - Fix build failure on Aarch64 host
-
-If trying to build on Aarch64 host for powerpc64 target we can't override
-the LDFLAGS leading to this build failure:
-gcc: error: unrecognized command-line option '-m64'
-
-So let's add NATIVE_LDFLAGS check and use it to link nsinstall. This way
-any build environment can pass LDFLAGS that fits better for host
-architecture.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=1771036]
----
- coreconf/nsinstall/Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
-index 08dfbc2fe..5061789ff 100644
---- a/nss/coreconf/nsinstall/Makefile
-+++ b/nss/coreconf/nsinstall/Makefile
-@@ -34,6 +34,10 @@ ifdef NATIVE_FLAGS
- OS_CFLAGS=$(NATIVE_FLAGS)
- endif
- 
-+ifdef NATIVE_LDFLAGS
-+LDFLAGS=$(NATIVE_LDFLAGS)
-+endif
-+
- include $(DEPTH)/coreconf/rules.mk
- 
- # Redefine MAKE_OBJDIR for just this directory
--- 
-2.34.1
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index f7da9ccfdc..0f4c3cabe6 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_79_RTM/src/SHA256SUMS
-sha256  ebdf2d6a96613b6fe70ad579e9f983e0e94e0110171cfb2999db633d3394a514  nss-3.79.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_80_RTM/src/SHA256SUMS
+sha256  c0bf1fd2c7e29a6b02b309622baafc443eec90c8934bb155da4bb98988784b6a  nss-3.80.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 70f53a9140..e7aa730435 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.79
+LIBNSS_VERSION = 3.80
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
