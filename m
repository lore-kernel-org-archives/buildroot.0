From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:50:41 +0200
Subject: [Buildroot] [git commit] uclibc: add option to specify config
	fragments
Message-ID: <20150601220248.C7DE27FD8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e34e12c5c3e0b851ac672603307ac300067ccf54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |    6 ++++++
 package/uclibc/uclibc.mk |    1 +
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index b5525e5..dd23853 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -86,6 +86,12 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
+config BR2_UCLIBC_CONFIG_FRAGMENT_FILES
+	string "Additional uClibc configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the main uClibc configuration file.
+
 config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 	bool "Enable RPC support"
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ce9b2b4..b9dce7e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -42,6 +42,7 @@ UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
 endif
 
 UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
+UCLIBC_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_UCLIBC_CONFIG_FRAGMENT_FILES))
 
 UCLIBC_KCONFIG_OPTS = \
 	$(UCLIBC_MAKE_FLAGS) \
