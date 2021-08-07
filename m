Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F72C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:20:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40CC661078
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40CC661078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF96C403CE;
	Sat,  7 Aug 2021 17:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isXuocvwoKOx; Sat,  7 Aug 2021 17:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DD14034B;
	Sat,  7 Aug 2021 17:20:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8D41BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B38BD400F2
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGwYI50Uwb8A for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AAB040135
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E090C8CA15; Sat,  7 Aug 2021 17:19:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:17:48 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5d1b399aeabbb67a9b03b20971c406edff937ada
X-Git-Newrev: 59a02a27065f815620d938d6a160251b77cdef90
X-Patchwork-Hint: ignore
Message-Id: <20210807171910.E090C8CA15@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/fetchmail:
 security bump version to 6.4.20
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=59a02a27065f815620d938d6a160251b77cdef90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes CVE-2021-36386:
https://sourceforge.net/p/fetchmail/mailman/message/37327393/

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37327392/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0d75f5a00dc2daa88af82c875328d7fabf2f9b63)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 7233da98a5..d1c5fa3704 100644
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
