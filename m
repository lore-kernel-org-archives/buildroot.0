Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 15:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7DF040583;
	Sun, 20 Mar 2022 15:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4W2VmiP_EKo; Sun, 20 Mar 2022 15:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A5744056A;
	Sun, 20 Mar 2022 15:39:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75DB31BF57C
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDF7F4018F
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rg_SZmXvIgmk for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 15:38:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54F0A40129
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 15:38:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B3A3E8452F; Sun, 20 Mar 2022 15:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 16:24:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e8c436902bfac25074677858853f23d40bca8c0
X-Git-Newrev: 3eea7df286004430844bc9bd1d9b6c449b877d96
X-Patchwork-Hint: ignore
Message-Id: <20220320152913.B3A3E8452F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.15.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=3eea7df286004430844bc9bd1d9b6c449b877d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.15.6.html

Added new answer to samba4-cache.txt needed due to upstream commit:
https://gitlab.com/samba-team/samba/-/commit/f7e31127e7f8beb12294c5187cca9e191589ddcc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4-cache.txt | 1 +
 package/samba4/samba4.hash      | 4 ++--
 package/samba4/samba4.mk        | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index ba849b7c6e..d95776a03e 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: 29
 Checking value of GNUTLS_MAC_AES_CMAC_128: 203
 Checking whether fcntl supports flags to send direct I/O availability signals: OK
 Checking for gnutls fips mode support: NO
+Checking for readlink breakage: NO
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 503ec2ce37..20e5f00b21 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.15.5.tar.asc
-sha256  69115e33831937ba5151be0247943147765aece658ba743f44741672ad68d17f  samba-4.15.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.15.6.tar.asc
+sha256  0575b999a9048445820428dc540ba8a9527ce596fa66af02ea2ba1ea9578bcb4  samba-4.15.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 0ad3c2f742..688aaac3eb 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.15.5
+SAMBA4_VERSION = 4.15.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
