Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83ECC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB26408FA;
	Sat,  4 Dec 2021 21:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Mm6uJYntryi; Sat,  4 Dec 2021 21:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0E50408D9;
	Sat,  4 Dec 2021 21:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 996861BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9551F40630
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 556KU0Uo6Ltr for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:40:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9F2C405D6
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:40:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BEC529353B; Sat,  4 Dec 2021 21:35:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:39:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfe518b0688efa6655010cb9366de5aa8c22add0
X-Git-Newrev: ba9ca16b33e2e3a6893a95842711d34cfe47c52b
X-Patchwork-Hint: ignore
Message-Id: <20211204213555.BEC529353B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unrar: add UNRAR_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba9ca16b33e2e3a6893a95842711d34cfe47c52b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:rarlab:unrar is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ararlab%3Aunrar

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/unrar/unrar.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index ab8d9228c8..3c8e37a220 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -9,6 +9,7 @@ UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
 UNRAR_LICENSE_FILES = license.txt
+UNRAR_CPE_ID_VENDOR = rarlab
 
 define UNRAR_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
