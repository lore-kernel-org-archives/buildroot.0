From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 13:41:01 +0100
Subject: [Buildroot] [git commit] package/quota: fix NLS build
Message-ID: <20191226123229.BF99D8E5BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dc84d35b280193f3656bd1d39257bb1ed040567
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/9e40a5b97dcd52cdfbd11688426ecad70390d56b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quota/quota.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index aafce0d1e9..3921860264 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -11,6 +11,7 @@ QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
 # We're patching configure.ac
 QUOTA_AUTORECONF = YES
+QUOTA_GETTEXTIZE = YES
 QUOTA_LIBS = $(TARGET_NLS_LIBS)
 QUOTA_CONF_OPTS = --disable-pie
 
