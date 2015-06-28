From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:29:07 +0200
Subject: [Buildroot] [git commit] core/pkg-kconfig: extract package before
	using kconfig fragments
Message-ID: <20150628122933.0743E80841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3938f392e33221ae2bf3ca80571eac83298f6ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kconfig fragments may be present in the package, so we need to extract
and patch it before we can use the fragments.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 7a00fff..e65c6f9 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -37,9 +37,9 @@ $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
 
-# The config file could be in-tree, so before depending on it the package should
-# be extracted (and patched) first
-$$($(2)_KCONFIG_FILE): | $(1)-patch
+# The config file as well as the fragments could be in-tree, so before
+# depending on them the package should be extracted (and patched) first
+$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
