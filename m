From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 30 Jun 2017 10:36:58 +0200
Subject: [Buildroot] [RFC PATCH v5 01/11] package/patchelf: use most recent
	version as a base for rpath sanitation
In-Reply-To: <1498811828-6893-1-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
Message-ID: <1498811828-6893-2-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We would like to use "patchelf" to do rpath sanitation of all ELF files
in the "host", "staging" and "target" directory, mainly because a script
based solutions is too complex and slow.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/patchelf/patchelf.hash | 2 +-
 package/patchelf/patchelf.mk   | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
index 653eb46..95b067b 100644
--- a/package/patchelf/patchelf.hash
+++ b/package/patchelf/patchelf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83	patchelf-0.9.tar.bz2
+sha256  c8f1e4d2d41d5b390931e9876ccab39050182dc0003e865d3edd06684dbf9d8d  patchelf-29c085fd9d3fc972f75b3961905d6b4ecce7eb2b.tar.gz
diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index 74e6ccc..9750351 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PATCHELF_VERSION = 0.9
-PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION)
-PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
-PATCHELF_LICENSE = GPL-3.0+
+PATCHELF_VERSION = 29c085fd9d3fc972f75b3961905d6b4ecce7eb2b
+PATCHELF_SITE = $(call github,NixOS,patchelf,$(PATCHELF_VERSION))
+PATCHELF_AUTORECONF = YES
+PATCHELF_LICENSE = GPLv3+
 PATCHELF_LICENSE_FILES = COPYING
 
 $(eval $(host-autotools-package))
-- 
2.7.4
