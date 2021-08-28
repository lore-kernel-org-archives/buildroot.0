Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D60C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A56761101
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A56761101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AC1A80D91;
	Sat, 28 Aug 2021 08:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHFXLLIN7CAS; Sat, 28 Aug 2021 08:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6CF282F87;
	Sat, 28 Aug 2021 08:25:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B18221BF30A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E2854278E
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwtilN1CHzgi for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 08:25:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53EC442768
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:25:39 +0000 (UTC)
Received: from fwd19.aul.t-online.de (fwd19.aul.t-online.de [172.20.27.65])
 by mailout01.t-online.de (Postfix) with SMTP id 48A02996
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:25:36 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (Ze3pRiZDQhpPWi6xJBZy4s+6rSeZQW4v5hjOxt9ozI3SQeSlaj2UYQz54+3uFawZST@[79.214.206.166])
 by fwd19.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mJted-06Pcie0; Sat, 28 Aug 2021 10:25:31 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:37690)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mJted-0000OB-B9
 for buildroot@buildroot.org; Sat, 28 Aug 2021 10:25:31 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 10:25:31 +0200
Message-Id: <20210828082531.585788-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: Ze3pRiZDQhpPWi6xJBZy4s+6rSeZQW4v5hjOxt9ozI3SQeSlaj2UYQz54+3uFawZST
X-TOI-EXPURGATEID: 150726::1630139131-0000782A-F8EB06D3/0/0 CLEAN NORMAL
X-TOI-MSGID: a991aba5-a447-4662-a3b4-bf82710fd861
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.4.21
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37333073/

"It contains the security fix for CVE-2021-36386 of 6.4.20, and fixes
a regression/a bug that causes log message truncation/run-together
prominently visible with --logfile that was introduced into 6.4.20."

Updated note for CVE-2021-36386:
https://sourceforge.net/p/fetchmail/mailman/message/37333078/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 41d71088ba..30df3eb834 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/p/fetchmail/mailman/message/37327392/
-sha256  c82141ae2e8f0039ceb0c5c2eda43c5e93ad0bf7f9c6bb628092b3be74386176  fetchmail-6.4.20.tar.xz
+sha256  6a459c1cafd7a1daa5cd137140da60c18c84b5699cd8e7249a79c33342c99d1d  fetchmail-6.4.21.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  ac6a6c4afa105e097d025340cf78b32e0c3b0c8e  fetchmail-6.4.20.tar.xz
+sha1  a264c50256c2b42d2c7893f9efae7c9a29350786  fetchmail-6.4.21.tar.xz
 # Locally computed:
 sha256  6346b5aa04e258fa4326272ea92372d796b4382aa963535ae98a3bb5f8cd5aeb  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 7d276bccff..0b4cf39cbd 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).20
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).21
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
