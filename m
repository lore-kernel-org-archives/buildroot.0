From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 18:40:05 +0100
Subject: [Buildroot] [git commit] package/pkg-download: do not hard-code
	QUIET
Message-ID: <20150104175709.B55BD8041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4dc54da061b27379adb9728bf337ab07b2daefe2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not hard-code QUIET in our download commands, since it is handled in
the backends.

Suggested by Fabio.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9c782fe..5e74519 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -8,14 +8,14 @@
 ################################################################################
 
 # Download method commands
-export WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
+export WGET := $(call qstrip,$(BR2_WGET))
 export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
 export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
-export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
-export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
-SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
+export HG := $(call qstrip,$(BR2_HG))
+export SCP := $(call qstrip,$(BR2_SCP))
+SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
