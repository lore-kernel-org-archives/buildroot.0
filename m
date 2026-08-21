Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBCCC5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D26811F2;
	Fri, 21 Aug 2026 15:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecrr3ZE2m924; Fri, 21 Aug 2026 15:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324865;
	bh=W424L9Gys5syeaJAjrTy9c0VI051YUsj2mJCqcAcMR0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j8ctfz5d7eZYGj/j2EQByDnq70bBLTL9m+AU8SrNfCYmL8iWbYc8VLVugt8BZicKq
	 c8Wn/++2i16NJ1aCGJOC6+MyVagsKEHgoyE7irQpSS8ClOmBA0n4eCtsNebVNzzysH
	 vuK8fs7Yxns4st6tc3bDBdBLAk9J2qMZIqiIEJz1zdkNizU5OO6ckcn8tTWisZwRMq
	 NvbHHOmid+u7YCl7CgpcxsdcuMxUNKXHJTMjgvzIDBT1fguTPZIVANVxPfWVj07Ekh
	 eQKZaw/jTi0xe8aRR1zkcpnNhSoRmriSe9FnWWLa47rpeSrwKc3RkYktZQgsAjb8Pe
	 tyWFu893ZEfSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73CF5812A5;
	Fri, 21 Aug 2026 15:07:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49C55EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BEE4403D9
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQR4ir6Z-YKP for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3721402A8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 338368E0EC; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a7b1d667f492924ed7ab4026fd6c93c58d6d0598
X-Git-Newrev: 6e64a2ff7f3f4f1716ca7459888abb1dbd003cf7
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.338368E0EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dracut: switch to
 dracut-ng and bump to version 110
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3923388705735670376=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3923388705735670376==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e64a2ff7f3f4f1716ca7459888abb1dbd003cf7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Bump dracut package source to the newest version of the project,
dracut-ng, release 110.

The original dracut project is now inactive for a long period of time.
Dracut community has transitioned to the dracut-ng fork to continue
development. The migration ensures regular updates for security and bug
fixing, a better support of modern systemd features and kernel
requirements. It also allows alignment with major Linux distributions
(Fedora, Arch Linux, Gentoo), and other open source projects (Yocto).

Changes made :
- dracut.mk: change source to dracut-ng 110
- dracut.hash: adapt hash to dracut-ng 110
- dracut.mk: fix unused systemd symbolic links build error
- Config.in: adapt fs/cpio/Config.in to mention dracut-ng upgrade
- Config.in.host: adapt dracut Config.in.host to mention dracut-ng upgrade
- .checkpackageignore: remove 001-dracut.sh-don-t-unset-LD_PRELOAD.patch

Patch removals and additions :

- Removed 0001-dracut.sh-don-t-unset-LD_PRELOAD.patch:
Upstream dracut-ng removed the 'unset LD_PRELOAD' instruction, making this
patch obsolete.

- Added 0001-fix-functions-prevent-find_binary-from-dropping-last.patch:
Dracut-ng introduced a regression on non-merged-usr architectures.
This was traced down to a bug in find_binary() where a `while read`
loop drops the last PATH element if the string does not end with a colon.
This local patch fixes the Bash EOF read behavior.
Submitted upstream: https://github.com/dracut-ng/dracut-ng/pull/2416

All dracut related runtime tests, including non-merged-usr, have been
locally tested and passed successfully using the reference Buildroot
docker container.

Signed-off-by: Matéo Pourrier <mateo.pourrier@smile.fr>
[Julien: reword commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 90304b7129bdc74c37b932235348fba1f6bc7f3f)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                                |  1 -
 fs/cpio/Config.in                                  |  6 +--
 .../0001-dracut.sh-don-t-unset-LD_PRELOAD.patch    | 31 ---------------
 ...ns-prevent-find_binary-from-dropping-last.patch | 45 ++++++++++++++++++++++
 package/dracut/Config.in.host                      |  6 ++-
 package/dracut/dracut.hash                         |  2 +-
 package/dracut/dracut.mk                           |  5 ++-
 7 files changed, 56 insertions(+), 40 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7a3f709b32..b2642b6e23 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -341,7 +341,6 @@ package/dmraid/S20dmraid lib_sysv.Variables
 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch lib_patch.Upstream
 package/domoticz/S99domoticz Shellcheck
 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch lib_patch.Upstream
-package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch lib_patch.Upstream
 package/dracut/merged-usr-module-setup.sh Shellcheck
 package/dropbear/S50dropbear Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/dt/0001-adjust-os-symlink.patch lib_patch.Upstream
diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 4d38276c88..5c4e6b496d 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -20,9 +20,9 @@ config BR2_TARGET_ROOTFS_CPIO_DRACUT
 	bool "Invoke dracut to make a partial initramfs"
 	select BR2_PACKAGE_HOST_DRACUT
 	help
-	  Build an additional initramfs using dracut. This only contains
-	  a subset of the rootfs, as determined by the configuration
-	  file.
+	  Build an additional initramfs using dracut-ng. This only
+	  contains a subset of the rootfs, as determined by the
+	  configuration file.
 	  This can be useful to create a recovery system, for instance.
 
 endchoice
diff --git a/package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch b/package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch
deleted file mode 100644
index 394917eeb0..0000000000
--- a/package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From bb12f15856911d8532b569116da7dab4cbf107be Mon Sep 17 00:00:00 2001
-From: Thierry Bultel <thierry.bultel@linatsea.fr>
-Date: Mon, 10 Jan 2022 09:09:43 +0100
-Subject: [PATCH] dracut.sh: don't unset LD_PRELOAD
-
-LD_PRELOAD and LD_LIBRARY_PATH are needed to run under fakeroot.
-
-Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-[yann.morin.1998@free.fr: commit log also mentions LD_LIBRARY_PATH]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- dracut.sh | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/dracut.sh b/dracut.sh
-index 60ac46f4..37f25b38 100755
---- a/dracut.sh
-+++ b/dracut.sh
-@@ -868,8 +868,6 @@ export LC_ALL=C
- export LANG=C
- unset LC_MESSAGES
- unset LC_CTYPE
--unset LD_LIBRARY_PATH
--unset LD_PRELOAD
- unset GREP_OPTIONS
- 
- export DRACUT_LOG_LEVEL=warning
--- 
-2.37.1
-
diff --git a/package/dracut/0001-fix-functions-prevent-find_binary-from-dropping-last.patch b/package/dracut/0001-fix-functions-prevent-find_binary-from-dropping-last.patch
new file mode 100644
index 0000000000..ad312d0b85
--- /dev/null
+++ b/package/dracut/0001-fix-functions-prevent-find_binary-from-dropping-last.patch
@@ -0,0 +1,45 @@
+From 94c4274e32467235fb580a27ea182169f253ca5f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mat=C3=A9o=20Pourrier?= <mateo.pourrier@smile.fr>
+Date: Tue, 28 Apr 2026 17:23:23 +0200
+Subject: [PATCH] fix(functions): prevent find_binary from dropping last PATH
+ element
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When `read` encounters EOF before the delimiter, it returns a non-zero
+exit status, causing the while loop to terminate immediately. As a result,
+if the PATH string doesn't end with a colon, the very last directory in
+PATH is ignored by find_binary().
+
+This caused regressions on split-usr architectures where critical
+binaries reside exclusively in /bin, and /bin happens to be
+appended at the very end of the PATH by dracut.sh.
+
+Appending a virtual colon to the Here-String ensures the loop processes
+all directories correctly.
+
+Fixes dracut-ng issue #1467 : https://github.com/dracut-ng/dracut-ng/issues/1467
+
+Upstream: https://github.com/dracut-ng/dracut-ng/pull/2416
+Signed-off-by: Matéo Pourrier <mateo.pourrier@smile.fr>
+---
+ dracut-functions.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dracut-functions.sh b/dracut-functions.sh
+index f430a28e..5046f45e 100755
+--- a/dracut-functions.sh
++++ b/dracut-functions.sh
+@@ -94,7 +94,7 @@ find_binary() {
+             printf "%s\n" "${_path}"
+             return 0
+         fi
+-    done <<< "$PATH"
++    done <<< "${PATH}:"
+ 
+     [[ -n ${dracutsysrootdir-} ]] && return 1
+     type -P "${1##*/}"
+-- 
+2.34.1
+
diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
index 18f562b310..88dec969c3 100644
--- a/package/dracut/Config.in.host
+++ b/package/dracut/Config.in.host
@@ -2,8 +2,10 @@ config BR2_PACKAGE_HOST_DRACUT
 	bool
 	select BR2_PACKAGE_HOST_KMOD
 	help
-	  dracut is used to create an initramfs image by
+	  dracut-ng is used to create an initramfs image by
 	  copying tools and files from an installed system
 	  and combining it with the dracut framework.
+	  dracut-ng is a drop-in replacement for the legacy
+	  dracut project.
 
-	  https://dracut.wiki.kernel.org
+	  https://github.com/dracut-ng/dracut-ng/wiki
diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
index 6ca352c542..3288ed6ad4 100644
--- a/package/dracut/dracut.hash
+++ b/package/dracut/dracut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eabf0bb685420c1e1d5475b6855ef787104508f0135ff570312845256e0fcecf  dracut-059.tar.gz
+sha256  0d357853f8cf2371d89a8ebcbbb1fd2c1c85a79d8866925fd7385eaeb20a27dc  dracut-110.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index cb6044415e..b40f618fe8 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-DRACUT_VERSION = 059
-DRACUT_SITE = $(call github,dracutdevs,dracut,$(DRACUT_VERSION))
+DRACUT_VERSION = 110
+DRACUT_SITE = $(call github,dracut-ng,dracut-ng,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
 
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
+HOST_DRACUT_INSTALL_OPTS = systemdsystemunitdir="" install
 
 define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 	mv $(HOST_DIR)/bin/dracut $(HOST_DIR)/bin/dracut.real

--===============3923388705735670376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3923388705735670376==--
