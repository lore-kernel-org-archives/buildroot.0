Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7EDD5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D5360862;
	Sat, 13 Dec 2025 20:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGfMqdMVMdtN; Sat, 13 Dec 2025 20:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01EB56085A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765656225;
	bh=UkaeQueFtQoHkPKJHXug4fDs4o1CjxDP32ZL4/9uoE0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=anGmemlzEhKbka4Jfu8i+Z//XymrCeTBnM9eh4BF/MroyGCM9ZEmA1rNAnyIHY+ic
	 Wvwc55tpHmYP/sZlixy4fX1OHV7kOI09clJTD7cSMdus8XzVOehTFAjSm7Uvu/G1NI
	 XTMTw0qHoPwM7Tm/H5s3Yvk1ge6BrW3qi6iq1dBPRmHwhjWx0Atjedrs0s+mtOCAfp
	 eQy7FFQEnNsVpk1UM9Tqnuk6Pxmve7KERw2bF1RhpzBSDPMQpXnek+A9zM7HW51KJN
	 rpKijed9f6ygDO3Os4M+FyxXQJVlPuoAv9AQQF0VjS4nL1tJItAhFhng5aMmMn/tNU
	 Hop1EXjtu4SQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01EB56085A;
	Sat, 13 Dec 2025 20:03:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CCB613D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FB2C4095F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AN6j6bNf7Wzl for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C39F64075D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C39F64075D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:03:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95DBD86E09; Sat, 13 Dec 2025 20:03:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 20:59:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbbc6c9d9e7f19df04f23c26445132863a0e4070
X-Git-Newrev: 856d88d9a079a5d874e984fec65a6f7456143267
X-Patchwork-Hint: ignore
Message-Id: <20251213200342.95DBD86E09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmocka: bump to version 2.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=856d88d9a079a5d874e984fec65a6f7456143267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file has been renamed [1].

Release notes:
https://gitlab.com/cmocka/cmocka/-/releases/cmocka-2.0.0

[1] https://gitlab.com/cmocka/cmocka/-/commit/01cd73ee646870ba5c94a4b53a873229956a2d02

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add pgp signature comment in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmocka/cmocka.hash | 7 ++++---
 package/cmocka/cmocka.mk   | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index 8dc0532388..ff561f06b4 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,3 +1,4 @@
-# Locally computed:
-sha256  58435b558766d7f4c729ba163bdf3aec38bed3bc766dab684e3526ed0aa7c780  cmocka-1.1.8.tar.xz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
+# Locally computed, after checking pgp signature from:
+# https://cmocka.org/files/2.0/cmocka-2.0.0.tar.xz.asc
+sha256  b5686c51ea92d142958d68e5dcb932f9bfc32cd3dd01c524f9d4aa863ebc3d9c  cmocka-2.0.0.tar.xz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 04a0640f4c..0ee18e2931 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 1.1.8
+CMOCKA_VERSION = 2.0.0
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
-CMOCKA_SITE = https://cmocka.org/files/1.1
+CMOCKA_SITE = https://cmocka.org/files/2.0
 CMOCKA_LICENSE = Apache-2.0
-CMOCKA_LICENSE_FILES = COPYING
+CMOCKA_LICENSE_FILES = LICENSE
 CMOCKA_INSTALL_STAGING = YES
 CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
