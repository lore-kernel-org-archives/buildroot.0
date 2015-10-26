From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 22:58:14 +0100
Subject: [Buildroot] [git commit] Revert "package/swupdate: add patch to fix
	build issue with some toolchains"
Message-ID: <20151026215921.8A0FE7F99E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f3c0bc55175123853719209e3863baee7e17773
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch caused an unfortunate regression that prevents any handlers
from being registered (runtime issue). This means swupdate cannot
perform any update. Upstream has reverted it.

See discussion:
https://groups.google.com/d/msg/swupdate/oVIhJmYPT8A/eq3uZvYVDQAJ

This reverts commit a8cc6eeec5a665db5689083312beef14a9afbafa.

Signed-off-by: Bj??rn Forsman <bjorn.forsman@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.hash |    1 -
 package/swupdate/swupdate.mk   |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 96ebedf..eb7722c 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,4 +1,3 @@
 # Locally calculated
 sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
-sha256	ec633171e6a893506fad6b96fb2b258d60a023c03be5520b968a1d5cc6bafe6e  c3467290925b2a833a68d9db12c198fdca752e32.patch
 sha256	6cffe115cad73c0d1095f7880b6d2b97fc12b7f7871f532e5b33717e863f03d7  5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 68f6e2c..bcdc764 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -9,7 +9,6 @@ SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
 SWUPDATE_PATCH = \
-	https://github.com/sbabic/swupdate/commit/c3467290925b2a833a68d9db12c198fdca752e32.patch \
 	https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
 
 # swupdate bundles its own version of mongoose (version 3.8) and
