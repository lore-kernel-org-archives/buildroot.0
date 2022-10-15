Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558B4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 14:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB8F40865;
	Sat, 15 Oct 2022 14:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB8F40865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f82c7CwTLdjw; Sat, 15 Oct 2022 14:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3B24098C;
	Sat, 15 Oct 2022 14:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3B24098C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76CA91BF307
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50EB24098C
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50EB24098C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAv5-FmWxwp1 for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 14:29:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EBD840935
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EBD840935
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29F4C867FF; Sat, 15 Oct 2022 14:29:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:26:27 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: a9c214f41cc34276e1eac35153be539614d0b938
X-Git-Newrev: 4cd106188a876163d5c056ec3c6e9bae0df8e0bb
X-Patchwork-Hint: ignore
Message-Id: <20221015142902.29F4C867FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/wolfssl: security
 bump to version 5.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cd106188a876163d5c056ec3c6e9bae0df8e0bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Denial of service attack and buffer overflow against TLS 1.3
servers using session ticket resumption. When built with
--enable-session-ticket and making use of TLS 1.3 server code in
wolfSSL, there is the possibility of a malicious client to craft a
malformed second ClientHello packet that causes the server to crash.
This issue is limited to when using both --enable-session-ticket and TLS
1.3 on the server side. Users with TLS 1.3 servers, and having
--enable-session-ticket, should update to the latest version of wolfSSL.

https://github.com/wolfSSL/wolfssl/releases/tag/v5.5.1-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2e4c0e722f4d9494c2451458a42d4c4f8ef006ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index f1401e4cda..3849ffb9fc 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c34b74b5f689fac7becb05583b044e84d3b10d39f38709f0095dd5d423ded67f  wolfssl-5.5.0.tar.gz
+sha256  97339e6956c90e7c881ba5c748dd04f7c30e5dbe0c06da765418c51375a6dee3  wolfssl-5.5.1.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index ca360312c9..95d4f47952 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.5.0
+WOLFSSL_VERSION = 5.5.1
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
