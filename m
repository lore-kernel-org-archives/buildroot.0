From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:17:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/samba4: security
	bump to version 4.5.12
Message-ID: <20170720055509.367157F8CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad3d9f8bd6e85f2ddbb03757dddc5b6ac0c6150b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-11103:

All versions of Samba from 4.0.0 onwards using embedded Heimdal
Kerberos are vulnerable to a man-in-the-middle attack impersonating
a trusted server, who may gain elevated access to the domain by
returning malicious replication or authorization data.

Samba binaries built against MIT Kerberos are not vulnerable.

https://www.samba.org/samba/history/samba-4.5.12.html

[Peter: add CVE info]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit f97510659f914ee51c0f32e82664179a69ab17ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index a16d834..0783b37 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 7cb753f5f6d5527ef40d4c1f47dacafb7c876cb304b4906ccb390c6a18477714  samba-4.5.10.tar.gz
+sha256 f4c17123e3cc852a5ecc7e38884b00deab57632b9519aebc243e2a94b9b5ace4  samba-4.5.12.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 0ad4b64..3ffe11e 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.10
+SAMBA4_VERSION = 4.5.12
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
