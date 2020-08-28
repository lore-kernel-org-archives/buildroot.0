From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:03:24 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/bind: security
 bump to version 9.11.22
Message-ID: <20200828170234.F1E0A84F31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf7176c3ef914d342d9e9a738be3e1ca718c37b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

CVE-2020-8622: A truncated TSIG response can lead to an assertion failure
https://kb.isc.org/docs/cve-2020-8622

CVE-2020-8623: A flaw in native PKCS#11 code can lead to a remotely
triggerable assertion failure in pk11.c
https://kb.isc.org/docs/cve-2020-8623

CVE-2020-8624: update-policy rules of type "subdomain" are enforced incorrectly
https://kb.isc.org/docs/cve-2020-8624

For more details, see the release notes:
https://downloads.isc.org/isc/bind9/9.11.22/RELEASE-NOTES-bind-9.11.22.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4b126afd27cbcbc4e536a48fd22b676d22e2dc7a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 282b2aeba3..4ba0182b1c 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.20/bind-9.11.20.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.11.22/bind-9.11.22.tar.gz.asc
 # with key AE3FAC796711EC59FC007AA474BB6B9A4CBB3D38
-sha256  306831a738a275693bbe1d6839a09b34a2c8b5c26f8a42ea57ef000a6a99c2b6  bind-9.11.20.tar.gz
+sha256  afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9  bind-9.11.22.tar.gz
 sha256  da2aec2b7f6f0feb16bcb080e2c587375fd3195145f047e4d92d112f5b9db501  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 80f8defca8..18fc4845f9 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.20
+BIND_VERSION = 9.11.22
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
