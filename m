From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:51:05 +0200
Subject: [Buildroot] [git commit] package/gauche: bump version to 0.9.5
Message-ID: <20170604075142.EF9F38270B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=531da6d2bab16fafd0513305641bb2c958d49a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/shirok/Gauche/commit/13a196557848f22a1607a300643131345e9f32b3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gauche/gauche.hash | 6 ++++--
 package/gauche/gauche.mk   | 3 +--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
index 975e958..8f45ef9 100644
--- a/package/gauche/gauche.hash
+++ b/package/gauche/gauche.hash
@@ -1,3 +1,5 @@
+# From https://sourceforge.net/projects/gauche/files/Gauche/
+sha1 c3e1ea21f3acc66fd26eced117caab3f86531db4  Gauche-0.9.5.tgz
+md5 8bac7cbd99a91f6f2c037ac6988db14d  Gauche-0.9.5.tgz
 # Locally calculated
-sha256 7b18bcd70beaced1e004594be46c8cff95795318f6f5830dd2a8a700410fc149  Gauche-0.9.4.tgz
-sha256 0ff5986540d8ad89eee595de766810f09e489a6a3363b47a65ce7ad18701ee01  13a196557848f22a1607a300643131345e9f32b3.patch
+sha256 4c8a53213de112708bbda5fa9648c21497d43ebf809ed5b32b15f21266b4e73c  Gauche-0.9.5.tgz
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 5a4fe9a..1e1ee39 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-GAUCHE_VERSION = 0.9.4
+GAUCHE_VERSION = 0.9.5
 GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
 GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
 GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
-GAUCHE_PATCH = https://github.com/shirok/Gauche/commit/13a196557848f22a1607a300643131345e9f32b3.patch
 
 HOST_GAUCHE_CONF_OPTS = --without-zlib
 GAUCHE_CONF_OPTS = --without-libatomic-ops
