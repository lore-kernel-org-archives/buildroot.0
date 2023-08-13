Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB64EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA79340B5A;
	Mon, 21 Aug 2023 20:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA79340B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRRx7yHUqrw5; Mon, 21 Aug 2023 20:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAF5340B62;
	Mon, 21 Aug 2023 20:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAF5340B62
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06A001BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFDB5410A1
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFDB5410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U04tXDwwq277 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E308D41625
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E308D41625
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF9A486024; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Aug 2023 15:13:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 76af307f01dad46913caa87edb09fe3b65cbb607
X-Git-Newrev: f3fab0defe8fa9e1d99e4a89ddb29776e3bdd7fd
X-Patchwork-Hint: ignore
Message-Id: <20230821200126.CF9A486024@busybox.osuosl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f3fab0defe8fa9e1d99e4a89ddb29776e3bdd7fd
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
