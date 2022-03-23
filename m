Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9CEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA3F40FBB;
	Wed, 23 Mar 2022 20:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seP6O8XPQtWD; Wed, 23 Mar 2022 20:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B972040CB2;
	Wed, 23 Mar 2022 20:28:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9825B1BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 097C040CBE
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khjY4URt57tG for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:27:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34EF740FBB
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6B288854E8; Wed, 23 Mar 2022 20:18:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:23:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c494b5f22da88bae860221f23b494e221a47e44
X-Git-Newrev: c3c7e03e2ad9908e91246260b90c2dba175c7e3c
X-Patchwork-Hint: ignore
Message-Id: <20220323201808.6B288854E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: add comment to AUTORECONF
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3c7e03e2ad9908e91246260b90c2dba175c7e3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As explained in the previous commit, AUTORECONF is necessary to handle a
build failure. Add a comment to make sure it doesn't get removed again
in the future.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ola/ola.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 5090076175..557f454fe9 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -9,6 +9,7 @@ OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VE
 OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
 OLA_INSTALL_STAGING = YES
+# Bundled Makefile.in don't link correctly, regenerate with recent automake
 OLA_AUTORECONF = YES
 
 # util-linux provides uuid lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
