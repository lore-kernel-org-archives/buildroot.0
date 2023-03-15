Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9558C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 15:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D14A417DF;
	Wed, 15 Mar 2023 15:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D14A417DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAyfplUpx4Il; Wed, 15 Mar 2023 15:06:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5665641499;
	Wed, 15 Mar 2023 15:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5665641499
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6FE21BF31E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9184B40489
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9184B40489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGnlsYXbzJtu for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 15:06:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA8C4402E6
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 15:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA8C4402E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99C4B87455; Wed, 15 Mar 2023 15:06:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 16:05:43 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a6c6ad9dbd55a2c9ead2408f683bbdb6d85b79ea
X-Git-Newrev: 4e4539b2ae4621573a515821ed5657c652e0a32a
X-Patchwork-Hint: ignore
Message-Id: <20230315150626.99C4B87455@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/apache: security
 bump version to 2.4.56
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e4539b2ae4621573a515821ed5657c652e0a32a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Release notes:
https://lists.apache.org/thread/89vkczkfkdyz65d5q59pcyzrn5ts60s6

Changelog: https://dlcdn.apache.org/httpd/CHANGES_2.4.56

Fixes CVE-2023-25690 & CVE-2023-27522:
https://httpd.apache.org/security/vulnerabilities_24.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 5256ec9ca872518beacf827443fec72146ab7a0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index a1185c5618..36144917fb 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.54.tar.bz2.{sha256,sha512}
-sha256  11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac  httpd-2.4.55.tar.bz2
-sha512  94982f7a1fedac8961fc17b5a22cf763ac28cb27ee6facab2e6a15b249b927773667493fd3f7354fb13fcb34a6f1afc1bdd5cf4b7be030cba1dfb523e40d43fb  httpd-2.4.55.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.56.tar.bz2.{sha256,sha512}
+sha256  d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c  httpd-2.4.56.tar.bz2
+sha512  5f12cd9878d822384b1bb163fea4d8edee5e7a0dd8b2389264387971268145cccc6a5a27ddf0436c5f1f631acc5fdc4874da2a47911483e421ca40bf783e0e12  httpd-2.4.56.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 13018a9b1f..80205a6362 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.55
+APACHE_VERSION = 2.4.56
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
