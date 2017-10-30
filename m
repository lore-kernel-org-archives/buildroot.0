From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Oct 2017 11:37:26 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: bump to version 3.8153
Message-ID: <20171030103726.1801-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.hash | 2 +-
 package/domoticz/domoticz.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 7feab8fbc..103618d5a 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	fb88edbe428851a7a337a85faa93f6da00713b3ad086ff6957031dc9b3b58bba	domoticz-3.5877.tar.gz
+sha256	5ea8f37f2ef900e9bd17b1b5375e75bfdec4f09001e3e2e0b647a260989d014c	domoticz-3.8153.tar.gz
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 59731b514..bd25708a1 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 3.5877
+DOMOTICZ_VERSION = 3.8153
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
@@ -59,6 +59,13 @@ DOMOTICZ_DEPENDENCIES += openzwave
 DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+DOMOTICZ_DEPENDENCIES += python3
+DOMOTICZ_CONF_OPTS += -DUSE_PYTHON=ON
+else
+DOMOTICZ_CONF_OPTS += -DUSE_PYTHON=OFF
+endif
+
 # Install domoticz in a dedicated directory (/opt/domoticz) as
 # domoticz expects by default that all its subdirectories (www,
 # Config, scripts, ...) are in the binary directory.
-- 
2.14.1
