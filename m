Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF78CF31BA
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C047C81F8B;
	Wed,  2 Oct 2024 20:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KB3Lb_QgmN8z; Wed,  2 Oct 2024 20:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DA5A81F7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DA5A81F7E;
	Wed,  2 Oct 2024 20:53:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81DC11BF47D
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DEC5410F0
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0AwHzDmDYMF for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58352410E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58352410E0
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B0A481477; Wed,  2 Oct 2024 20:53:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:39:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b62dc002066c673da6f598842fa62294ecb2d0ae
X-Git-Newrev: 73b227cdd4c6eb0745c5671bac4b427f66a3c699
X-Patchwork-Hint: ignore
Message-Id: <20241002205324.4B0A481477@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: bump to version 24.09.00
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

commit: https://git.buildroot.net/buildroot/commit/?id=73b227cdd4c6eb0745c5671bac4b427f66a3c699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2024-September/013906.html

This commit also update the commented hash source URL from http to
https, since it is now redirected.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 61f615835e..6c9f9dc76b 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
-# Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  2bd45ab1b9f8dc1db2716721e89d982ee4b4eda4b1043cca7b13775c95d5023b  fwts-V24.07.00.tar.gz
+# Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
+sha256  4f352dedd630217a3551bb4f6e8d61f8514be457d37b90c936c3b6cfb6a6fa7e  fwts-V24.09.00.tar.gz
 
 # Hash for license file
 sha256  3cd2c5d12f024ff2aa203e37d7e972c4d5ab7bf1a65e3e09aebccf71e64b525b  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index fa1f8ed8c4..91b5e613dc 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 24.07.00
+FWTS_VERSION = 24.09.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
