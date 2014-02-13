From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 23:16:25 +0100
Subject: [Buildroot] [git commit] nut: disable hal
Message-ID: <20140213221719.9021D9C9D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66c4d32f7c01115d4fd43aa6215663cc1cae3c99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add to existing _CONF_OPT line as suggested by Yann]
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nut/nut.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 04b2b41..04fb36d 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -17,7 +17,8 @@ NUT_AUTORECONF = YES
 # Put the PID files in a read-write place (/var/run is a tmpfs)
 # since the default location (/var/state/ups) maybe readonly.
 NUT_CONF_OPT = \
-	--with-altpidpath=/var/run/upsd
+	--with-altpidpath=/var/run/upsd \
+	--without-hal
 
 NUT_CONF_ENV = \
 	GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config \
