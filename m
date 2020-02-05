From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Feb 2020 15:48:41 +0100
Subject: [Buildroot] [PATCH 4/6 v2] boot/barebox: license files hashes only
 valid for latest version
In-Reply-To: <cover.1580914115.git.yann.morin.1998@free.fr>
References: <cover.1580914115.git.yann.morin.1998@free.fr>
Message-ID: <74a46f7ad7c46107c84347edb01879239a7a824b.1580914115.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can only know the path to the license files for the known version.
For custom, older or newer, versions may change, or may be moved
around.

So, do for U-Boot as was done for ATF, linux, and linux-headers, and
only define the list of license files for the latest version.

Add the hash for that license file, and align hashes to the new spacing
convention.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
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
 
-- 
2.20.1
