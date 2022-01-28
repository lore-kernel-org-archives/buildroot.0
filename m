Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8BDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 12:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7199184C71;
	Fri, 28 Jan 2022 12:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5cPCj6LY7XD5; Fri, 28 Jan 2022 12:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 915D684C9F;
	Fri, 28 Jan 2022 12:47:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AD001C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 495CA60B4C
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnbZ_hMFGQky for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 12:46:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A367600D1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:46:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9559A82A99; Fri, 28 Jan 2022 12:39:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 12:37:38 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 598b97465ae61a8f07adfcc81cbd503646175081
X-Git-Newrev: 7261f8e7a05729cb689be2539965833824d2db25
X-Patchwork-Hint: ignore
Message-Id: <20220128123934.9559A82A99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 package/util-linux/util-linux-libs: add a missing patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=7261f8e7a05729cb689be2539965833824d2db25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

The commit 2f5068640161f7b267099e28b69d4c2280b4ded3 added a patch for
util-linux, but forgot to create a symlink to util-linux-libs. This
results in inconsistent libblkid.so builds from util-linux and
util-linux-libs.

If you enable BR2_PER_PACKAGE_DIRECTORIES, you will find that different
libblkid.so is used in different
$(BASE_DIR)/per-package/$(PKG)_NAME/target.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 93d23ef91fcfd8bf7f5a3ffc23d82bad8e868b34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch b/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
new file mode 120000
index 0000000000..2f3c482144
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
@@ -0,0 +1 @@
+../0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
