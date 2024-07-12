Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EACC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C01DF845D3;
	Fri, 12 Jul 2024 08:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEI7lx8wEPLH; Fri, 12 Jul 2024 08:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8940845D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8940845D4;
	Fri, 12 Jul 2024 08:41:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB8B11BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B731A845D4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQ1acNDxugHH for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BF9845D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0BF9845D3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:41:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B950285B42; Fri, 12 Jul 2024 08:41:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 10:31:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eb7d2b8600e08a553aab84b2767c67e72da7904
X-Git-Newrev: 77211ae347d4d9b8efe05822609a7caa0ee9d9b0
X-Patchwork-Hint: ignore
Message-Id: <20240712084123.B950285B42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: fix tests compiling when
 disabled
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=77211ae347d4d9b8efe05822609a7caa0ee9d9b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changed the '--enable-tests' switch to '--with-tests' in
release 2.2.0

See https://github.com/sigma-star/mtd-utils/commit/edc83b61745e6ee7fa9c9502eb520493832b1e9c

Fixes:
- http://autobuild.buildroot.net/results/52a289c7033005b7a29b0f2bc6aa5056cbdabb34/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mtd/mtd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index a20e00e9da..faf4c55eda 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -56,9 +56,9 @@ MTD_CONF_OPTS += --disable-ubihealthd
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
-MTD_CONF_OPTS += --enable-tests
+MTD_CONF_OPTS += --with-tests
 else
-MTD_CONF_OPTS += --disable-tests
+MTD_CONF_OPTS += --without-tests
 endif
 
 # If extended attributes are required, the acl package must
@@ -75,7 +75,7 @@ HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
 	--without-crypto \
-	--disable-tests
+	--without-tests
 
 MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
 SUMTOOL = $(HOST_DIR)/sbin/sumtool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
