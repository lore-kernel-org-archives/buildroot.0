From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 16 Mar 2017 15:23:19 +0100
Subject: [Buildroot] [RFC PATCH v2 1/9] package/patchelf: use most recent
	version as a base for rpath sanitation
In-Reply-To: <1489674207-6876-1-git-send-email-wg@grandegger.com>
References: <1489674207-6876-1-git-send-email-wg@grandegger.com>
Message-ID: <1489674207-6876-2-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We would like to use "patchelf" to do rpath sanitation of all ELF files
in the "host" and "target" directory, mainly because a script based
solutions is to complex and slow.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/patchelf/patchelf.hash | 2 +-
 package/patchelf/patchelf.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
index 653eb46..ba620d4 100644
--- a/package/patchelf/patchelf.hash
+++ b/package/patchelf/patchelf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83	patchelf-0.9.tar.bz2
+sha256  d90cbedb2efa516b2373640560aa6b37f0e29c4967611c3312981e30dbbab966  patchelf-c1f89c077e44a495c62ed0dcfaeca21510df93ef.tar.gz
diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index cf2e43a..c880222 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PATCHELF_VERSION = 0.9
-PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION)
-PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
+PATCHELF_VERSION = c1f89c077e44a495c62ed0dcfaeca21510df93ef
+PATCHELF_SITE = $(call github,NixOS,patchelf,$(PATCHELF_VERSION))
+PATCHELF_AUTORECONF = YES
 PATCHELF_LICENSE = GPLv3+
 PATCHELF_LICENSE_FILES = COPYING
 
-- 
1.9.1
