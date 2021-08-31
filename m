Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00520C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:31:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D6260184
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5D6260184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACF340489;
	Tue, 31 Aug 2021 06:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74dPqNHMl_HG; Tue, 31 Aug 2021 06:31:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A2A44050D;
	Tue, 31 Aug 2021 06:31:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1431BF990
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 680F6401D3
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgC4EfIuhxL4 for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 06:30:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C12604012D
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 06:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 01D1887D38; Tue, 31 Aug 2021 06:29:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 08:30:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd20e704ec8cae08ec02188c3e967abba4902f03
X-Git-Newrev: b8a1d969b91b99ab2bf74ecb41402d21fee59b25
X-Patchwork-Hint: ignore
Message-Id: <20210831062935.01D1887D38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.4.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8a1d969b91b99ab2bf74ecb41402d21fee59b25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37333073/

"It contains the security fix for CVE-2021-36386 of 6.4.20, and fixes
a regression/a bug that causes log message truncation/run-together
prominently visible with --logfile that was introduced into 6.4.20."

Updated note for CVE-2021-36386:
https://sourceforge.net/p/fetchmail/mailman/message/37333078/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
