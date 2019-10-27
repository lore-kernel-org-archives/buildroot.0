From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 21:35:06 +0100
Subject: [Buildroot] [git commit] package/ngrep: relace '_' by '.' in version
Message-ID: <20191027202845.E4A088A5F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c00edee402ac741bd30bee669b0c997415f35be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for the ngrep version to match what is given by
release-monitoring.org, replace '_' by '.' in NGREP_VERSION

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ngrep/ngrep.hash | 2 +-
 package/ngrep/ngrep.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ngrep/ngrep.hash b/package/ngrep/ngrep.hash
index bf9e621a89..7dd13b3b67 100644
--- a/package/ngrep/ngrep.hash
+++ b/package/ngrep/ngrep.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dc4dbe20991cc36bac5e97e99475e2a1522fd88c59ee2e08f813432c04c5fff3  ngrep-1_47.tar.gz
+sha256  dc4dbe20991cc36bac5e97e99475e2a1522fd88c59ee2e08f813432c04c5fff3  ngrep-1.47.tar.gz
 sha256  d46e593e048e0b9fc803561ed4c283f37a2d5447e4dcfa10cad29b394c2b8b9e  LICENSE
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index d17792cda0..c4750f7504 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NGREP_VERSION = 1_47
-NGREP_SITE = $(call github,jpr5,ngrep,V$(NGREP_VERSION))
+NGREP_VERSION = 1.47
+NGREP_SITE = $(call github,jpr5,ngrep,$(subst .,_,V$(NGREP_VERSION)))
 NGREP_LICENSE = BSD-4-Clause-like, BSD-3-Clause (tcpkill)
 NGREP_LICENSE_FILES = LICENSE
 NGREP_INSTALL_STAGING = YES
