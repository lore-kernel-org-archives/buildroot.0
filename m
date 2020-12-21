From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 14:43:20 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/unbound: security
 bump to version 1.13.0
Message-ID: <20201221132718.1CC658831B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=067d922b69f409ba6f8de4a1f69136ee6fc78ab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

This version has fixes to connect for UDP sockets, slowing down
potential ICMP side channel leakage. The fix can be controlled with the
option udp-connect: yes, it is enabled by default.

Additionally CVE-2020-28935 is fixed, this solves a problem where the
pidfile is altered by a symlink, and fails if a symlink is encountered.
See https://nlnetlabs.nl/downloads/unbound/CVE-2020-28935.txt for more
information.

https://github.com/NLnetLabs/unbound/releases/tag/release-1.13.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4eb320112037445b8310f0fde1cde511ed05ecb3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.hash | 6 ++++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index c2c6ab7ff6..9ccea6eb88 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,3 +1,5 @@
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.0.tar.gz.sha256
+sha256  a954043a95b0326ca4037e50dace1f3a207a0a19e9a4a22f4c6718fc623db2a1  unbound-1.13.0.tar.gz
+
 # Locally calculated
-sha256 5b9253a97812f24419bf2e6b3ad28c69287261cf8c8fa79e3e9f6d3bf7ef5835  unbound-1.12.0.tar.gz
-sha256 8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
+sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index d60180b6ca..8b7d1e8e9f 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.12.0
+UNBOUND_VERSION = 1.13.0
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
