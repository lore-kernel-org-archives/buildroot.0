Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C52EA719A
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 14:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C6714064F;
	Sun, 19 Apr 2026 14:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tu6hC8NHjx7G; Sun, 19 Apr 2026 14:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AD4D4012D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776608695;
	bh=knNIikpR2kOHFZOAQ14Ocqb6J9geWQAX6DJ/I+tDwio=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ca9H3GEOZZSOUUalCPnATAzUMyFDRM1xAcq4nOskmMt0wdL+h0cGBMoX93z6tWNmq
	 yi6FV/G6NWF0YKrvNN2sham6YZ5PJMGEGOThEDT/oMQVhhHldd42yBsXfm8Hs2Xn1a
	 H/dS/r+rT/DcckPyazPu3ya3L4xb5huHAefId9fSe1QYdy/oBspTW2k956XT+g0dKf
	 9jrlS5XiyNSR654pI0FZ1x+pnMvmyenvqHmhG0HCBusnT1wX5Tpnsv5KQVbSP/0nu8
	 jNlgDcmCcG1fxJoKF8dIRLPZj+JUZb8L6sq+Zm3HGABc1hGI/MHTrS+PF/+JK5f3fG
	 k/ZZGYQkRSSZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AD4D4012D;
	Sun, 19 Apr 2026 14:24:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACCB524D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA6424045C
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_O9km0h2GMc for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 14:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 071A540266
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 071A540266
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:24:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B048081841; Sun, 19 Apr 2026 14:24:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 16:14:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7bb4571f4562b6bf35354d2b33ad4f9450bb2e6
X-Git-Newrev: d8d6139f5b00fa204fdcd954efc7d37daaa4c3f5
X-Patchwork-Hint: ignore
Message-Id: <20260419142452.B048081841@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.123
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8d6139f5b00fa204fdcd954efc7d37daaa4c3f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_123.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index d0d278c7f6..31c1315783 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_1_RTM/src/SHA256SUMS
-sha256  de5a655da82a67e502b802ae0b53f3eb02ea53f509c3fc0ab54a892e04493bbf  nss-3.122.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_RTM/src/SHA256SUMS
+sha256  2145113398a269779a7390515a1638800836b130248e33f93243268c026d4e49  nss-3.123.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 99de6b519a..a09262e8ae 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.122.1
+LIBNSS_VERSION = 3.123
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
