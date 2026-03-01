Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0597BFD0079
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 21:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CAE60AF2;
	Sun,  1 Mar 2026 21:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nv-CeYJsXLRw; Sun,  1 Mar 2026 21:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB905608EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772400296;
	bh=7ExHOTwiGypG3jqKTLu+SZd6Q6+LXnEZNnmQvjo0rZk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gDTP14O/sW8gsqNXCf4zKapQMrOhXhyEzr0SkFo+RnHOPRZtl0Id2i3UGLINheNj/
	 RvlEzqtROv4ctgt47i0qE1nL6wXLaNDXDJvB2LVBpoLIAsveC8VcID65ZwYOiE6gZY
	 DnSDSWc6BnZdGPssBziZIZaHr/yd+KMI0ktv5W6buuYNvjLDBOy/T8zYgBiLY5iZNZ
	 hQaIR3RCPdwulH7839D4L7BplPrhjg2qKQjcNeFVWyXQdVy0heDypkbsFPHA+IzOzh
	 2v08bxHuSnD03We//6s8kOnEDvcZWShySgr+S24EAKW3zuR1Ga86Bh6rhm5pilEQiy
	 zXZGC1si1Ij2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB905608EF;
	Sun,  1 Mar 2026 21:24:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7793124E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69492608EF
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQdbZUEmKqYa for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 21:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA58F608E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA58F608E8
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACF4085DC9; Sun,  1 Mar 2026 21:24:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 22:22:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7756b39d64f97b386dc993080e1ec4c90f18eddc
X-Git-Newrev: 88d1fde405054b2f39a5a12531a3a50b32c254db
X-Patchwork-Hint: ignore
Message-Id: <20260301212454.ACF4085DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: fix dependency of lxc
 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88d1fde405054b2f39a5a12531a3a50b32c254db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit ed12e2fbed3d4298ebff9da54fe56b91fa75c41e in 2021 added
BR2_PACKAGE_LIBVIRT_LXC which selects BR2_PACKAGE_LXC but did not add
the dependency !BR2_TOOLCHAIN_USES_UCLIBC which was added to lxc in
2019 by buildroot commit 63aad8a53e33e3fae4793e05662f47637e9e9bfc
causing Kconfig warnings:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LXC
  Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y]
    && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]
    && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y]
  Selected by [y]:
  - BR2_PACKAGE_LIBVIRT_LXC [=y] && BR2_PACKAGE_LIBVIRT [=y]
      && BR2_PACKAGE_LIBVIRT_DAEMON [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 5664f69dd8..0f73128d09 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -89,12 +89,14 @@ comment "qemu needs a toolchain with gcc >= 8"
 config BR2_PACKAGE_LIBVIRT_LXC
 	bool "lxc"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lxc
 	select BR2_PACKAGE_LXC
 	help
 	  Linux Container support
 
-comment "lxc needs a toolchain w/ gcc >= 4.7"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+comment "lxc needs a glibc or musl toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| BR2_TOOLCHAIN_USES_UCLIBC
 
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
