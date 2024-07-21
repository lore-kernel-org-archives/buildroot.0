Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7691C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CBE460605;
	Sun, 21 Jul 2024 16:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7JgwZeWCI-gc; Sun, 21 Jul 2024 16:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2C76068A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2C76068A;
	Sun, 21 Jul 2024 16:36:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AD021BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8A0240301
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfrfbhod7JI7 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C894440250
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C894440250
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:36:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5A8486F79; Sun, 21 Jul 2024 16:36:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:35:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec7ae882e048ce4ca5c2b72cb884b8d1ef33c6cc
X-Git-Newrev: 7ce07b7b29d08e09f52ca81c9d25728726c87d57
X-Patchwork-Hint: ignore
Message-Id: <20240721163611.B5A8486F79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: security bump to version
 1.20.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ce07b7b29d08e09f52ca81c9d25728726c87d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release has a fix for the DNSBomb issue CVE-2024-33655. This has a
low severity for Unbound, since it makes Unbound complicit in targeting
others, but does not affect Unbound so much.
This security release also fixes CVE-2024-1931.

https://nlnetlabs.nl/news/2024/May/08/unbound-1.20.0-released
https://nlnetlabs.nl/news/2024/Mar/14/unbound-1.19.3-released
https://nlnetlabs.nl/news/2024/Mar/07/unbound-1.19.2-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 843026abc7..96ee80b0ec 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.19.1.tar.gz.sha256
-sha256  bc1d576f3dd846a0739adc41ffaa702404c6767d2b6082deb9f2f97cbb24a3a9  unbound-1.19.1.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.20.0.tar.gz.sha256
+sha256  56b4ceed33639522000fd96775576ddf8782bb3617610715d7f1e777c5ec1dbf  unbound-1.20.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 5128d0e420..ff0262bef1 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.19.1
+UNBOUND_VERSION = 1.20.0
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
