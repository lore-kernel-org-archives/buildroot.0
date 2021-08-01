Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484C3C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:39:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E58BB60F9D
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E58BB60F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B217E607BE;
	Sun,  1 Aug 2021 06:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQmJhfsJSz-H; Sun,  1 Aug 2021 06:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03610607B5;
	Sun,  1 Aug 2021 06:39:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C02BD1BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B86C740197
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKrMDPEmjtQt for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 06:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E93534158B
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 06:39:23 +0000 (UTC)
Received: from fwd13.aul.t-online.de (fwd13.aul.t-online.de [172.20.27.62])
 by mailout09.t-online.de (Postfix) with SMTP id 5A7FA4A7B
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:38:48 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (r3Q8C+ZVrhSaG6s5ACGY-x1EHdFTruhoY1pQHo-n533HTmgOJGQLHjzS9GOKD7VwWI@[79.214.201.246])
 by fwd13.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mA57V-04tr2e0; Sun, 1 Aug 2021 08:38:45 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:34236)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mA57U-0005oi-R4
 for buildroot@buildroot.org; Sun, 01 Aug 2021 08:38:45 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 08:38:44 +0200
Message-Id: <20210801063844.14313-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: r3Q8C+ZVrhSaG6s5ACGY-x1EHdFTruhoY1pQHo-n533HTmgOJGQLHjzS9GOKD7VwWI
X-TOI-EXPURGATEID: 150726::1627799925-00014A6A-CC00F72D/0/0 CLEAN NORMAL
X-TOI-MSGID: 4778fc6b-618b-4ad2-b4c9-e19469df9d30
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: security bump version to
 6.4.20
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

Fixes CVE-2021-36386:
https://sourceforge.net/p/fetchmail/mailman/message/37327393/

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37327392/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fetchmail/fetchmail.hash | 6 +++---
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 8f092a3f80..41d71088ba 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37267719/
-sha256  cd8d11a3d103e50caa2ec64bcda6307eb3d0783a4d4dfd88e668b81aaf9d6b5f  fetchmail-6.4.19.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37327392/
+sha256  c82141ae2e8f0039ceb0c5c2eda43c5e93ad0bf7f9c6bb628092b3be74386176  fetchmail-6.4.20.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  bb6959f0cf1f6d689c2ba3834c5bba72e4f9ec07  fetchmail-6.4.19.tar.xz
+sha1  ac6a6c4afa105e097d025340cf78b32e0c3b0c8e  fetchmail-6.4.20.tar.xz
 # Locally computed:
 sha256  6346b5aa04e258fa4326272ea92372d796b4382aa963535ae98a3bb5f8cd5aeb  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 10a544413f..7d276bccff 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).19
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).20
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
