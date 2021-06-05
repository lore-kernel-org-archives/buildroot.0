From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Jun 2021 10:28:18 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/efibootmgr: bump version to 17
Message-ID: <20210605082818.102556-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix build error:

efibootmgr.c:1541:15: error: conflicting types for ?efi_set_verbose?
 1541 |    extern int efi_set_verbose(int verbosity, FILE *errlog);

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../efibootmgr/0002-remove-extra-decl.patch   | 28 +++++++++++++++++++
 package/efibootmgr/efibootmgr.hash            |  4 +--
 package/efibootmgr/efibootmgr.mk              |  2 +-
 3 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 package/efibootmgr/0002-remove-extra-decl.patch

diff --git a/package/efibootmgr/0002-remove-extra-decl.patch b/package/efibootmgr/0002-remove-extra-decl.patch
new file mode 100644
index 0000000000..f838d50a20
--- /dev/null
+++ b/package/efibootmgr/0002-remove-extra-decl.patch
@@ -0,0 +1,28 @@
+From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 13 Jun 2018 09:41:01 -0400
+Subject: [PATCH] remove extra decl
+
+Downloaded from upstream commit
+https://github.com/rhboot/efibootmgr/commit/99b578501643377e0b1994b2a068b790d189d5ad
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/efibootmgr.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index de38f01..4e1a680 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
+ 					       "invalid numeric value %s\n",
+ 					       optarg);
+ 			}
+-                        /* XXX efivar-36 accidentally doesn't have a public
+-                         * header for this */
+-			extern int efi_set_verbose(int verbosity, FILE *errlog);
+ 			efi_set_verbose(opts.verbose - 2, stderr);
+ 			break;
+ 		case 'V':
diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
index b786a415a8..fdbc9a2732 100644
--- a/package/efibootmgr/efibootmgr.hash
+++ b/package/efibootmgr/efibootmgr.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 5a708b9690cdc631fd75d8f598128d20cad007e711b975b0143f9517c2dd1bf4  efibootmgr-15.tar.gz
-sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256  22a95ebe0d5c9fb2915b3a100450f8f37484d1dbb8b296f55b343cc84f10397d  efibootmgr-17.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index 079a9b7281..7e09b5f659 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIBOOTMGR_VERSION = 15
+EFIBOOTMGR_VERSION = 17
 EFIBOOTMGR_SITE = $(call github,rhboot,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING
-- 
2.29.2
