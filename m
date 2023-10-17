Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BE0CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 08:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1796F417BD;
	Tue, 17 Oct 2023 08:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1796F417BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lfw8bubdRTjr; Tue, 17 Oct 2023 08:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF2441746;
	Tue, 17 Oct 2023 08:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF2441746
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47A841BF2F3
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 08:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E24360E7B
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 08:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E24360E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yn93N5tYaq_R for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 08:42:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2172B60674
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 08:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2172B60674
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D50685C9B; Tue, 17 Oct 2023 08:42:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 10:35:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e39222b0cd334129b77f1f41f8923de4d573ad4
X-Git-Newrev: bbf9a9ba7a8514302e7dfe169befbefe14bc9788
X-Patchwork-Hint: ignore
Message-Id: <20231017084223.0D50685C9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: drop now removed
 network-manager patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbf9a9ba7a8514302e7dfe169befbefe14bc9788
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0455f957a363e9b (package/network-manager: bump to version 1.44.2)
dropped the two patches but forgot to update .checkpackageignore.

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d746cde45e..b1d0b93b32 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -945,8 +945,6 @@ package/netsurf/0002-do-not-cross-compile-nsgenbind.patch Upstream
 package/netsurf/0003-fix-compilation-without-curl.patch Upstream
 package/netsurf/0004-framebuffer-Fix-internal-font-generated-source-for-GCC-10.patch Upstream
 package/nettle/0001-disable-testsuite-examples.patch Upstream
-package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch Upstream
-package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch Upstream
 package/network-manager/S45network-manager ConsecutiveEmptyLines EmptyLastLine Shellcheck Variables
 package/nfs-utils/S60nfs ConsecutiveEmptyLines Shellcheck Variables
 package/nginx-modsecurity/0001-config-use-pkg-config.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
