From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2020 14:06:01 +0200
Subject: [Buildroot] [git commit] package/unbound: bump version to 1.10.1
 for security fixes
Message-ID: <20200522114951.9138684540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=796cc10fa0b7986cfe818df8743fe0ca1f87db98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerabilities:

CVE-2020-12662: Unbound can be tricked into amplifying an incoming query
  into a large number of queries directed to a target.

CVE-2020-12663: Malformed answers from upstream name servers can be used
  to make Unbound unresponsive.

Signed-off-by: Stefan Ott <stefan@ott.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.hash | 2 +-
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 11626d0b6f..52d78e1678 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 152f486578242fe5c36e89995d0440b78d64c05123990aae16246b7f776ce955  unbound-1.10.0.tar.gz
+sha256 b73677c21a71cf92f15cc8cfe76a3d875e40f65b6150081c39620b286582d536  unbound-1.10.1.tar.gz
 sha256 8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 59543438fd..0917db1def 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.10.0
+UNBOUND_VERSION = 1.10.1
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
