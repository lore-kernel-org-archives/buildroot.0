Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DC1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF6240533;
	Sun, 27 Feb 2022 19:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPEvsNiaivH1; Sun, 27 Feb 2022 19:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B81D140220;
	Sun, 27 Feb 2022 19:46:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63B261BF97C
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51D79818CA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGamhikV1zLx for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A37CB817E4
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3DABF83611; Sun, 27 Feb 2022 19:37:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:34:38 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 477fa607517c892e21e5d667457276a250d12819
X-Git-Newrev: b7179080ca9b0d9c7f8933050325bb4a5d13123b
X-Patchwork-Hint: ignore
Message-Id: <20220227193728.3DABF83611@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7179080ca9b0d9c7f8933050325bb4a5d13123b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
