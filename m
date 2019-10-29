From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Oct 2019 11:48:53 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/sudo: security
 bump to version 1.8.28
Message-ID: <20191029104704.876B88D3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b27a19768284f42ab56fe20c9e25378971f5c4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fixes CVE-2019-14287: a sudo user may be able to run a command as root
when the Runas specification explicitly disallows root access as long as
the ALL keyword is listed first.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4a96d627491dbf1ae622053068176ec27d3cdf60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 8a3511df82..1795952988 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256 7beb68b94471ef56d8a1036dbcdc09a7b58a949a68ffce48b83f837dd33e2ec0  sudo-1.8.27.tar.gz
+sha256 9129fa745a08caff0ce2042d2162b38eb9bf73bf43fcb248ac8b3a750c1f13a1  sudo-1.8.28.tar.gz
 # Locally calculated
 sha256 e0e7990185834e9f08f3e922905d7bfaf998d13be668c6026d2586b1718210ba  doc/LICENSE
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 48c8921043..cf8b63b1db 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.27
+SUDO_VERSION = 1.8.28
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
