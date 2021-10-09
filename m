Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A8CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:07:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 428FA60F57
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 428FA60F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F5CE60A65;
	Sat,  9 Oct 2021 12:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbjJzkP_srYQ; Sat,  9 Oct 2021 12:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79C3D60A44;
	Sat,  9 Oct 2021 12:07:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 034B71BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B33F960B9B
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbZroD7sEU5F for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:03:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DA2560A65
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:03:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 66CA293614; Sat,  9 Oct 2021 12:00:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:49:02 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 66071331635b39fdd6bb30b9ead823b7d91d3243
X-Git-Newrev: 94962382b4323176aeda54c4475e37fe6936c1e1
X-Patchwork-Hint: ignore
Message-Id: <20211009120024.66CA293614@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/apache: security
 bump to version 2.4.51
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

commit: https://git.buildroot.net/buildroot/commit/?id=94962382b4323176aeda54c4475e37fe6936c1e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes CVE-2021-42013, for details see [1] and [2].

Change download URL from http://archive.apache.org/dist/httpd to
https://downloads.apache.org/httpd (seems more up to date).

[1] https://downloads.apache.org/httpd/CHANGES_2.4.51
[2] https://httpd.apache.org/security/vulnerabilities_24.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7af7546f9acdefacac0e86e11c69e6e8cd3d2050)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index abcb79f14d..138717c336 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.50.tar.bz2.{sha256,sha512}
-sha256  6a2817c070c606682eb53ed963511407d3c3d7a379cdf855971467b00fb3890f  httpd-2.4.50.tar.bz2
-sha512  b1afbaf44e503b822ff2b443881dcb44a93aa55d496f88ae399a2e7def05f78590f266a16da1f2c0aac88e463b76fba20843b1e20a102e76c8269de6fae3e158  httpd-2.4.50.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.51.tar.bz2.{sha256,sha512}
+sha256  20e01d81fecf077690a4439e3969a9b22a09a8d43c525356e863407741b838f4  httpd-2.4.51.tar.bz2
+sha512  9fb07c4b176f5c0485a143e2b1bb1085345ca9120b959974f68c37a8911a57894d2cb488b1b42fdf3102860b99e890204f5e9fa7ae3828b481119c563812cc66  httpd-2.4.51.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 7a3a0ea6cc..d55f43148e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.50
+APACHE_VERSION = 2.4.51
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
-APACHE_SITE = http://archive.apache.org/dist/httpd
+APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
 APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
