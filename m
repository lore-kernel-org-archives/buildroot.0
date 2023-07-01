Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3349EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E8B460AE8;
	Sat,  1 Jul 2023 20:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E8B460AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wSSk8QErU-8m; Sat,  1 Jul 2023 20:00:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A0B760BE3;
	Sat,  1 Jul 2023 20:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A0B760BE3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3B921BF2BA
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD6D6405CE
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD6D6405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L86t2WI9DI4p for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:00:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E621404AF
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E621404AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B3428626D; Sat,  1 Jul 2023 20:00:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 21:57:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f55efebdf53c14aa45f33c70fe60b1e0c52d43f
X-Git-Newrev: 86cca91c2498eeb2cd91480de328755f3c32404c
X-Patchwork-Hint: ignore
Message-Id: <20230701200028.6B3428626D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.12.7
 "Artek"
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
Content-Type: multipart/mixed; boundary="===============2445690801857291191=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2445690801857291191==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=86cca91c2498eeb2cd91480de328755f3c32404c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============2445690801857291191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2445690801857291191==--
