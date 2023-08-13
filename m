Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0071DC001DB
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 13:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 769EC408A9;
	Sun, 13 Aug 2023 13:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 769EC408A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mT5YCzck_4Vk; Sun, 13 Aug 2023 13:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C6D240890;
	Sun, 13 Aug 2023 13:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C6D240890
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBB5A1BF418
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 13:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE73260B2A
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 13:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE73260B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfiqMF8aZUwe for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 13:14:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 992F360808
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 13:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 992F360808
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8625C85B4F; Sun, 13 Aug 2023 13:14:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Aug 2023 15:13:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76af307f01dad46913caa87edb09fe3b65cbb607
X-Git-Newrev: f3fab0defe8fa9e1d99e4a89ddb29776e3bdd7fd
X-Patchwork-Hint: ignore
Message-Id: <20230813131440.8625C85B4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: add missing autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3fab0defe8fa9e1d99e4a89ddb29776e3bdd7fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 898bdbca1f11fe81e8be7924371326f85f466a27 we added a patch
for configure.ac and missed to run autoreconf.

Fixes:
 - http://autobuild.buildroot.net/results/06f/06f2e368982a620b3e810eccfdc307ae99271e22

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[yann.morin.1998@free.fr: name patch in comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/util-linux/util-linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index bdb4fd6b90..0b8e3979b7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -30,6 +30,10 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
+
+# 0001-libmount-ifdef-statx-call.patch
+UTIL_LINUX_AUTORECONF = YES
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
