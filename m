From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 16:38:39 +0000
Subject: [Buildroot] [PATCH v2 2/4] elfutils: bump version to 0.160
In-Reply-To: <1415637521-57583-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415637521-57583-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1415637521-57583-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 0.160
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/elfutils/elfutils.hash |    3 +++
 package/elfutils/elfutils.mk   |    6 ++----
 2 files changed, 5 insertions(+), 4 deletions(-)
 create mode 100644 package/elfutils/elfutils.hash

diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
new file mode 100644
index 0000000..f0f4598
--- /dev/null
+++ b/package/elfutils/elfutils.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  741b556863c069ceab2d81eb54aeda8c34f46728859704eaf9baef8503e9a9d1  elfutils-0.160.tar.bz2
+sha256  feb307acf472598ea7af4e4b439251613a8f5d81e804b4abf9aeca195a5d4254  elfutils-portability.patch
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 4f00a27..4914b3b 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.155
+ELFUTILS_VERSION = 0.160
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
 ELFUTILS_LICENSE = GPLv3 GPLv2 LGPLv3
@@ -13,9 +13,7 @@ ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
 # The tarball does not have a generated configure script
 ELFUTILS_AUTORECONF = YES
 ELFUTILS_CONF_OPTS += --disable-werror
-ELFUTILS_PATCH = \
-	elfutils-portability.patch \
-	elfutils-robustify.patch
+ELFUTILS_PATCH = elfutils-portability.patch
 
 ELFUTILS_INSTALL_STAGING = YES
 
-- 
1.7.1
