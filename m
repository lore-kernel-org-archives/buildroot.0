From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 20:27:32 +0200
Subject: [Buildroot] [git commit] package/ola: bump to version 0.10.2
Message-ID: <20160922183034.67A1781EFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efb29dc3f38645eb105a3c00bc0856b20f5fdbc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove fetching upstream which was needed to fix musl build issue.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ola/ola.hash | 3 +--
 package/ola/ola.mk   | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ola/ola.hash b/package/ola/ola.hash
index 628b525..a791e9c 100644
--- a/package/ola/ola.hash
+++ b/package/ola/ola.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 74baba18c5b62aba15e27e6b7882c6eac22043c8e7b297e4d2f6eb05dd1a33b0 ola-0.10.0.tar.gz
-sha256 32a8a7a00c7db7647710c84ed02611f2eba99669f2de4da7aceae9d4444f53a3 34999c70dcbe2d38bf13d57c9cfbdc63f0899b9a.patch
+sha256  986e61874bc80db3b23cf201af2dafa39e3412cc50cddf1cd449c869110bfd27  ola-0.10.2.tar.gz
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index a983459..6f62a17 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OLA_VERSION = 0.10.0
-OLA_SITE = $(call github,OpenLightingProject,ola,$(OLA_VERSION))
-OLA_PATCH = https://github.com/OpenLightingProject/ola/commit/34999c70dcbe2d38bf13d57c9cfbdc63f0899b9a.patch
+OLA_VERSION = 0.10.2
+OLA_SOURCE = ola-$(OLA_VERSION).tar.gz
+OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VERSION)
 OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = LICENCE GPL LGPL
 OLA_INSTALL_STAGING = YES
