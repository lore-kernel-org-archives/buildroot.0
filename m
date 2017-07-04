From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:09:50 +0200
Subject: [Buildroot] [git commit] toolchain: introduce
	BR2_TOOLCHAIN_HAS_FULL_GETTEXT
Message-ID: <20170704170700.E9B9B8015E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85cb34a880a0eca6c7c33e548057adfbb0c0a8a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new boolean is true if the toolchain provides a built-in
full-featured implementation of gettext (glibc), and false if only a
stub implementation is provided (uclibc, musl).

This will be used in follow-up commits to decide whether libintl needs
to be built by gettext or not.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in           | 1 +
 toolchain/toolchain-common.in | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6aaf68b..15ee335 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -11,6 +11,7 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	bool
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
+	select BR2_TOOLCHAIN_HAS_FULL_GETTEXT
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 74e0e06..59115f3 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -93,6 +93,12 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	bool
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
+# This boolean is true if the toolchain provides a built-in full
+# featured gettext implementation (glibc), and false if only a stub
+# gettext implementation is provided (uclibc, musl)
+config BR2_TOOLCHAIN_HAS_FULL_GETTEXT
+	bool
+
 config BR2_USE_MMU
 	bool "Enable MMU support" if BR2_ARCH_HAS_MMU_OPTIONAL
 	default y if BR2_ARCH_HAS_MMU_OPTIONAL || BR2_ARCH_HAS_MMU_MANDATORY
