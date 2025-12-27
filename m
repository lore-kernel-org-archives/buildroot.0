Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD75E92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 22:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7888C80F90;
	Sat, 27 Dec 2025 22:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHhRpUrAX9f9; Sat, 27 Dec 2025 22:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814AC80D92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766874165;
	bh=XgHQTmbS3kZth18/N3rGbxRW528SIKWDYuxGHKzwHQo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TX51QHhMl6OX0WCH4p2UP8oJleUhtsfJk5IeepxP7/wPrq+ynw/DLqvzJIzgkc1U0
	 1DsgJEysBCYV5Jwq89RORUcWSnf/uToSqLUlfIkK8Kgl7sewNx6u9mX13t1UmM50Gb
	 dxtIbNAz673wg1+5eG5RXjejyEmazgyoFq6mA3oxGkxJu0ClQXcmN9TbNfn4SZr9xT
	 zMCrKNQWwWSCnLWWoc5sZUc5UvuRKyfdvrELmlcU9knutLD+6fTuaQnMlCogUrt2tO
	 ximVRa3IVpThrlaVbaoylbFKjZfTJDF1YDEYo9ucDZoaTLJpXhM8CgBwdIPHsZg7E7
	 0xOe8qbliNnPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814AC80D92;
	Sat, 27 Dec 2025 22:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 181FDD8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E732F80D92
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUsUVzd-MH7G for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 22:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D948C80CF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D948C80CF0
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:22:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0B8887822; Sat, 27 Dec 2025 22:22:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 23:17:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d60dc5e6184dd2740fb33f6bc7aa8c6a76b35d7b
X-Git-Newrev: dab0feeae84ad8d1e4a52621b2606dab2ede0cad
X-Patchwork-Hint: ignore
Message-Id: <20251227222242.C0B8887822@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: needs NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dab0feeae84ad8d1e4a52621b2606dab2ede0cad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So far, skopeo inherited the thread dependency from its runtime
dependencies. However, skopeo uses pthread_getattr_np(3), which
is only available with NPTL on uClibc. glibc and musl have had
it for ages (and only implement NPTL anyway).

Fixes: https://autobuild.buildroot.org/results/b9d123986c2a65427bfca32ee3ea792a988e6890/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
index 0de9b16047..b0229873d4 100644
--- a/package/skopeo/Config.in
+++ b/package/skopeo/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SKOPEO
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU  # btrfs-progs, libgpgme, lvm2
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
-	depends on BR2_TOOLCHAIN_HAS_THREADS  # btrfs-progs, lvm2
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS  # lvm2
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_BTRFS_PROGS
@@ -17,10 +17,10 @@ config BR2_PACKAGE_SKOPEO
 
 	  https://github.com/containers/skopeo
 
-comment "skopeo needs a toolchain w/ threads, sahred libs"
+comment "skopeo needs a toolchain w/ NPTL, sahred libs"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
