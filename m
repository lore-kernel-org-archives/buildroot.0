From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 15:35:15 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] mosquitto: add upstream
	security fix
Message-ID: <20170702133244.6CF6981F11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aacfdcfa76de863361179e8393c98163974148a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-9868: In Mosquitto through 1.4.12, mosquitto.db (aka the
persistence file) is world readable, which allows local users to obtain
sensitive MQTT topic information.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e51d69a3b11ae971d2aa65d6d0a6f0bb7730e0ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 1 +
 package/mosquitto/mosquitto.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 6c102eb..82bf5c6 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha512  75e6105498869ab13265df7a0bea6052c014d59d0c0efb61162d8257d34c0153fce32130e84c28e99fd494f374949aac5e01c19f7439c2eea575b52ef1179c3c  mosquitto-1.4.12.tar.gz
+sha256  06abd1206e548ac2378dd96f5434cb3e40ed77cecb6a9c37fbabab0b0f1360e5  mosquitto-1.4.x_cve-2017-9868.patch
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 9853549..bc693d5 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -9,6 +9,8 @@ MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
 MOSQUITTO_INSTALL_STAGING = YES
+MOSQUITTO_PATCH = \
+	https://mosquitto.org/files/cve/2017-9868/mosquitto-1.4.x_cve-2017-9868.patch
 
 MOSQUITTO_MAKE_OPTS = \
 	UNAME=Linux \
