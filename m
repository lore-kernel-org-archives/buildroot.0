Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575FAC3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 10:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCD37611B9;
	Thu, 11 Jul 2024 10:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZ746aCOZFwt; Thu, 11 Jul 2024 10:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 474D661105
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 474D661105;
	Thu, 11 Jul 2024 10:12:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74B0A1BF40D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 619DF4097C
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQJmeE50PswN for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 10:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA85408C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AA85408C5
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:12:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56D1484BCE; Thu, 11 Jul 2024 10:12:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 12:12:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6ab6731fa24fc9a51fd55b111c8eb6afd1feee37
X-Git-Newrev: 6e5487d739502a1b0e4e98075bc62087b7da484a
X-Patchwork-Hint: ignore
Message-Id: <20240711101252.56D1484BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/apache: security
 bump version to 2.4.61
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e5487d739502a1b0e4e98075bc62087b7da484a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes CVE-2024-39884.

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.61

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 158c2a000404cfcb3a216054c686d11454a5ef7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index bd503d84f9..2ed9c17f9a 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.59.tar.bz2.{sha256,sha512}
-sha256  7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f  httpd-2.4.60.tar.bz2
-sha512  c1591389f76699beaa5d32b019729e25f1ed5b828311c82b52f1a4edd5d28b73e697958df384d7628b314521a831dbb0af418bc37cdf031cfe133e53c195d8ad  httpd-2.4.60.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.61.tar.bz2.{sha256,sha512}
+sha256  ea8ba86fd95bd594d15e46d25ac5bbda82ae0c9122ad93998cc539c133eaceb6  httpd-2.4.61.tar.bz2
+sha512  00656220ecc2b80788f539536553f0a3a57602fb981be22e63af87d0f98ffe5da3056e722ce52ae8cf9c2111ad1922b3aaea1fd7d69d0ed76795199203d593ff  httpd-2.4.61.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 39ccc3cf96..0319a96815 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.60
+APACHE_VERSION = 2.4.61
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
