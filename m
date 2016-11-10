From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Nov 2016 06:53:58 +0200
Subject: [Buildroot] [PATCH next] patchelf: use .tar.bz2 archive
Message-ID: <c3cfe7393de76448abb44e6c61a5905bdd317176.1478753638.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Saves a little space and network bandwidth.

While at it, use PATCHELF_VERSION for PATCHELF_SITE.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/patchelf/patchelf.hash | 2 +-
 package/patchelf/patchelf.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
index 14154a31fc6b..653eb466bff4 100644
--- a/package/patchelf/patchelf.hash
+++ b/package/patchelf/patchelf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	f2aa40a6148cb3b0ca807a1bf836b081793e55ec9e5540a5356d800132be7e0a	patchelf-0.9.tar.gz
+sha256	a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83	patchelf-0.9.tar.bz2
diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index 5222e57950d5..cf2e43a730e1 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PATCHELF_VERSION = 0.9
-PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.9
+PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION)
+PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
 PATCHELF_LICENSE = GPLv3+
 PATCHELF_LICENSE_FILES = COPYING
 
-- 
2.10.2
