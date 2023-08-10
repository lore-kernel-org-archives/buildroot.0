Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169CFC04A94
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 09:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BF7F416D1;
	Thu, 10 Aug 2023 09:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF7F416D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fy4uS2B--HCW; Thu, 10 Aug 2023 09:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E052E40A76;
	Thu, 10 Aug 2023 09:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E052E40A76
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D298D1BF28A
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 09:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8973960BEF
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 09:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8973960BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BLLCHtBlGfw for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 09:59:03 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F27660BB8
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 09:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F27660BB8
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 543FC352BD87; Thu, 10 Aug 2023 11:58:55 +0200 (CEST)
Date: Thu, 10 Aug 2023 11:58:55 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNS03+WM80eE76Q3@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691661537; bh=O14/ZaArxjI9Orr+qm0dS7xlVl1XSkeEoLW99eeaIY0=;
 h=Date:From:To:Subject:From;
 b=uYWAtjdvjxHkAjjSxwAOK6VTxp6bzOwk+FF760aeaUITeCQUKEmrP3TETgUDog+XL
 ct0aZ/Tei0dhaFxn+aSlvFutMlk30e9sJ7CujUZF6TOHCgiZe2B7Y/QhmO7Vl1HAF3
 fEy0oaebPlUlIGu2OEFkcb8sYcaqJkWU6dZKdSoKQt7xRmEIExFUjI0P+Lr8IUFadA
 rjv/hQkW5HPZaliF7vzPqgGWe5mv5btWAUbY96Fpn2Nji+D3GC2S1+nUOyOIwISoXS
 Qf4rZkvhzQi8CEi6xupQd9tj1LcL7OCUZ3KIK1PoBloNwUgBtVlGLqc0/P/tg03EHz
 +NfOWCkilPplg==
Subject: [Buildroot] [PATCH/next] package/squid: update to 6.2
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

See the release notes for Squid 6 for any news:
http://www.squid-cache.org/Versions/v6/RELEASENOTES.html

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index b00d14011e..ec60a0e9d1 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v5/squid-5.7.tar.xz.asc
-md5  7a3764a3c5833631a779d7827901cda7  squid-5.7.tar.xz
-sha1  141e8007d6b1cfee34654127a9ca025125b37b58  squid-5.7.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.2.tar.xz.asc
+md5  ad01b7d82b6a00ffd8cd39b97113d05a  squid-6.2.tar.xz
+sha1  29ddb4c522a36f1270e7cfa66f0dec8805fd2b57  squid-6.2.tar.xz
 # Locally calculated
-sha256  6b0753aaba4c9c4efd333e67124caecf7ad6cc2d38581f19d2f0321f5b7ecd81  squid-5.7.tar.xz
+sha256  dd759e151e997d31786d91743d327b1b4b532f1caea66bf81100ec8ba04ec4c1  squid-6.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 355af0b902..167e9f67d8 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQUID_VERSION = 5.7
+SQUID_VERSION = 6.2
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
-SQUID_SITE = http://www.squid-cache.org/Versions/v5
+SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
