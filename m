Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC53FF8873
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 13:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67814427AC;
	Thu, 30 Apr 2026 13:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBjiKBkCe63z; Thu, 30 Apr 2026 13:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8530842858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777556191;
	bh=G231vYKVt6HtbyweB9bEoEt8HHWmXMNorIt8DSRYi8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sEa3cZvkAYnY6Emd7WpJwMM7ULzo66nyHpkRIm/KzgiXE/GZn3KhAl5xKCNj7nCrY
	 Ebd3gNpcUMrZZf74rag6N5kt/Yo1PvUWl5zgUnjv6Esn7a+orMmjPDVo9S7OZXsvzT
	 jOit/hc/XzZjIDtE0Sq7UfB+Cz/L/fTgNlWraYgGKBW0iVo8BLi7RXJx+eErKziain
	 EF4CMKhU4ffS9VHodHjyaTlUjQLuHRRn5f2VkTdfq9rpnDBw4hRUIayx0VOVVJus2N
	 /x8AHMk7JoLdWeYD9iNX/7gtTEF6t3II5U/3G/Llt8u3xYfI1aotaAmptLivYqZ3RK
	 PckyT0BD4v4Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8530842858;
	Thu, 30 Apr 2026 13:36:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A83EC192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97DCD60D68
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBzXpLmxEj9o for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 13:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7630460BCB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7630460BCB
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E46B83C8D; Thu, 30 Apr 2026 13:36:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:59:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf8c4f797278131df7332b7dbc2ed3a8728e81df
X-Git-Newrev: fe9974e3eb4aa8c29e1e9cdcfb468b901108e6dc
X-Patchwork-Hint: ignore
Message-Id: <20260430133626.3E46B83C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmod: bump to 34.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe9974e3eb4aa8c29e1e9cdcfb468b901108e6dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream changelog for 34:
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/NEWS?h=v34.2

34.2 contains a few bugfixes on top, see the Git log:
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/log/?h=v34.2

Remove 0001-fix-O_CLOEXEC.patch. This patch does not apply cleanly
with 34, and while it could be updated easily it is needed only for
kernel versions before 2.6.23, which was released in 2007. Older
versions should not be relevant anymore.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .checkpackageignore                   |  1 -
 package/kmod/0001-fix-O_CLOEXEC.patch | 48 -----------------------------------
 package/kmod/kmod.hash                |  2 +-
 package/kmod/kmod.mk                  |  2 +-
 4 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index db6e8b883a..b2d5320045 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -461,7 +461,6 @@ package/iucode-tool/S00iucode-tool lib_sysv.Variables
 package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
 package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
 package/keyutils/0002-cifs.patch lib_patch.Sob lib_patch.Upstream
-package/kmod/0001-fix-O_CLOEXEC.patch lib_patch.Upstream
 package/kodi/S50kodi Shellcheck lib_sysv.Variables
 package/lbase64/0001-retro-compatible-with-Lua-5.1.patch lib_patch.Upstream
 package/lcdproc/0001-LCDd.conf.patch lib_patch.Upstream
diff --git a/package/kmod/0001-fix-O_CLOEXEC.patch b/package/kmod/0001-fix-O_CLOEXEC.patch
deleted file mode 100644
index 145ac34207..0000000000
--- a/package/kmod/0001-fix-O_CLOEXEC.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b39a62f6682463bcd47480348fac3dcd209a19a5 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 22 Jan 2014 01:06:40 -0500
-Subject: [PATCH] Add dummy definition of O_CLOEXEC
-
-O_CLOEXEC is introduced from Linux 2.6.23, so old kernel doesn't have
-it, we need check before use.
-
-This patch is much more like a workaround, since it may need fcntl() use
-FD_CLOEXEC to replace.
-
-This problem was reported by "Ting Liu <b28495@freescale.com>"
-
-[Thomas De Schampheleire <thomas.de.schampheleire@gmail.com:
- - move dummy definition from libkmod-internal.h to missing.h
- - update commit title]
-
-[Vicente: Adapt this patch to version 19.]
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-Upstream-status: rejected, suggests to add in buildroot instead [1]
-
-[1] http://news.gmane.org/find-root.php?message_id=1412062906%2d27378%2d1%2dgit%2dsend%2demail%2dpatrickdepinguin%40gmail.com
-
----
- shared/missing.h |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/shared/missing.h b/shared/missing.h
-index 4c0d136..e123e98 100644
---- a/shared/missing.h
-+++ b/shared/missing.h
-@@ -19,6 +19,10 @@
- # define __NR_finit_module -1
- #endif
- 
-+#ifndef O_CLOEXEC
-+#define O_CLOEXEC 0
-+#endif
-+
- #ifndef HAVE_FINIT_MODULE
- #include <errno.h>
- 
--- 
-1.7.1
-
diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 46a2d538ad..032f96adfe 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  dc768b3155172091f56dc69430b5481f2d76ecd9ccb54ead8c2540dbcf5ea9bc  kmod-33.tar.xz
+sha256  5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e3892226b93ffcb9cb54  kmod-34.2.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index cbf89bca9d..db9b3cdf21 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 33
+KMOD_VERSION = 34.2
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
