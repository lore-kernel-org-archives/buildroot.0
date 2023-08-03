Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3511C00528
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 19:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3135C834D5;
	Thu,  3 Aug 2023 19:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3135C834D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXlZr-8e8DmC; Thu,  3 Aug 2023 19:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43FF382132;
	Thu,  3 Aug 2023 19:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43FF382132
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4B31BF995
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E36C760B99
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36C760B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-lvFfrfuI8H for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 19:19:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E295060B74
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 19:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E295060B74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF9F0841C8; Thu,  3 Aug 2023 19:19:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 3 Aug 2023 21:19:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2672fb08730dc378079672b02aa4c1f713b186ab
X-Git-Newrev: fdbe83166ff7b2bbc6d3c71e404be81df61ce431
X-Patchwork-Hint: ignore
Message-Id: <20230803191921.CF9F0841C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: security bump version
 to 3.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdbe83166ff7b2bbc6d3c71e404be81df61ce431
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
CVE-2023-2975: https://www.openssl.org/news/secadv/20230714.txt
CVE-2023-3446: https://www.openssl.org/news/secadv/20230719.txt
CVE-2023-3817: https://www.openssl.org/news/secadv/20230731.txt

Changelog: https://www.openssl.org/news/cl30.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index ddba5f2049..b43281c7eb 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1u.tar.gz.sha256
-sha256  eb1ab04781474360f77c318ab89d8c5a03abc38e63d65a603cabbf1b00a1dc90  openssl-3.0.9.tar.gz
+# From https://www.openssl.org/source/openssl-3.0.10.tar.gz.sha256
+sha256  1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323  openssl-3.0.10.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 41626d20e1..8bc3687921 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.0.9
+LIBOPENSSL_VERSION = 3.0.10
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
