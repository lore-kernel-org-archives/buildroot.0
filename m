From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Sep 2019 10:51:56 +0200
Subject: [Buildroot] [git commit] package/mosquitto: bump version to 1.6.5
Message-ID: <20190916084726.F08D38E78E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7c4cdad1e09d1efd1e172a78f0bc3fad3ef858b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixing a number of issues:

- Fix v5 DISCONNECT packets with remaining length == 2 being treated as a
  protocol error.  Closes #1367.
- Fix support for libwebsockets 3.x (excluding 3.2.0)
- Fix slow websockets performance when sending large messages.  Closes
  #1390.
- Fix bridges potentially not connecting on Windows.  Closes #478.
- Fix clients authorised using use_identity_as_username or
  use_subject_as_username being disconnected on SIGHUP.  Closes #1402.
- Improve error messages in some situations when clients disconnect.
  Reduces the number of "Socket error on client X, disconnecting" messages.
- Fix Will for v5 clients not being sent if will delay interval was greater
  than the session expiry interval.  Closes #1401.
- Fix CRL file not being reloaded on HUP.  Closes #35.
- Fix repeated "Error in poll" messages on Windows when only websockets
  listeners are defined.  Closes #1391.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index bfab4ddb05..aa6eeaf13a 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 a3d5822c249f6a6e13311b1b09eff6807ea01608a5a77934e1769842e9d146ef  mosquitto-1.6.4.tar.gz
+sha256 bc71b38b5a26fc7cc772853e5607c657868db9f9a6d2b15e2b677649a0f85d20  mosquitto-1.6.5.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index f098213e1e..fd8e6df26a 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.4
+MOSQUITTO_VERSION = 1.6.5
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
