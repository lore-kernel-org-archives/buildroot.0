Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D24EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95A8C40B5F;
	Mon, 21 Aug 2023 22:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95A8C40B5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTeadb6E4ZNF; Mon, 21 Aug 2023 22:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C687440B65;
	Mon, 21 Aug 2023 22:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C687440B65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40C7A1BF94D
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AF7F81B52
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF7F81B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTc3L_bbyLor for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:16:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F90D81B35
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F90D81B35
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E7C386099; Mon, 21 Aug 2023 22:16:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 00:14:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 64024ec57ea8249014e90aedb30533ddc6905e68
X-Git-Newrev: 510c91244b0e66d0b39eacaf1a1c8fbd741bcbb1
X-Patchwork-Hint: ignore
Message-Id: <20230821221620.2E7C386099@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nftables: bump to
 version 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=510c91244b0e66d0b39eacaf1a1c8fbd741bcbb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://netfilter.org/projects/nftables/files/changes-nftables-1.0.8.txt

This commit also adds comments in hash file:
- that pgp signature was verified with links
- that the license file hash was locally computed

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nftables/nftables.hash | 7 ++++++-
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 7e1e856229..c5ede1130a 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,8 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  c12ac941fff9adaedf17367d5ce213789b98a0d314277bc22b3d71e10891f412  nftables-1.0.7.tar.xz
+# Checked pgp signature:
+# https://netfilter.org/projects/nftables/files/nftables-1.0.8.tar.xz.sig
+# with key:
+# https://netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
+sha256  9373740de41a82dbc98818e0a46a073faeb8a8d0689fa4fa1a74399c32bf3d50  nftables-1.0.8.tar.xz
+# Locally computed:
 sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index d31df8afa4..20a7cd07ef 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.7
+NFTABLES_VERSION = 1.0.8
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
