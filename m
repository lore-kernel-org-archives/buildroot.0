Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C181C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F0A60F35;
	Mon, 25 Apr 2022 20:27:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcJa75sI4ZrK; Mon, 25 Apr 2022 20:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3818560596;
	Mon, 25 Apr 2022 20:27:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45D5D1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C2B60F8D
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJKI2lvzTLTE for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74D4B60F99
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3B2A18448B; Mon, 25 Apr 2022 20:15:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 22:19:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5430c8fedd0392e79e0c011825b056fea129980a
X-Git-Newrev: 8a24b80533c0e04857e728c630b5863447dcbce1
X-Patchwork-Hint: ignore
Message-Id: <20220425201532.3B2A18448B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aubio: add host-pkgconf dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a24b80533c0e04857e728c630b5863447dcbce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host-pkgconf dependency to fix the following build failure raised
since the addition of the package in commit
280bb6807619e2e858836435f44aad0cccd27a40 and
https://github.com/aubio/aubio/commit/e57859fd1f2c3c8b18b3f5ede122071c66166a8f:

Checking for program 'pkg-config'        : not found
Could not find the program ['pkg-config']

Fixes:
 - http://autobuild.buildroot.org/results/e6f0e9b09e4b611daf5bb37091610d8de80f1f4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/aubio/aubio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index b79beccd97..b2eb2b5e6d 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -11,6 +11,7 @@ AUBIO_LICENSE = GPL-3.0+
 AUBIO_LICENSE_FILES = COPYING
 AUBIO_INSTALL_STAGING = YES
 
+AUBIO_DEPENDENCIES = host-pkgconf
 AUBIO_CONF_OPTS = \
 	--disable-docs \
 	--disable-atlas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
