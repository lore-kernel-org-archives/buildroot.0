Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10352C4167D
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAD6781E5F;
	Mon, 30 Oct 2023 10:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAD6781E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lk_sJ_v_rFR; Mon, 30 Oct 2023 10:19:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08162812E3;
	Mon, 30 Oct 2023 10:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08162812E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD9A1BF38B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83F748546F
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F748546F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPG0mNLjCQMr for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 197E5850F6
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 197E5850F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0356985FD1; Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 11:15:37 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 6489cb62b217044eecb598c173d86f5d9da58313
X-Git-Newrev: be9c7b92e4e77074e2de34c190ea901784a6ec2f
X-Patchwork-Hint: ignore
Message-Id: <20231030101903.0356985FD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/apache: security
 bump version to 2.4.58
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

commit: https://git.buildroot.net/buildroot/commit/?id=be9c7b92e4e77074e2de34c190ea901784a6ec2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes CVE-2023-31122, CVE-2023-43622 & CVE-2023-45802:
https://httpd.apache.org/security/vulnerabilities_24.html

Release notes:
https://lists.apache.org/thread/1qnr3jpk1mdnqc2c6foyjvg0ch636h1n

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d00881cad152040cc679c37124d636196ab7eb82)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 1f0020f65a..854bc85dcc 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.57.tar.bz2.{sha256,sha512}
-sha256  dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a  httpd-2.4.57.tar.bz2
-sha512  4d1e0a274ee90bdfb5f38d4a7d73a7367ed1c6388e26280e640014e49abc0df03683705b88dcfe2ec2da313dda4c7b4a3b86daffa1911f58e224eba89d82d155  httpd-2.4.57.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.58.tar.bz2.{sha256,sha512}
+sha256  fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5  httpd-2.4.58.tar.bz2
+sha512  d6e73bf413a507ec16b621ff635e178206207a9e9810ce3944b3dc98d39cde8f225307110167fc9da5822175796c8cb66f98be5b9f0d8b76dcd83a401d39b2c1  httpd-2.4.58.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 320a6ad20e..cac62134ed 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.57
+APACHE_VERSION = 2.4.58
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
