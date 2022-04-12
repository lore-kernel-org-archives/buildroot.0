Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57109C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E27682D07;
	Tue, 12 Apr 2022 19:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mLSzYyVrgd1; Tue, 12 Apr 2022 19:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 245FB82C1E;
	Tue, 12 Apr 2022 19:49:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5070B1BF9C8
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34EE540B53
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANAolYGsq4Wg for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:49:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3335E40B47
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 19:49:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 69FDE83B8E; Tue, 12 Apr 2022 19:39:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 21:39:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c814fe9b2fe84d7e294d511c3d62319bcae3281
X-Git-Newrev: 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617
X-Patchwork-Hint: ignore
Message-Id: <20220412193953.69FDE83B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: bump to version
 4.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is quite a version jump, so there are a lot of individual changes,
see: https://github.com/warmcat/libwebsockets/blob/v4.3.1/changelog

LICENSE has also changed:

- More items with license "MIT" were added:
  - lib/misc/base64-decode.c
  - lib/plat/windows/windows-resolv.c
- One more item with a 2-Clause BSD license was added:
  - lib/misc/ieeehalfprecision.c
- Sublicense texts were copied into LICENSE

These should still be compatible with "MIT with exceptions" stated in
`libwebsockets.mk`.

Signed-off-by: Johannes Agricola <johannes.agricola@work-microwave.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libwebsockets/libwebsockets.hash | 4 ++--
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 1761a7658a..e39d6e1853 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6ece1f422c6d38aabedec2476f2ac12e9aede8691b08137068ad85545ce3ff78  libwebsockets-4.0.21.tar.gz
-sha256  5756db345eb9c21cb06dd7cb69c38ec234657a233f9a186b4f5fa453681bd394  LICENSE
+sha256  8fdb1454a1b34cd9a6351beaab237a485e6853806101de7e62bd2bc250bb50af  libwebsockets-4.3.1.tar.gz
+sha256  2b5dd8030691f3d1870a040f085c37e45d9ab9c684a7f1284f5f379c1e829b28  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index c25686d385..152659cee6 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.0.21
+LIBWEBSOCKETS_VERSION = 4.3.1
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
