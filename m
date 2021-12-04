Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFB6C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA0B183E58;
	Sat,  4 Dec 2021 21:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RHLeC3Rv0t8; Sat,  4 Dec 2021 21:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5153F83E0C;
	Sat,  4 Dec 2021 21:38:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD451BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9930060659
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2B_MbCbGm1u for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:38:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F129760622
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:38:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C87789352B; Sat,  4 Dec 2021 21:33:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:36:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 471ecea5eeb053d7bd956c8ff7605bd015b24b51
X-Git-Newrev: bfe518b0688efa6655010cb9366de5aa8c22add0
X-Patchwork-Hint: ignore
Message-Id: <20211204213308.C87789352B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux/util-linux-libs: add
 CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfe518b0688efa6655010cb9366de5aa8c22add0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:kernel:util-linux is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akernel%3Autil-linux

Inherit the values from util-linux; they really are, and have to be,
the same.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: inherit values from util-linux]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
