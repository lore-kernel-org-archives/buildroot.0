Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43765C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADABC808A8;
	Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBEm29zVIMvJ; Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5041D80CDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5041D80CDA;
	Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE9EE1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC81F40A15
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjr2FO9XcQCL for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B92624042C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B92624042C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4B8683685; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 20:16:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c82cd866e22cac568a30293cf3a7e38065b558b4
X-Git-Newrev: d7a3d455fcb5cd45db189acef8791676c6bc4f04
X-Patchwork-Hint: ignore
Message-Id: <20240915213636.A4B8683685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lldpd: update to 1.0.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7a3d455fcb5cd45db189acef8791676c6bc4f04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GPG, hash key checked

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lldpd/lldpd.hash | 5 +++--
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index e798e2beb2..127480095e 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,5 +1,6 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.17.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.18.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-sha256  9343177f145d2bca66ef03d59528079d3f1663c624b1e2b9d08268efdc6127ce  lldpd-1.0.17.tar.gz
+# gpg --verify lldpd-1.0.18.tar.gz.gpg lldpd-1.0.18.tar.gz
+sha256  4b320675d608901a4a0d4feff8f96bb846d4913d914b0cf75b7d0ae80490f2f7  lldpd-1.0.18.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 34e1c8c249..1b2cef9865 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.17
+LLDPD_VERSION = 1.0.18
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
