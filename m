From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 22:11:42 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/exim: security
 bump to version 4.92.2
Message-ID: <20190917200714.456188E94F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e7753dbb74ce588b9f972c73fc22666403a6e2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes CVE-2019-15846: Local or remote attacker can execute programs with
root privileges

For details, see the advisory:
https://exim.org/static/doc/security/CVE-2019-15846.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f2c8428bdeba5d395552ec8ba4daaf3a76855ef0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.hash | 2 +-
 package/exim/exim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index a75156a312..0d11683c00 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 2c64a871dd7ac464c14df8eb0dcf5cf766b46fff5af0316aaa4bf0268dde24b4  exim-4.92.1.tar.xz
+sha256 01d7ae481d03ff408f8e54fd9b250324ea5ddabc83b1db32917c7f27a096a654  exim-4.92.2.tar.xz
 sha256 49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 577f22b366..b6a8566ce7 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.92.1
+EXIM_VERSION = 4.92.2
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
