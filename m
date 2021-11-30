Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C538C4332F
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0783761BAE;
	Tue, 30 Nov 2021 16:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blM7DohGt9F2; Tue, 30 Nov 2021 16:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CB33615FC;
	Tue, 30 Nov 2021 16:12:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0D681BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C14B6826DE
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhjN5ourjYgH for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3444E8266C
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C9D33920D8; Tue, 30 Nov 2021 16:07:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:09:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e1222fae295af63adbae03dde8e6fe3840c3ccc
X-Git-Newrev: 4f95d322591cfbeea7ac0a95292c4b5170747585
X-Patchwork-Hint: ignore
Message-Id: <20211130160702.C9D33920D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expect: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f95d322591cfbeea7ac0a95292c4b5170747585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
744e91878af86b3d0ee350fa7cffafad2914f3fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expect/expect.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/expect/expect.mk b/package/expect/expect.mk
index 37b4ce7065..44bf74af46 100644
--- a/package/expect/expect.mk
+++ b/package/expect/expect.mk
@@ -16,6 +16,6 @@ EXPECT_DEPENDENCIES = tcl
 EXPECT_CONF_OPTS = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
 
 # Since we don't want examples installed
-EXPECT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)  install-binaries
+EXPECT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-binaries
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
