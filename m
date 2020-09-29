From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 17:35:20 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/cifs-utils:
 security bump to version 6.11
Message-ID: <20200929152803.39A4981585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e76e4273a3ba4610a3db9d89a6a4959b5c484618
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix CVE-2020-14342: It was found that cifs-utils' mount.cifs was
invoking a shell when requesting the Samba password, which could be used
to inject arbitrary commands. An attacker able to invoke mount.cifs with
special permission, such as via sudo rules, could use this flaw to
escalate their privileges.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce0e86b293018279416213a56db56c6cfa548402)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index 5eaa84f370..ca97eb8e56 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  92fc29c8e9039637f3344267500f1fa381e2cccd7d10142f0c1676fa575904a7  cifs-utils-6.10.tar.bz2
+sha256  b859239a3f204f8220d3e54ed43bf8109e1ef202042dd87ba87492f8878728d9  cifs-utils-6.11.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index b59a54d987..b06ce7dddf 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.10
+CIFS_UTILS_VERSION = 6.11
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
