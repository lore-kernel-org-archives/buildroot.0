From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Feb 2020 19:19:23 +0100
Subject: [Buildroot] [git commit] boot/barebox: license files hashes only
 valid for latest version
Message-ID: <20200206193221.B87B38D427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ffaaea70c43dde30039c6469233ba8ca7a5dbe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can only know the details of the license files for known versions.  For
custom, older or newer versions, the license files may change, or may be
moved around.

So, do for Barebox as was done for ATF, linux, and linux-headers, and
only define the list of license files for the latest version.

Add the hash for that license file, and align hashes to the new spacing
convention.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.hash | 7 +++++--
 boot/barebox/barebox.mk   | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 42561ea571..64fec919b8 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,8 @@
 # From https://www.barebox.org/download/barebox-2019.12.0.tar.bz2.md5
-md5 2d25158ccffaa843c9e4943bbe820ce2 barebox-2019.12.0.tar.bz2
+md5  2d25158ccffaa843c9e4943bbe820ce2  barebox-2019.12.0.tar.bz2
 
 # Locally calculated
-sha256 fb77afc5c1a9783b8e1a9bb6c617973f5c0ed4c6f8e079f96cb7e7e0818a7a90 barebox-2019.12.0.tar.bz2
+sha256  fb77afc5c1a9783b8e1a9bb6c617973f5c0ed4c6f8e079f96cb7e7e0818a7a90  barebox-2019.12.0.tar.bz2
+
+# License files, locally computed
+sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 52178d89c8..f11f9950d1 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -33,7 +33,9 @@ endif
 
 $(1)_DEPENDENCIES = host-lzop
 $(1)_LICENSE = GPL-2.0 with exceptions
+ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
 $(1)_LICENSE_FILES = COPYING
+endif
 
 $(1)_CUSTOM_EMBEDDED_ENV_PATH = $$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))
 
