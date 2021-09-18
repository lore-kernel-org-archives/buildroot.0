Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A62C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:29:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5043610E9
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5043610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD9A28405B;
	Sat, 18 Sep 2021 20:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgvBIHoK-Kex; Sat, 18 Sep 2021 20:29:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FF3584056;
	Sat, 18 Sep 2021 20:29:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 647641BF95D
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 457BD6059C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZO0fMW8so8Hc for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:29:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 845D060594
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:29:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8C82F8B6C0; Sat, 18 Sep 2021 20:27:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 22:28:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3ebd1258270b2f699cd9dfa3496f76df752b1cb
X-Git-Newrev: 6041702a24cef3b06bdb1c3302c75c95ad6a561e
X-Patchwork-Hint: ignore
Message-Id: <20210918202738.8C82F8B6C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: security bump to
 version 6.4.22
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6041702a24cef3b06bdb1c3302c75c95ad6a561e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-39272: Fetchmail before 6.4.22 fails to enforce STARTTLS session
  encryption in some circumstances, such as a certain situation with IMAP
  and PREAUTH.
  https://www.fetchmail.info/fetchmail-SA-2021-02.txt

Update COPYING hash for a clarification of the license situation with
openssl 3.x (which is Apache 2.0 licensed):

https://gitlab.com/fetchmail/fetchmail/-/commit/8eed56c21ca5bbdf3c00aaf74d807bcad8713ba9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fetchmail/fetchmail.hash | 8 +++-----
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 30df3eb834..88deb343c4 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,6 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37327392/
-sha256  6a459c1cafd7a1daa5cd137140da60c18c84b5699cd8e7249a79c33342c99d1d  fetchmail-6.4.21.tar.xz
-# From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  a264c50256c2b42d2c7893f9efae7c9a29350786  fetchmail-6.4.21.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37350119/
+sha256  cc6818bd59435602169fa292d6d163d56b21c7f53112829470a3aceabe612c84  fetchmail-6.4.22.tar.xz
 # Locally computed:
-sha256  6346b5aa04e258fa4326272ea92372d796b4382aa963535ae98a3bb5f8cd5aeb  COPYING
+sha256  001d1b8d111a83e3bab8b4d511ea4767d37d3bd0583560fccece630df1ba8f3c  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 0b4cf39cbd..77d9733296 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).21
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).22
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
