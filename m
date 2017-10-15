From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Oct 2017 23:03:45 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libnss: security bump to
	version 3.33
Message-ID: <20171015205800.A723C7FA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd49d225a392077fcf9ea937b6e68d12c34f57d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-7805 - Martin Thomson discovered that nss, the Mozilla
Network Security Service library, is prone to a use-after-free vulnerability
in the TLS 1.2 implementation when handshake hashes are generated.  A remote
attacker can take advantage of this flaw to cause an application using the
nss library to crash, resulting in a denial of service, or potentially to
execute arbitrary code.

Also add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 746502418fbf603464efe0dfc77c6bc10b10603e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 6 ++++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index e4e2428..6c8ce83 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,2 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_31_RTM/src/SHA256SUMS
-sha256	e90561256a3271486162c1fbe8d614d118c333d36a4455be2af8688bd420a65d	nss-3.31.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_33_RTM/src/SHA256SUMS
+sha256	98f0dabd36408e83dd3a11727336cc3cdfee4cbdd9aede2b2831eb2389c284e4  nss-3.33.tar.gz
+# Locally calculated
+sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 994db00..53e2785 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.31
+LIBNSS_VERSION = 3.33
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
