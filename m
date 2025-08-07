Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8290CC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57E216063F;
	Thu,  7 Aug 2025 17:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCbc4u7XMoZS; Thu,  7 Aug 2025 17:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C9360666
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C9360666;
	Thu,  7 Aug 2025 17:20:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CC9031
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 431D340497
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbLPXFlG3NYP for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83C374049D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83C374049D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8205A86EE0; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:09:40 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 5d3485b24edd0852a704cba088b5e1ba02612629
X-Git-Newrev: 426f5b89f2c8ad4df1f85db2eea8096c4be72a8f
X-Patchwork-Hint: ignore
Message-Id: <20250807171916.8205A86EE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/berkeleydb: fix
 build with host gcc-15.x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=426f5b89f2c8ad4df1f85db2eea8096c4be72a8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Commit [1] fixed berkeleydb target build with gcc-15.x.
The host variant package also fails when building with host gcc-15.x.

This commit fixes the issue by replicating the same fix for the package
host variant.

Fixes:
https://autobuild.buildroot.org/results/a8051600ab95a63c852960f8dace757b16c665f0/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/c1d422edde19d07d6406705b1a4b059125dba689

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0ffc3aa43e923c968ee1bf6dcd910100adece343)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/berkeleydb/berkeleydb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index b2d4b689f3..6c487400ae 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -51,6 +51,7 @@ endef
 define HOST_BERKELEYDB_CONFIGURE_CMDS
 	(cd $(@D)/build_unix; rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS) -std=gnu99" \
 		../dist/configure $(QUIET) \
 		--prefix=$(HOST_DIR) \
 		--with-gnu-ld \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
