From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 20:49:57 +0100
Subject: [Buildroot] [git commit] openssh: security bump to version 7.2p2
Message-ID: <20160310200229.2070E7FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55a94ec8936571df586d4f53ffc1355c651a63d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-3115 - sanitise X11 authentication credentials to avoid xauth
command injection when X11Forwarding is enabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 2 +-
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 36346e0..46d9f9b 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
 # Also from http://www.openssh.com/txt/release-7.2
-sha256	973cc37b2f3597e4cf599b09e604e79c0fe5d9b6f595a24e91ed0662860b4ac3	openssh-7.2p1.tar.gz
+sha256	a72781d1a043876a224ff1b0032daa4094d87565a68528759c1c2cab5482548c	openssh-7.2p2.tar.gz
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 0e0bcab..856646c 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 7.2p1
+OPENSSH_VERSION = 7.2p2
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
