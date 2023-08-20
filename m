Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407FFEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A1E40929;
	Sun, 20 Aug 2023 21:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A1E40929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVl_JnpXs9jd; Sun, 20 Aug 2023 21:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFE2540931;
	Sun, 20 Aug 2023 21:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFE2540931
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFEAC1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8544E60BF1
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8544E60BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5Qz394RTlTp for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:19:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B635E60BE9
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B635E60BE9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EFBD85E7F; Sun, 20 Aug 2023 21:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:18:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c243e1b81a1eb9d579e88e9beae3965425300523
X-Git-Newrev: 33f2d1498fb4d695465fe2ad0c829b7f3925298c
X-Patchwork-Hint: ignore
Message-Id: <20230820211934.9EFBD85E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/util-linux: add
 missing autoreconf
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33f2d1498fb4d695465fe2ad0c829b7f3925298c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
