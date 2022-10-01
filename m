Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64DEC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FF0540BBC;
	Sat,  1 Oct 2022 16:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF0540BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgTCMkXM5BeW; Sat,  1 Oct 2022 16:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C59D40B64;
	Sat,  1 Oct 2022 16:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C59D40B64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02BB21BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFA3860AC9
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFA3860AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KpZOFijgf0F for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:50:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 051AD60A8C
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 051AD60A8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4E65866E7; Sat,  1 Oct 2022 16:50:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 18:50:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8898523d4a88ba06d89c146d5336a785086a75b0
X-Git-Newrev: 2e4c0e722f4d9494c2451458a42d4c4f8ef006ab
X-Patchwork-Hint: ignore
Message-Id: <20221001165048.E4E65866E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: security bump to version
 5.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e4c0e722f4d9494c2451458a42d4c4f8ef006ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
