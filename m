From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 11:48:28 +0100
Subject: [Buildroot] [git commit] socat: add optional openssl and readline
	support
Message-ID: <20140311104939.08C8F9BF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df2b2104f4ed219f28bcea12b24cb9507666ee0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socat/socat.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 6ae67a9..7172ea0 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -21,6 +21,18 @@ SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
 
 SOCAT_DEPENDENCIES = host-autoconf
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	SOCAT_DEPENDENCIES += openssl
+else
+	SOCAT_CONF_OPT += --disable-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+	SOCAT_DEPENDENCIES += readline
+else
+	SOCAT_CONF_OPT += --disable-readline
+endif
+
 define SOCAT_RUN_AUTOCONF
 	(cd $(@D); $(HOST_DIR)/usr/bin/autoconf)
 endef
