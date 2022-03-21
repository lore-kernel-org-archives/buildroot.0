Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFB5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C3EB41507;
	Mon, 21 Mar 2022 21:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XePZefkHay-t; Mon, 21 Mar 2022 21:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3509414D1;
	Mon, 21 Mar 2022 21:14:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50E821BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DBA260F6C
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nklUDKKAmow for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:13:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D1F860FAE
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:13:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 268EA84D71; Mon, 21 Mar 2022 21:04:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:04:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d32a0992bd03b1f7a96be78c5942bda574c36dcb
X-Git-Newrev: ee860ce3dc3dada4ee4af41dd0d0eee7c0489a28
X-Patchwork-Hint: ignore
Message-Id: <20220321210440.268EA84D71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies: requires cmake >=
 3.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee860ce3dc3dada4ee4af41dd0d0eee7c0489a28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gerbera requires cmake 3.18 since version 1.10.0 and
https://github.com/gerbera/gerbera/commit/ac05976dda335ce1c28a5cc78e4e009a145e3559

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/dependencies/check-host-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index dfc252e919..5760e4ded1 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,9 +1,9 @@
-# Set this to either 3.16 or higher, depending on the highest minimum
+# Set this to either 3.18 or higher, depending on the highest minimum
 # version required by any of the packages bundled in Buildroot. If a
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.16
+BR2_CMAKE_VERSION_MIN = 3.18
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
