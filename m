From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 16:05:41 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/pps-tools: bump
 version to fix usage without bash
Message-ID: <20181216151027.71E538B448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=894a19dd7eb29e898310d238fec7ed63ed6ae4e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

As reported in bug #11426, the ppsfind shell script uses /bin/bash,
but the Buildroot pps-tools package doesn't depend on bash. In fact,
upstream has fixed the problem, and the script can now be used with a
POSIX shell, and the shebang is /bin/sh.

This commit therefore bumps pps-tools to the latest upstream commit,
which is precisely this fix.

Fixes bug #11426.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5c89726d9fe5072dc92bf2c407bd5aebff2703d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pps-tools/pps-tools.hash | 2 +-
 package/pps-tools/pps-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pps-tools/pps-tools.hash b/package/pps-tools/pps-tools.hash
index da7bce45bf..1e54c29463 100644
--- a/package/pps-tools/pps-tools.hash
+++ b/package/pps-tools/pps-tools.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 eee0a76118cf11d94f575ee43804a6991379f2c734b400ba01ac4811d0498e97  pps-tools-47333f24af878f67ce48022e8af16419713aa1ac.tar.gz
+sha256 1168f1474235017af413afdb07288303ad7a7b12a0282f3bf9ed0e22fe0d7d2e  pps-tools-e2b25049df9a4da28168b7378016f1650d0dfa6b.tar.gz
diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
index 37bb7e1f8c..2d82cf7dad 100644
--- a/package/pps-tools/pps-tools.mk
+++ b/package/pps-tools/pps-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PPS_TOOLS_VERSION = 47333f24af878f67ce48022e8af16419713aa1ac
+PPS_TOOLS_VERSION = e2b25049df9a4da28168b7378016f1650d0dfa6b
 PPS_TOOLS_SITE = $(call github,ago,pps-tools,$(PPS_TOOLS_VERSION))
 PPS_TOOLS_INSTALL_STAGING = YES
 PPS_TOOLS_LICENSE = GPL-2.0+
