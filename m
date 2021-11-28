Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAEDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 13:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E1C381763;
	Sun, 28 Nov 2021 13:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALogbHIr_ILa; Sun, 28 Nov 2021 13:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D89D88175C;
	Sun, 28 Nov 2021 13:39:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 321AA1BF2CF
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 210BA60733
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nC_9ZzSYGxao for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 13:39:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A79960726
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 13:39:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E120790352; Sun, 28 Nov 2021 13:34:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Nov 2021 14:38:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fd5d8df2a1c468d78ca517e0b304edeebe21ff3
X-Git-Newrev: 7603576826fe56b6c9cdb5d6cf6e64af8007825b
X-Patchwork-Hint: ignore
Message-Id: <20211128133428.E120790352@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: drop unrecognized option
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7603576826fe56b6c9cdb5d6cf6e64af8007825b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

install-tests option has been removed since version 2.1.3 and
http://git.infradead.org/mtd-utils.git/commitdiff/7170a28d46d5db1e7a9da24a5555a194a233ef0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/mtd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 6385b9ee0a..9f4cc27ef1 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -47,9 +47,9 @@ MTD_CONF_OPTS += --disable-ubihealthd
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
-MTD_CONF_OPTS += --enable-tests --enable-install-tests
+MTD_CONF_OPTS += --enable-tests
 else
-MTD_CONF_OPTS += --disable-tests --disable-install-tests
+MTD_CONF_OPTS += --disable-tests
 endif
 
 # If extended attributes are required, the acl package must
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
