Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3058CECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C510940153;
	Sat, 17 Sep 2022 15:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C510940153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIOPkJRnXPN0; Sat, 17 Sep 2022 15:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8F3240BB7;
	Sat, 17 Sep 2022 15:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8F3240BB7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4B51BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4F3A61150
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F3A61150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id do3g9h9iT_yO for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7923761153
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7923761153
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7629284559; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:34:28 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6b4df81b9fb91c42d1974d416ac0158ade925aca
X-Git-Newrev: b90558314aae7109e228143f0e06aed88aca7730
X-Patchwork-Hint: ignore
Message-Id: <20220917154057.7629284559@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libtirpc:
 security bump to version 1.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b90558314aae7109e228143f0e06aed88aca7730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix CVE-2021-46828: In libtirpc before 1.3.3rc1, remote attackers could
exhaust the file descriptors of a process that uses libtirpc because
idle TCP connections are mishandled. This can, in turn, lead to an
svc_run infinite loop without accepting new connections.

https://sourceforge.net/projects/libtirpc/files/libtirpc/1.3.3/Release-1.3.3.txt/download

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 408888a29b97cd6f89b528966d853f486149f6d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 56c1d9de3f..1efc3e47e2 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  51d75be0e5acc094a888f40042b23e128d163cb5  libtirpc-1.3.2.tar.bz2
+sha1  6e52c39148494e4836e2d5d4f28b11ddfa65394b  libtirpc-1.3.3.tar.bz2
 # Locally computed
-sha256  e24eb88b8ce7db3b7ca6eb80115dd1284abc5ec32a8deccfed2224fc2532b9fd  libtirpc-1.3.2.tar.bz2
+sha256  6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98d63ea2e60e12f3  libtirpc-1.3.3.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 9d3c4b5a94..179adc97d0 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.2
+LIBTIRPC_VERSION = 1.3.3
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
