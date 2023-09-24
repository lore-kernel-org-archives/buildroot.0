Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ECBCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C76D417A8;
	Sun, 24 Sep 2023 10:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C76D417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bMoT4p_j_nQ; Sun, 24 Sep 2023 10:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FA9D418E3;
	Sun, 24 Sep 2023 10:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA9D418E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79D081BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33DD660EDE
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33DD660EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulDMCgcSY8EQ for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25D3760B98
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25D3760B98
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 135E1874A8; Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 12:24:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9194e8cdedc02aa3c22636acfec2463277a11305
X-Git-Newrev: fb8999f59b45c66e06209c9b1ea8de51dd3d5e04
X-Patchwork-Hint: ignore
Message-Id: <20230924103354.135E1874A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: bump version to 3.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb8999f59b45c66e06209c9b1ea8de51dd3d5e04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2023-4807 (Windows-only):
https://www.openssl.org/news/vulnerabilities.html

Changelog: https://www.openssl.org/news/cl31.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 1c82cd7cf8..9126175977 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.1.2.tar.gz.sha256
-sha256  a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539  openssl-3.1.2.tar.gz
+# From https://www.openssl.org/source/openssl-3.1.3.tar.gz.sha256
+sha256  f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6  openssl-3.1.3.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9c1dbe8694..b69ef032f2 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.1.2
+LIBOPENSSL_VERSION = 3.1.3
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
