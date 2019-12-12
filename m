From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 08:45:18 +0100
Subject: [Buildroot] [git commit] package/dante: add optional libminiupnpc
 dependency
Message-ID: <20191212074101.5902F81E02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcd7b1ce3f3b4ff1c624facafe2de1d302614e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dante/dante.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 0668042bd8..35b785dc70 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -14,6 +14,13 @@ DANTE_AUTORECONF = YES
 
 DANTE_CONF_OPTS += --disable-client --disable-preload
 
+ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
+DANTE_DEPENDENCIES += libminiupnpc
+DANTE_CONF_OPTS += --with-upnp
+else
+DANTE_CONF_OPTS += --without-upnp
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 DANTE_DEPENDENCIES += linux-pam
 DANTE_CONF_OPTS += --with-pam
