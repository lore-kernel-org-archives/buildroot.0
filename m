From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 23:03:02 +0200
Subject: [Buildroot] [git commit] package/wvstreams: add argp-standalone as
	optional dependency
Message-ID: <20150501210311.D33B7804CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec99380250be9d971a37507a15f9c0756df19218
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This ensures the build reproducibility.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wvstreams/wvstreams.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index bc7c5d4..4d344e2 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -32,6 +32,12 @@ ifneq ($(BR2_STATIC_LIBS),y)
 WVSTREAMS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
 endif
 
+# wvstreams uses argp.h which can be provided by the argp-standalone
+# package
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+WVSTREAMS_DEPENDENCIES += argp-standalone
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 WVSTREAMS_DEPENDENCIES += dbus
 WVSTREAMS_CONF_OPTS += --with-dbus
