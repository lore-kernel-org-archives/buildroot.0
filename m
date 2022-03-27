Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872C6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4304260E3B;
	Sun, 27 Mar 2022 16:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TRNM8t1acaW; Sun, 27 Mar 2022 16:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44CFC60864;
	Sun, 27 Mar 2022 16:33:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD9701BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8A254090F
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oa8ogM5PIkbF for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 141504092D
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A53D185E90; Sun, 27 Mar 2022 16:23:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 148e2115c0359ce0e39a75012f36ce985472e57f
X-Git-Newrev: f799da6f742ef284e6b342054a59cc81e5f07681
X-Patchwork-Hint: ignore
Message-Id: <20220327162300.A53D185E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: bump to version 8.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f799da6f742ef284e6b342054a59cc81e5f07681
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://frrouting.org/release/8.2.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-configure.ac-fix-enable_bmp-typo.patch    | 29 --------------------
 .../0002-lib-fix-elf_py-TLS-section-handling.patch | 31 ----------------------
 package/frr/frr.hash                               |  2 +-
 package/frr/frr.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 62 deletions(-)

diff --git a/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch b/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
deleted file mode 100644
index c8ce500dfc..0000000000
--- a/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From bacabf2476553d0e873b827359e1c8a4216c2f8c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 16 Dec 2021 20:10:26 +0100
-Subject: [PATCH] configure.ac: fix enable_bmp typo
-
-enable_bmp doesn't exist, use enable_bgp_bmp
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/FRRouting/frr/pull/10236]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1bcc42ef8..c7a5f1286 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1806,7 +1806,7 @@ if test "$enable_bgp_vnc" != "no";then
- fi
- 
- bgpd_bmp=false
--case "${enable_bmp}" in
-+case "${enable_bgp_bmp}" in
-   no)
-     ;;
-   yes)
--- 
-2.33.0
-
diff --git a/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch b/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
deleted file mode 100644
index d491cb1a7d..0000000000
--- a/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3942ee1f7bc754dd0dd9ae79f89d0f2635be334f Mon Sep 17 00:00:00 2001
-From: David Lamparter <equinox@opensourcerouting.org>
-Date: Wed, 10 Nov 2021 15:30:07 +0100
-Subject: [PATCH] lib: fix elf_py TLS section handling
-
-... need to ignore TLS sections, their address is effectively
-meaningless but can overlap other sections we actually need to access.
-
-Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
-
-[Retrieved from:
-https://github.com/FRRouting/frr/commit/3942ee1f7bc754dd0dd9ae79f89d0f2635be334f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/elf_py.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/elf_py.c b/lib/elf_py.c
-index 1c306893ad8..f230add6957 100644
---- a/lib/elf_py.c
-+++ b/lib/elf_py.c
-@@ -636,6 +636,9 @@ static Elf_Scn *elf_find_addr(struct elffile *ef, uint64_t addr, size_t *idx)
- 		Elf_Scn *scn = elf_getscn(ef->elf, i);
- 		GElf_Shdr _shdr, *shdr = gelf_getshdr(scn, &_shdr);
- 
-+		/* virtual address is kinda meaningless for TLS sections */
-+		if (shdr->sh_flags & SHF_TLS)
-+			continue;
- 		if (addr < shdr->sh_addr ||
- 		    addr >= shdr->sh_addr + shdr->sh_size)
- 			continue;
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index bb6c32b7bb..9bb2b75b8f 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9d82c11b304ab89a30627fcbb4150f51e639f473f8563976e14101e796240599  frr-8.1.tar.gz
+sha256  33e974e2a622618e139983f65d93e92e7f1a735936ef18b18244403b15be002f  frr-8.2.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 0e6ab7a815..aa36387a3a 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 8.1
+FRR_VERSION = 8.2.2
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
