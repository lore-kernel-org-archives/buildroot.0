Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AE4CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 17:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8579783422;
	Sun,  5 Oct 2025 17:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNIGHeRBayxs; Sun,  5 Oct 2025 17:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD4E7834DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD4E7834DE;
	Sun,  5 Oct 2025 17:23:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A11FD909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8166B40E3D
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V6kDKzRlbx9 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 17:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF45240DD8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF45240DD8
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:23:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E8DB868FA; Sun,  5 Oct 2025 17:23:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 19:19:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7ba7ee832c06a56e4d00cd629c6f9be16cf615e
X-Git-Newrev: 4a85d73f706322b2aa0d712c864306e93ed3860e
X-Patchwork-Hint: ignore
Message-Id: <20251005172312.9E8DB868FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: bump to version 25.09.00
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a85d73f706322b2aa0d712c864306e93ed3860e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2025-September/014087.html

The archive of this new version now includes a "fwts-25.09.00/" top
directory. Therefore, this commit removes "FWTS_STRIP_COMPONENTS = 0".

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fwts/fwts.hash | 2 +-
 package/fwts/fwts.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 9a4422069c..3f04288fb8 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
-sha256  19450b19cfd71a43d3716e4108d06db8b52f10801fb24bfb76f30dc0023d5142  fwts-V25.07.00.tar.gz
+sha256  ecba21d367b1c7aea41b378ad8fd3d43706c0fa4033cc31b59f8152c9cc0d69e  fwts-V25.09.00.tar.gz
 
 # Hash for license file
 sha256  77a5f0ea48e53ee8d67aecc7759cf468bcd340c1caca711ed4307b477a93fb47  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index b3860c6fad..f8537fbcf5 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-FWTS_VERSION = 25.07.00
+FWTS_VERSION = 25.09.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
-FWTS_STRIP_COMPONENTS = 0
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
 FWTS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
