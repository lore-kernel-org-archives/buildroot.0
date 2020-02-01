From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 00:07:26 +0100
Subject: [Buildroot] [git commit] package/sudo: bump version to 1.8.31
Message-ID: <20200201225749.693A2880FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eeb6535bc7ebbac45059f8aa600e0651d3fcd706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notice that 1.8.31 fixes a security issue with the non-default pwfeedback
option, but according to the advisory this is not exploitable in 1.8.28:

versions 1.8.26 through 1.8.30 it is not exploitable due to a change in EOF
handling introduced in sudo 1.8.26

https://www.sudo.ws/alerts/pwfeedback.html

Adjust license hash as the copyright year was changed:
-   Copyright (c) 1994-1996, 1998-2019
+   Copyright (c) 1994-1996, 1998-2020

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 1795952988..fff1aa2343 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256 9129fa745a08caff0ce2042d2162b38eb9bf73bf43fcb248ac8b3a750c1f13a1  sudo-1.8.28.tar.gz
+sha256 7ea8d97a3cee4c844e0887ea7a1bd80eb54cc98fd77966776cb1a80653ad454f  sudo-1.8.31.tar.gz
 # Locally calculated
-sha256 e0e7990185834e9f08f3e922905d7bfaf998d13be668c6026d2586b1718210ba  doc/LICENSE
+sha256 be099fd0ee954224f392dde163aef6d6359c58a5afa1ebb1bd55058318add789  doc/LICENSE
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index a7966047f8..a4def4368a 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.28
+SUDO_VERSION = 1.8.31
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
