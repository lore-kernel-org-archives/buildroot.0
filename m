Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FCAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:46:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6251F61439
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6251F61439
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1177960E9E;
	Wed, 29 Sep 2021 19:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVM0DJvj1yVz; Wed, 29 Sep 2021 19:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5720A6137E;
	Wed, 29 Sep 2021 19:46:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EFC41BF4D5
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E46960E6D
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqYp6HCW31Fb for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 19:46:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 363C960697
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:46:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CADA98D65D; Wed, 29 Sep 2021 19:43:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 21:45:30 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: bcc232c23aac108ff3ee9779451c1d5ffb22ddf0
X-Git-Newrev: 4a63b0f8e9490d44f2b0325883a53f4a8fc365b1
X-Patchwork-Hint: ignore
Message-Id: <20210929194358.CADA98D65D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/fetchmail:
 security bump to version 6.4.22
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4a63b0f8e9490d44f2b0325883a53f4a8fc365b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 6041702a24cef3b06bdb1c3302c75c95ad6a561e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 590057e4a9..7f42dd8c61 100644
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
