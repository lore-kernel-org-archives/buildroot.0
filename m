Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF16DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AA4C408CD;
	Sat, 15 Jan 2022 11:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Is7D9OwBIhkt; Sat, 15 Jan 2022 11:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94324408CC;
	Sat, 15 Jan 2022 11:21:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DF041BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 532AA408D4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ai-h1okxS2KD for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:20:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 723EB408CC
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:20:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 83C028077E; Sat, 15 Jan 2022 11:13:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:04:19 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e0743af30a8cc51cf669638e93df26fe9cf3768d
X-Git-Newrev: 5c2e8a461771a3dd4e25614b70a88d1fa399a9c7
X-Patchwork-Hint: ignore
Message-Id: <20220115111353.83C028077E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/pipewire: bump to
 version 0.3.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c2e8a461771a3dd4e25614b70a88d1fa399a9c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

- Drop patches (already in version)
- This bump will fix build failures on ARM
- This bump will fix build failures with old glibc thanks to
  https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/e1671236671afbf7719b3ef29039ec4ac5102347

https://gitlab.freedesktop.org/pipewire/pipewire/-/tags/0.3.40

Fixes:
 - http://autobuild.buildroot.org/results/faec4ea02f4a6ddf44d54d5784d9de866c2d8a1f
 - http://autobuild.buildroot.org/results/31014558b6ad72e0f602095c423d48219dd6ebfa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 88281a5c4efbc637f0a6d1ac6e92f68ba2050c1a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cpu-fix-compilation-on-some-architectures.patch | 28 --------------------
 ...02-cpu-disable-VFP-asm-when-not-available.patch | 30 ----------------------
 package/pipewire/pipewire.hash                     |  2 +-
 package/pipewire/pipewire.mk                       |  2 +-
 4 files changed, 2 insertions(+), 60 deletions(-)

diff --git a/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch b/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
deleted file mode 100644
index 4465523610..0000000000
--- a/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 651f0decea5f83730c271e9bed03cdd0048fcd49 Mon Sep 17 00:00:00 2001
-From: Wim Taymans <wtaymans@redhat.com>
-Date: Thu, 21 Oct 2021 11:09:48 +0200
-Subject: [PATCH] cpu: fix compilation on some architectures
-
-[Retrieved from:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/651f0decea5f83730c271e9bed03cdd0048fcd49]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- spa/plugins/support/cpu.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/spa/plugins/support/cpu.c b/spa/plugins/support/cpu.c
-index ee1816512..01cff4854 100644
---- a/spa/plugins/support/cpu.c
-+++ b/spa/plugins/support/cpu.c
-@@ -270,7 +270,7 @@ impl_init(const struct spa_handle_factory *factory,
- 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_VM_TYPE)) != NULL)
- 			this->vm_type = atoi(str);
- 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_ZERO_DENORMALS)) != NULL)
--			impl_cpu_zero_denormals(this, spa_atob(str));
-+			spa_cpu_zero_denormals(&this->cpu, spa_atob(str));
- 	}
- 
- 	spa_log_debug(this->log, "%p: count:%d align:%d flags:%08x",
--- 
-GitLab
-
diff --git a/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch b/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
deleted file mode 100644
index 297016edc2..0000000000
--- a/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2cddd4a775c145570f4a8a30d28b57f551d43206 Mon Sep 17 00:00:00 2001
-From: Wim Taymans <wtaymans@redhat.com>
-Date: Mon, 25 Oct 2021 16:32:16 +0200
-Subject: [PATCH] cpu: disable VFP asm when not available
-
-Fixes #1746
-
-[Retrieved from:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/2cddd4a775c145570f4a8a30d28b57f551d43206]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- spa/plugins/support/cpu-arm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
-index c07711f70..fe6222f7c 100644
---- a/spa/plugins/support/cpu-arm.c
-+++ b/spa/plugins/support/cpu-arm.c
-@@ -143,7 +143,7 @@ static int arm_zero_denormals(void *object, bool enable)
- 			"msr	fpcr, %0		\n"
- 			"isb				\n"
- 			: "=r"(cw)::"memory");
--#else
-+#elif (defined(__VFP_FP__) && !defined(__SOFTFP__))
- 	uint32_t cw;
- 	if (enable)
- 		__asm__ __volatile__(
--- 
-GitLab
-
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 7894939b0d..c41c0a3686 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  fafcde675b264485883df1f3bf7e08f36fd1d661ecc092dcec6fd35a059c2aff  pipewire-0.3.39.tar.bz2
+sha256  b6a2eab8bda2f3cb87c3a0a714839696831ad27b5786674c4bd6c3776b9ebc97  pipewire-0.3.40.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index cbf24dd0ec..efda3ad695 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.39
+PIPEWIRE_VERSION = 0.3.40
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
