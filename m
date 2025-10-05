Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE30CCAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91D61411E2;
	Sun,  5 Oct 2025 13:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1bPajvM-KOf; Sun,  5 Oct 2025 13:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B327D40AAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B327D40AAE;
	Sun,  5 Oct 2025 13:45:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC945226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D96960DE9
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_G6YS6W6dOn for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F049F6078B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F049F6078B
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:45:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC4E4868B8; Sun,  5 Oct 2025 13:45:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 15:36:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b5bcfd626b3d861887518ab5fb99f96d62db7ac
X-Git-Newrev: d6c0f0015b4d469cb8e4e590e44e221d8660424c
X-Patchwork-Hint: ignore
Message-Id: <20251005134508.EC4E4868B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux,
 linux-headers}: fix license hash for kernel 6.17
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6c0f0015b4d469cb8e4e590e44e221d8660424c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 76d25d365bc12c34d01703f1f9a45a0e02454466 added support
for kernel 6.17 but forgot to update a license hash needed due to
upstream commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/LICENSES/preferred/GPL-2.0?h=v6.17&id=660470dc58624242e39b7fdc6290c81a4f810b1e

Fixes:
https://autobuild.buildroot.org/results/fbf/fbf40bda2e31ed9b9eb94dbc398123695366b776/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b975932778..f233337062 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -14,5 +14,5 @@ sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
 sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
