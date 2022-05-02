Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96461C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FF91415E6;
	Mon,  2 May 2022 22:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSp2rn9Me3Z4; Mon,  2 May 2022 22:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BFB3415AA;
	Mon,  2 May 2022 22:01:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28C4E1BF2C0
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53C548145F
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Dkpht6OeEx7 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC6DA80B54
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A2C5384F0E; Mon,  2 May 2022 21:48:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:38:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f355fab421d728c262f93d4a44317cb5f850b725
X-Git-Newrev: 2fa7abca8d11b5d767ca0caee9aa6d09713d4cb6
X-Patchwork-Hint: ignore
Message-Id: <20220502214850.A2C5384F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: add comment why no
 dependencies are added for host-python-installer.
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fa7abca8d11b5d767ca0caee9aa6d09713d4cb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, only host-python-installer itself needs to be added now.
host-python-flit-core is a dependency of host-python-installer so
doesn't need to be added explicitly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b86e12423f..452fa0d3ea 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -233,8 +233,10 @@ ifeq ($$($(2)_SETUP_TYPE),flit)
 $(2)_DEPENDENCIES += host-python-flit-core
 endif
 else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
+# Don't add dependency on host-python-installer for
+# host-python-installer itself, and its dependencies.
 ifeq ($$(filter host-python-flit-core host-python-installer,$(1)),)
-$(2)_DEPENDENCIES += host-python-flit-core host-python-installer
+$(2)_DEPENDENCIES += host-python-installer
 endif
 endif # SETUP_TYPE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
