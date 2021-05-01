From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 May 2021 14:57:33 +0200
Subject: [Buildroot] [git commit] package/bind: security bump to version
 9.11.31
Message-ID: <20210501123032.771EA86900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=862609b389dbcae688fd23d31973653741dd48e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- A malformed incoming IXFR transfer could trigger an assertion failure in
  named, causing it to quit abnormally.  (CVE-2021-25214)

- named crashed when a DNAME record placed in the ANSWER section during
  DNAME chasing turned out to be the final answer to a client query.
  (CVE-2021-25215)

- When a server's configuration set the tkey-gssapi-keytab or
  tkey-gssapi-credential option, a specially crafted GSS-TSIG query could
  cause a buffer overflow in the ISC implementation of SPNEGO (a protocol
  enabling negotiation of the security mechanism used for GSSAPI
  authentication).  This flaw could be exploited to crash named binaries
  compiled for 64-bit platforms, and could enable remote code execution when
  named was compiled for 32-bit platforms.  (CVE-2021-25216)

For more details, see the release notes:
https://downloads.isc.org/isc/bind9/9.11.31/RELEASE-NOTES-bind-9.11.31.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 369d2f5fb5..9311d82d6d 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.28/bind-9.11.28.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.11.31/bind-9.11.31.tar.gz.asc
 # with key 2455774D42FDFE6B9C383EB8FE1002BC5970811F
-sha256  1090cbe6caba37c404d1075887da7e5282ae9a2bc6172d722df15cd480975e74  bind-9.11.28.tar.gz
+sha256  f5f24457f42b2e86870d887596e47500e4d40521a098dcb96f3a06f18adfa36a  bind-9.11.31.tar.gz
 sha256  cad49daa42654bc241762cd998630168a2542c8fd6fad3881e2eac1510bb6fcd  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 39c30dab6b..d01a557609 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.28
+BIND_VERSION = 9.11.31
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
