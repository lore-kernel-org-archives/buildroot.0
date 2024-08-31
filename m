Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799CECD13D9
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 21:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48FF060729;
	Sat, 31 Aug 2024 21:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTAPsLsWqhHv; Sat, 31 Aug 2024 21:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2AA60733
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B2AA60733;
	Sat, 31 Aug 2024 21:50:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3660D1BF588
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3208381769
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDq87-rxXyyc for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 21:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD8E81A12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD8E81A12
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 21:50:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 663AE86879; Sat, 31 Aug 2024 21:50:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 23:43:25 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: bf5e5d27e30e2ecfce2a195c9df98c548ffb471f
X-Git-Newrev: ce93c5756eaba72e5413b06a933471bf6ce5ac23
X-Patchwork-Hint: ignore
Message-Id: <20240831215057.663AE86879@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/apache: security
 bump version to 2.4.62
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce93c5756eaba72e5413b06a933471bf6ce5ac23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fixes CVE-2024-40725 & CVE-2024-40898.

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.62

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bac05f9b21219a209484b7df8d3b89f5d90feb99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 2ed9c17f9a..b281b4beab 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.61.tar.bz2.{sha256,sha512}
-sha256  ea8ba86fd95bd594d15e46d25ac5bbda82ae0c9122ad93998cc539c133eaceb6  httpd-2.4.61.tar.bz2
-sha512  00656220ecc2b80788f539536553f0a3a57602fb981be22e63af87d0f98ffe5da3056e722ce52ae8cf9c2111ad1922b3aaea1fd7d69d0ed76795199203d593ff  httpd-2.4.61.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.62.tar.bz2.{sha256,sha512}
+sha256  674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec  httpd-2.4.62.tar.bz2
+sha512  7db1876805d5c0f60f49bcb51f75cdf567120f2ff6349e68f084e9a86ae38265d9f1c67e7fca0082c9db136f3c408a88501ee11f26b1b68724ba240867171d77  httpd-2.4.62.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 0319a96815..0a0a0b3de4 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.61
+APACHE_VERSION = 2.4.62
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
