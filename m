Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F8160F34;
	Sun, 12 Dec 2021 22:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whWfewiuNl6s; Sun, 12 Dec 2021 22:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34E6860F2E;
	Sun, 12 Dec 2021 22:24:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EAD11BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0060E60ECB
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-mkvqeb0rq0 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36A2860ED8
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8D2F7836B8; Sun, 12 Dec 2021 22:18:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:18:39 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2b92adc6d6a3358b4569f1ee198b19b15a6957bb
X-Git-Newrev: d68fbd731478aa9bb707435eaa50a840e8bb3b96
X-Patchwork-Hint: ignore
Message-Id: <20211212221808.8D2F7836B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/util-linux/util-linux-libs: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=d68fbd731478aa9bb707435eaa50a840e8bb3b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:kernel:util-linux is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akernel%3Autil-linux

Inherit the values from util-linux; they really are, and have to be,
the same.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: inherit values from util-linux]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bfe518b0688efa6655010cb9366de5aa8c22add0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 3a3a655e62..20566345c6 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -10,6 +10,8 @@ UTIL_LINUX_LIBS_VERSION = $(UTIL_LINUX_VERSION)
 UTIL_LINUX_LIBS_SOURCE = $(UTIL_LINUX_SOURCE)
 UTIL_LINUX_LIBS_SITE = $(UTIL_LINUX_SITE)
 UTIL_LINUX_LIBS_DL_SUBDIR = $(UTIL_LINUX_DL_SUBDIR)
+UTIL_LINUX_LIBS_CPE_ID_VENDOR = $(UTIL_LINUX_CPE_ID_VENDOR)
+UTIL_LINUX_LIBS_CPE_ID_PRODUCT = $(UTIL_LINUX_CPE_ID_PRODUCT)
 
 # README.licensing claims that some files are GPL-2.0 only, but this is not
 # true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
