From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:48:46 +0100
Subject: [Buildroot] [git commit] bind: security bump to version 9.9.8-P2
Message-ID: <20151217214852.A1C26825C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3e119e09307eff7ef702f7f860ecbc9b156715e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

Named is potentially vulnerable to the OpenSSL vulnerabilty described in
CVE-2015-3193.

CVE-2015-8461 - Incorrect reference counting could result in an INSIST
failure if a socket error occurred while performing a lookup.

CVE-2015-8000 - Insufficient testing when parsing a message allowed
records with an incorrect class to be be accepted, triggering a REQUIRE
failure when those records were subsequently cached.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 7f52c55..befc8d7 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.9.8/bind-9.9.8.tar.gz.sha256.asc
-sha256	643997cdb0dd232a4c9f7c0f1436841fbf325c6b7269e6490bf5f380eda344e3	bind-9.9.8.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.9.8-P2/bind-9.9.8-P2.tar.gz.sha256.asc
+sha256	f5841926e19637b93ec0b44b5abfbab2410e692736cf11143d461f656fbdf329	bind-9.9.8-P2.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e93b356..0e9a0f4 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.8
+BIND_VERSION = 9.9.8-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
