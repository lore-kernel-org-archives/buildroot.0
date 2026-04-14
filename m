Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4E4F9D0EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC1F942CDD;
	Tue, 14 Apr 2026 19:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkjGCmKlz7Wx; Tue, 14 Apr 2026 19:08:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F1A42CD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776193684;
	bh=kofeiK9mLtcz/FBS+ebmqO0mnlPo+pIrsP5MUPWIn4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I20wKVwhjtDyDeKhY8yWkDIjEJzb/r4c3KusV5lKB9hF8X6UYscuXdpeun45xV7Yt
	 uCtWFXT6KQdFCz/OQP3t+wQ9+abq04lSLYA7cSfx6yCb48zdVYwX8AsNZAIsjTJM1J
	 7fp+j1YJObCv62YsvOsyEwOh50alMxW1X5B/kMqmnik7C0XGIsfM2Q9dC7mQgJk7bm
	 YTis1x7CCF0u4RoI2VO1gIL+qIlL00xRIZc9frjt0PawTx4OejH37C665+jJRtI6Ty
	 aQ+Mrc1oEh2oCMuosxcuQ7qIL/3q2g/+aw1uzN8jzmzpvWh03to84qH+ggLjF4ul0y
	 fkmHaoRNoSt4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1F1A42CD9;
	Tue, 14 Apr 2026 19:08:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03A8A375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E987F42CD7
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqa4fw8Igr-t for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CE3342B43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CE3342B43
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:08:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B831080519; Tue, 14 Apr 2026 19:08:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 21:06:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25ce346dd9ebc56c17cc360f030daf78b9a58f6b
X-Git-Newrev: d6c087068760f3db8eccf47607d05d9db7a11c89
X-Patchwork-Hint: ignore
Message-Id: <20260414190801.B831080519@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.122.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6c087068760f3db8eccf47607d05d9db7a11c89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_112_1.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index d2e85cb32d..d0d278c7f6 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_RTM/src/SHA256SUMS
-sha256  2699478b843b9f09c61f85341578df514463a0069447c816bef0d59bd800d777  nss-3.122.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_1_RTM/src/SHA256SUMS
+sha256  de5a655da82a67e502b802ae0b53f3eb02ea53f509c3fc0ab54a892e04493bbf  nss-3.122.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e1b507b6a7..99de6b519a 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.122
+LIBNSS_VERSION = 3.122.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
