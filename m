Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14103C0015E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C066D404F0;
	Sun, 16 Jul 2023 16:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C066D404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIOcZKWWUOnI; Sun, 16 Jul 2023 16:21:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B98E3403C6;
	Sun, 16 Jul 2023 16:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B98E3403C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 491671BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C09408E6
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C09408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVzHoyqhpvLl for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:21:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E92E540903
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E92E540903
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA22986EA0; Sun, 16 Jul 2023 16:21:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:20:28 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 095d4bbdafd35becbc143cc1caf18c88fabe8f73
X-Git-Newrev: da9f314f9de6165d574c383372c882fd1a4fe7ce
X-Patchwork-Hint: ignore
Message-Id: <20230716162141.CA22986EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/libmdbx: bump
 version to 0.12.7 "Artek"
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
Content-Type: multipart/mixed; boundary="===============0303314477285606474=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0303314477285606474==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=da9f314f9de6165d574c383372c882fd1a4fe7ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

This is bugfix release of stable libmdbx branch,
on the day of international children's camp «Artek».

It is reasonable to backport this patch to all applicable releases/branches of Buildroot.

The most significant fixes of v0.12.7:
 - added workaround for build issues with modern GCC using `-m32 -arch=i686 -Ofast`.
 - fixed the cause of the false-positive warning of modern GCC in the C++ API.
 - refined DB opening in "recovery" mode and switching to a given meta-page.

The complete ChangeLog: https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 86cca91c2498eeb2cd91480de328755f3c32404c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 7a5b19952e..0f5908cf38 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  9c3abaaf9079a9518bb7155734817a2e286fffea46f7cc0825dfbd1cf9174075  libmdbx-amalgamated-0.12.5.tar.xz
+sha256  e150541c2b07558b961e754e8e9171bf1aa974c8e936f62bd375606f7d550667  libmdbx-amalgamated-0.12.7.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 0c6c9bcb9f..84b58632b6 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.12.5
+LIBMDBX_VERSION = 0.12.7
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============0303314477285606474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0303314477285606474==--
