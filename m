Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EDEC19F4F
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 20:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5238261401;
	Wed, 16 Aug 2023 20:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5238261401
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8ANA08dFfv5; Wed, 16 Aug 2023 20:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95B90613FE;
	Wed, 16 Aug 2023 20:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95B90613FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96B1A1BF381
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 20:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BE8742066
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 20:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE8742066
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whitutkbBc8P for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 20:06:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55DE542065
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 20:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DE542065
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78D01A4C0824
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 22:06:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55626)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qWMmG-0003dL-0p
 for buildroot@buildroot.org; Wed, 16 Aug 2023 22:06:00 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 16 Aug 2023 22:06:00 +0200
Message-Id: <20230816200600.1399409-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692216360;
 bh=irbTDNpXL+nKIWGRopVyN9ZTwz8z4m+k/mN+dFz++x4=;
 h=From:To:Subject:Date:From;
 b=qXYhr3PvZLp6dnjEdB3VtTZWu0GxipL+aUY3tWcxgWZMWF2UXvaPDK4j82WMF0P/5
 HCnuay4sSFEOIl10MXBnuzGNikfY6H7RhPBtmWzu2mRXJy6GsZxXolqYmRX8Z96ZHp
 wB3CpmYBmBE967VtNdEvm3Xqsml4Tigog5A/oM/vb2OnLg4ZSf/trb1Cl1FPT8ycQu
 G5UJ7R+z8AMAdrJDLMXSxg7PJNYIGgd/ZpOM9o1A3NTsLatqfR1n3ZckqRzlCcMkPc
 3WeKtXlpYfgvN0oRZ9CtQzpw5aBzzxbzZoufrGdc1e4YIpLakMu4Xcq2SbRcb4M126
 dqejBz3fE3sYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=qXYhr3Pv
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.18.6
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

Release notes: https://www.samba.org/samba/history/samba-4.18.6.html

Includes a mitigation for CVE-2007-4559.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 1901707f3b..fb278c1124 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.18.5.tar.asc
-sha256  095256ac332e1d9fbf9b7ff7823f92a3233d3ed658ce7fc9b33905c2243f447f  samba-4.18.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.18.6.tar.asc
+sha256  284c8a994ce989c87cd6808c390fcb9d00c36b21a0dc1a8a75474b67c9e715e7  samba-4.18.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index edc0fee286..7b9e320012 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.18.5
+SAMBA4_VERSION = 4.18.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
