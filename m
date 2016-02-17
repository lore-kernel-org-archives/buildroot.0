From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 11:18:41 +0100
Subject: [Buildroot] [git commit] mosquitto: security bump to version 1.4.8
Message-ID: <20160217102011.302678194E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9055885e7f7cfaf3362e8e1753a827f380864d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes a fix for a security related bug related to the listener
mount_point feature.  The bug allows a client that is restricted to a
mount_point to publish messages outside this hierarchy using the last will
and testament feature.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index a8de658..861136b 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  71a1cb37893403e00b7db85c5db4af50b40d055ce61e5d21092c2594f2023b8b  mosquitto-1.4.7.tar.gz
+sha256  d96eb5610e57cc3e273f4527d3f54358ab7711459941a9e64bc4d0a85c2acfda  mosquitto-1.4.8.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index d6a5fb2..dfef6e5 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.7
+MOSQUITTO_VERSION = 1.4.8
 MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
