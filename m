From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  1 May 2015 18:44:46 +0200
Subject: [Buildroot] [PATCH 3/3] package/wvstreams: add argp-standalone as
	optionnal dependency
In-Reply-To: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>
References: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1430498686-10719-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ensures the build reproducibility.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/wvstreams/wvstreams.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index bc7c5d4..3db317a 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -32,6 +32,11 @@ ifneq ($(BR2_STATIC_LIBS),y)
 WVSTREAMS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
 endif
 
+# wvstreams use argp.h which can be provided by argp-standalone package.
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+WVSTREAMS_DEPENDENCIES += argp-standalone
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 WVSTREAMS_DEPENDENCIES += dbus
 WVSTREAMS_CONF_OPTS += --with-dbus
-- 
1.9.3
