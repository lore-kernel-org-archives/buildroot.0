From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 23:02:56 +0200
Subject: [Buildroot] [git commit] package/swupdate: add patch to fix link
	error for CONFIG_UBOOT and missing libz
Message-ID: <20151019210337.440197F99E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b14269ea4f34c741c29f1c58e825b5ef2a399e0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CONFIG_UBOOT needs libz [1]. So CONFIG_UBOUT mustn't be available when
HAVE_ZLIB=n.

Add patch from upstream to fix a link error for CONFIG_UBOOT and missing libz.
Note, that this link error does not affect the default config provided by
Buildroot.

[1] https://github.com/sbabic/swupdate/commit/cf495e23ad117f4cae9c429e80714fe9c18f2d6a

[Thomas: use a single <pkg>_PATCH variable.]

Reported-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/swupdate.hash |    1 +
 package/swupdate/swupdate.mk   |    4 +++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 057cf84..96ebedf 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
 sha256	ec633171e6a893506fad6b96fb2b258d60a023c03be5520b968a1d5cc6bafe6e  c3467290925b2a833a68d9db12c198fdca752e32.patch
+sha256	6cffe115cad73c0d1095f7880b6d2b97fc12b7f7871f532e5b33717e863f03d7  5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 8a20193..68f6e2c 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -8,7 +8,9 @@ SWUPDATE_VERSION = 2015.07
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
-SWUPDATE_PATCH = https://github.com/sbabic/swupdate/commit/c3467290925b2a833a68d9db12c198fdca752e32.patch
+SWUPDATE_PATCH = \
+	https://github.com/sbabic/swupdate/commit/c3467290925b2a833a68d9db12c198fdca752e32.patch \
+	https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
 
 # swupdate bundles its own version of mongoose (version 3.8) and
 # lsqlite3 (version 0.8)
