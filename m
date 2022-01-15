Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24F7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82A10409A8;
	Sat, 15 Jan 2022 09:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4uBoXVlS8CmT; Sat, 15 Jan 2022 09:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D82D2408F4;
	Sat, 15 Jan 2022 09:17:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F87A1BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E46860BFA
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PydQafLj5Ays for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:17:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD04B60AA9
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:17:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E9584825E7; Sat, 15 Jan 2022 09:11:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 10:17:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7cf67fc940264e2ad6e60eaa914a214df9b81d8
X-Git-Newrev: 93d23ef91fcfd8bf7f5a3ffc23d82bad8e868b34
X-Patchwork-Hint: ignore
Message-Id: <20220115091114.E9584825E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux/util-linux-libs: add a
 missing patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=93d23ef91fcfd8bf7f5a3ffc23d82bad8e868b34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit 2f5068640161f7b267099e28b69d4c2280b4ded3 added a patch for
util-linux, but forgot to create a symlink to util-linux-libs. This
results in inconsistent libblkid.so builds from util-linux and
util-linux-libs.

If you enable BR2_PER_PACKAGE_DIRECTORIES, you will find that different
libblkid.so is used in different
$(BASE_DIR)/per-package/$(PKG)_NAME/target.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
