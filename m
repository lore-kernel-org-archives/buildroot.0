From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 22:25:41 +0200
Subject: [Buildroot] [git commit] package/opkg-utils: bump to version 0.4.5
Message-ID: <20210629195727.03F3A8E580@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9265f1e8ac21bf867edb22710e4602192e479c84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch URL to HTTPS address for git repository.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...efile-seperate-manpages-and-utils-install.patch | 50 ----------------------
 package/opkg-utils/opkg-utils.hash                 |  2 +-
 package/opkg-utils/opkg-utils.mk                   |  4 +-
 3 files changed, 3 insertions(+), 53 deletions(-)

diff --git a/package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch b/package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch
deleted file mode 100644
index 140187ca3a..0000000000
--- a/package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 74ccbee0f798822041dba5c6564df62a0c60d86b Mon Sep 17 00:00:00 2001
-From: Ryan Barnett <ryanbarnett3@gmail.com>
-Date: Mon, 22 Feb 2021 07:09:34 -0600
-Subject: Makefile: separate manpages and utils install
-
-The installation of opkg-build man page introduces a host dependency
-on perl for the pod2man package to generate the man page.
-
-To allow the opkg-utils scripts to be installed separately from the
-manpages, break apart the install step into two install steps:
-install-utils and install-docs
-
-Backported from: 74ccbee0f798822041dba5c6564df62a0c60d86b
-
-CC: Christian Hermann <mail@hermannch.dev>
-Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
-Signed-off-by: Alex Stewart <alex.stewart@ni.com>
-Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
----
- Makefile | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4049654..fe96d5a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -27,9 +27,11 @@ mandir ?= $(PREFIX)/man
- 
- all: $(UTILS) $(MANPAGES)
- 
--install: all
-+install-utils: $(UTILS)
- 	install -d $(DESTDIR)$(bindir)
- 	install -m 755 $(UTILS) $(DESTDIR)$(bindir)
-+
-+install-docs: $(MANPAGES)
- 	install -d $(DESTDIR)$(mandir)
- 	for m in $(MANPAGES); \
- 	do \
-@@ -37,4 +39,6 @@ install: all
- 		install -m 644 "$$m" $(DESTDIR)$(mandir)/man$${m##*.}; \
- 	done
- 
--.PHONY: install all
-+install: install-utils install-docs
-+
-+.PHONY: install install-utils install-docs all
--- 
-cgit v1.2.2-1-g5e49
-
diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 779852d9c0..29671f9609 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  552c074630b6d6b39a32a35243fb34d7c5888b8a4f18118abb4daf92d0e847f2  opkg-utils-0.4.3-br1.tar.gz
+sha256  e0fcaab51bff2149bd6560fb4238319d502dd99b581f66763d702e75c224736d  opkg-utils-0.4.5-br1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index cdffd6f1c4..369a4586e8 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPKG_UTILS_VERSION = 0.4.3
-OPKG_UTILS_SITE = http://git.yoctoproject.org/git/opkg-utils
+OPKG_UTILS_VERSION = 0.4.5
+OPKG_UTILS_SITE = https://git.yoctoproject.org/git/opkg-utils
 OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
 OPKG_UTILS_LICENSE_FILES = COPYING
