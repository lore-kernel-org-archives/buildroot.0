Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE1BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 09:24:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC6861108
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 09:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FC6861108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 414A240187;
	Fri, 22 Oct 2021 09:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 024UwVQB5Kv6; Fri, 22 Oct 2021 09:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53D1240211;
	Fri, 22 Oct 2021 09:24:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50FA51BF86B
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 09:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D99580C6D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 09:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GpLyDtNgTyS6 for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 09:24:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AFA180C41
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 09:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From;
 bh=pqfzno0TJolpO+8Kg1w9/O4TD9UeNrCsszplJLZ7e2Y=; 
 b=bTjkhZTmvo5aVVLa26fCiN8Uxer0K2KUlsOoImUSjf9J7iTzu4nnSihHFRM6wkJC7e+J61kFxa0Q1Meyf2XDWK4LinbLGat7MLB0gR6gKnrMHYUCj70HBlOBTwFB4sdeuYTX6BaRjKEGSoqR5BcX1fp89orBr0mFjSNq5dvuqOSxc30EiSiEqsfC3rCCulZROJxkYILfD4lxTbCwr7onqVwH6d6UNm7jKWeMctyKxRi3ZowwlY7aJEIbnWRKf0cTyWYnXwq42zuRBrhL0bu/wlMbfJSaYvVWXn5LfhyuCsmIo7mln0vwSNKnY3rpBKfuaNKbb4GYiTIMvOENEKjwEQ==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mdqmr-0006N3-Bs
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 11:24:29 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id be4897b1
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 09:19:34 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 12:19:34 +0300
Message-Id: <20211022091934.534382-1-aperez@igalia.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/seatd: bump to version 0.6.3
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

Update seatd to version 0.6.3, which fixes a crash when used along
libinput 1.19.

Release notes:

  https://git.sr.ht/~kennylevinsen/seatd/refs/0.6.3

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/seatd/seatd.hash | 2 +-
 package/seatd/seatd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
index 980c0faded..18f65d3aeb 100644
--- a/package/seatd/seatd.hash
+++ b/package/seatd/seatd.hash
@@ -1,5 +1,5 @@
 # Calculated locally
-sha256  1e2745ea39266de40d5beb24011782da95468b81ecfa410dd0db5ff75c665727  0.6.2.tar.gz
+sha256  5226850c163b485aebe71da0d3f4941761637e146a5c9393cb40c52617ad84a8  0.6.3.tar.gz
 
 # License files
 sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 98eea650dd..27d3155b2b 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEATD_VERSION = 0.6.2
+SEATD_VERSION = 0.6.3
 SEATD_SOURCE = $(SEATD_VERSION).tar.gz
 SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
