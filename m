From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 08:42:35 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/samba4: security
 bump version to 4.11.15
Message-ID: <20201103075159.DFCA4832CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b955ce023cce40e8a3d96fa168216b80fb441237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes
o CVE-2020-14318: Missing handle permissions check in SMB1/2/3 ChangeNotify.
o CVE-2020-14323: Unprivileged user can crash winbind.
o CVE-2020-14383: An authenticated user can crash the DCE/RPC DNS with easily
                  crafted records.

Release notes:
https://www.samba.org/samba/history/samba-4.11.14.html (bugfix-only)
https://www.samba.org/samba/history/samba-4.11.15.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3adbb6d296e33bab7179abd78af7945c61a2ef56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 4d47871fc5..0ce22a8526 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.13.tar.asc
-sha256  e71ed29ae01c5ce7be8cee1f53e0530db86dd19b911accb08fae60224e686ba1  samba-4.11.13.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.15.tar.asc
+sha256  922d461bb2e6e490cf7708b297a9312ea6cda1edc7bdfea4ee665f45ff99038a  samba-4.11.15.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 48ac48c180..51ee2c9c39 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.13
+SAMBA4_VERSION = 4.11.15
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
