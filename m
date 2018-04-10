From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 22:05:50 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] mosquitto: bump version
 to 1.4.14
Message-ID: <20180410205257.9EE53807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=184042f0e5410716f8bc5e26eff72de91624d489
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Drop CVE 2017-9868 patch as that is now upstream.

1.4.14 is a bugfix release, fixing significant websocket performance /
correctness issues.

Use HTTPS for the download as the server uses HSTS, thus saving a redirect.

While we're at it, add hashes for the license files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1b76bf7669d6482e61a82be9cd5d3c8806dabba6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 11 +++++++----
 package/mosquitto/mosquitto.mk   |  6 ++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 4ef174300e..f6f17aa5ef 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,4 +1,7 @@
-# From http://www.eclipse.org/downloads/download.php?file=/mosquitto/source/mosquitto-1.4.12.tar.gz
-sha512  75e6105498869ab13265df7a0bea6052c014d59d0c0efb61162d8257d34c0153fce32130e84c28e99fd494f374949aac5e01c19f7439c2eea575b52ef1179c3c  mosquitto-1.4.12.tar.gz
-# Locally computed:
-sha256  06abd1206e548ac2378dd96f5434cb3e40ed77cecb6a9c37fbabab0b0f1360e5  mosquitto-1.4.x_cve-2017-9868.patch
+# From http://www.eclipse.org/downloads/download.php?file=/mosquitto/source/mosquitto-1.4.14.tar.gz
+sha512 dc75a971354f87deeb79f32435acfae9bc561a1a24a75ee4940a35176ff91758071930d2105d8dee2a090e07527dbfaa5692bece67e03cc87e8b4b8b46f846c2  mosquitto-1.4.14.tar.gz
+
+# License files
+sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
+sha256 3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
+sha256 e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index bc693d5264..3eb677eb1b 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.12
-MOSQUITTO_SITE = http://mosquitto.org/files/source
+MOSQUITTO_VERSION = 1.4.14
+MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
 MOSQUITTO_INSTALL_STAGING = YES
-MOSQUITTO_PATCH = \
-	https://mosquitto.org/files/cve/2017-9868/mosquitto-1.4.x_cve-2017-9868.patch
 
 MOSQUITTO_MAKE_OPTS = \
 	UNAME=Linux \
