From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:42:10 +0100
Subject: [Buildroot] [git commit] package/softether: remove 'v' prefix
Message-ID: <20191027104200.C6DFB88F99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1e054ec4f92dbb5e333616ebb8febac1ba7295c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes version parsing for release-monitoring.org support.

Cc: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/softether/softether.hash | 2 +-
 package/softether/softether.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index fdbbbca39d..986aac859b 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 fbf6e04c4451d0cb1555c3a53c178b5453c7d761119f82fd693538c9f115fecb softether-v4.28-9669-beta.tar.gz
+sha256 fbf6e04c4451d0cb1555c3a53c178b5453c7d761119f82fd693538c9f115fecb softether-4.28-9669-beta.tar.gz
 sha256 0a889e7e7a277397d0a2d56c37814eefd8c6b6129d8b74ee2d27fc3415fad561 LICENSE
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 1a31abd4bd..b7c6738b9a 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = v4.28-9669-beta
-SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,$(SOFTETHER_VERSION))
+SOFTETHER_VERSION = 4.28-9669-beta
+SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,v$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
 SOFTETHER_DEPENDENCIES = host-pkgconf host-softether libopenssl readline
