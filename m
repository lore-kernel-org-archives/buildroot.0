Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B480C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 14:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A2016104D;
	Thu, 21 Dec 2023 14:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A2016104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CP5YEcXs00dh; Thu, 21 Dec 2023 14:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E88160AC9;
	Thu, 21 Dec 2023 14:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E88160AC9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62BA91BF361
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 14:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BB55831E3
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 14:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB55831E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id REz-k7Z_qK5w for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 14:00:46 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9A4982446
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 14:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A4982446
Received: by mail.gandi.net (Postfix) with ESMTPSA id B943A60003;
 Thu, 21 Dec 2023 14:00:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rGJbP-00125Q-03;
 Thu, 21 Dec 2023 15:00:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 15:00:39 +0100
Message-Id: <20231221140039.246333-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/putty: security bump to version 0.80
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As described in the announcement, this fixes a security issue:

There is one security fix in this release:

 - Fix for a newly discovered security issue known as the 'Terrapin'
   attack, also numbered CVE-2023-48795. The issue affects widely-used
   OpenSSH extensions to the SSH protocol: the ChaCha20+Poly1305
   cipher system, and 'encrypt-then-MAC' mode.

   In order to benefit from the fix, you must be using a fixed version
   of PuTTY _and_ a server with the fix, so that they can agree to
   adopt a modified version of the protocol. Alternatively, you may be
   able to reconfigure PuTTY to avoid selecting any of the affected
   modes.

   If PuTTY 0.80 connects to an SSH server without the fix, it will
   warn you if the initial protocol negotiation chooses an insecure
   mode to run the connection in, so that you can abandon the
   connection. If it's possible to alter PuTTY's configuration to
   avoid the problem, then the warning message will tell you how to do
   it.

https://lists.tartarus.org/pipermail/putty-announce/2023/000037.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.hash | 8 ++++----
 package/putty/putty.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 0ae2a86be8..84569a31e5 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.79/{sha1,sha256,sha512}sums
-sha1  c40c3ce9fd334c40e64c6b33ee7e1096dad52701  putty-0.79.tar.gz
-sha256  428cc8666fbb938ebf4ac9276341980dcd70de395b33164496cf7995ef0ef0d8  putty-0.79.tar.gz
-sha512  4f10f870b229c89e928921d3b350955ce1c1170a062e7943d9cc8dbd83389d82a9b844623541605f0db5a429d545c2d188bf8e384c6515466fae69b216120983  putty-0.79.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.80/{sha1,sha256,sha512}sums
+sha1  9c4a96f63ee3e927472191c935cc89228693c03a  putty-0.80.tar.gz
+sha256  2013c83a721b1753529e9090f7c3830e8fe4c80a070ccce764539badb3f67081  putty-0.80.tar.gz
+sha512  c8a6b6fa54ecd8bcf4ec274fef51343dd9996e6458b250b5555c4dc88ded25e87f97277da482c29858510e65635112d541f559ab683635bd950572d850129f90  putty-0.80.tar.gz
 
 # Locally calculated
 sha256  7ede37f344ee03436c155a375ecb6cdb42a77105baa6e7804bf43260dc4a0c54  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 4c9164d05e..bff6e78074 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.79
+PUTTY_VERSION = 0.80
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
