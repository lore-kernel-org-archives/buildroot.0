Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687D8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BAEB4063F;
	Sun, 12 Dec 2021 17:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Le-iYUpusIvz; Sun, 12 Dec 2021 17:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFF9740947;
	Sun, 12 Dec 2021 17:38:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8DA1BF97A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E0A560EB4
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnKXOB2Jfn18 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B01360EAF
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5C0AD83657; Sun, 12 Dec 2021 17:30:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:31:20 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: bf3f02468a898896bb51f8bc27592649def9084b
X-Git-Newrev: 9232f63cb44673efbddad0b7645d4db248f4a839
X-Patchwork-Hint: ignore
Message-Id: <20211212173024.5C0AD83657@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/motion: add
 MOTION_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=9232f63cb44673efbddad0b7645d4db248f4a839
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

cpe:2.3:a:motion_project:motion is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amotion_project%3Amotion

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d5d5d5593392e01e513c6c77ee2076790186b6d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/motion/motion.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 29b70fd85f..b30c8ed85a 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -8,6 +8,7 @@ MOTION_VERSION = 4.3.2
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = doc/COPYING
+MOTION_CPE_ID_VENDOR = motion_project
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
