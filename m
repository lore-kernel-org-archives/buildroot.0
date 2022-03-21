Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2D5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 07:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49F8980CE3;
	Mon, 21 Mar 2022 07:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BChQsiE0g3tU; Mon, 21 Mar 2022 07:38:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54C1780C14;
	Mon, 21 Mar 2022 07:38:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFC391BF9AC
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFDA84010F
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reNOQMXgQXoJ for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 07:38:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FF91400FB
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 07:38:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EF4D084711; Mon, 21 Mar 2022 07:29:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 08:36:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ba8df4289069a365c3c092979bbb8f6f6f371183
X-Git-Newrev: 6eca04a4ecbfe2e545853b17b37b57efb4933f14
X-Patchwork-Hint: ignore
Message-Id: <20220321072912.EF4D084711@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libressl:
 security bump to version 3.3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=6eca04a4ecbfe2e545853b17b37b57efb4933f14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

It includes the following security fix:

    * A malicious certificate can cause an infinite loop.
      Reported by and fix from Tavis Ormandy and David Benjamin, Google.

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.3.6-relnotes.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index d046e89518..e35e52bf4d 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  0a51393f0df1cf27e070054a2788a4d073339f363d79cd594076a1b4c48be9a5  libressl-3.3.5.tar.gz
+sha256  3f28849365e1190db2baf9014ff9686012c25b1ca6df8b3a085f789e24fe4b9a  libressl-3.3.6.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 268ded69af..b415708b46 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.3.5
+LIBRESSL_VERSION = 3.3.6
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
