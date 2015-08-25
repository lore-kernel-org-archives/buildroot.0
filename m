From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Aug 2015 22:41:08 +0200
Subject: [Buildroot] [git commit] openssh: security bump to version 7.1p1
Message-ID: <20150825205648.E86EE801F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0916daeff1056f930736bd4b644aff986b8eb88a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-6563 - Fixed a privilege separation weakness related to PAM
support.
CVE-2015-6564 - Fixed a use-after-free bug related to PAM support that
was reachable by attackers who could compromise the pre-authentication
process for remote code exectuion.
CVE-2015-6565 - incorrectly set TTYs to be world-writable.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash |    5 +++--
 package/openssh/openssh.mk   |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 76d0be8..84f0667 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,3 +1,4 @@
 # Locally calculated after checking pgp signature
-# Also from http://www.openssh.com/txt/release-6.9 (sha256 is base64 encoded)
-sha256	6e074df538f357d440be6cf93dc581a21f22d39e236f217fcd8eacbb6c896cfe	openssh-6.9p1.tar.gz
+# Also from http://www.openssh.com/txt/release-7.1 (sha256 is base64 encoded)
+# Decode with -> echo <encoded stuff>|base64 -d|hexdump -v -e '/1 "%02x"'
+sha256	fc0a6d2d1d063d5c66dffd952493d0cda256cad204f681de0f84ef85b2ad8428	openssh-7.1p1.tar.gz
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 5a7162f..b95914b 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 6.9p1
+OPENSSH_VERSION = 7.1p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
