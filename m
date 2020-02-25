From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Feb 2020 23:21:50 +0100
Subject: [Buildroot] [git commit] Config.in: add BR2_HOST_GCC_AT_LEAST_9
Message-ID: <20200225220955.58C198E942@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1776190fb19f5516abae9437ca0639167af908ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fedora 30 switched to GCC 9.x. [1]

[1] https://fedoraproject.org/wiki/Changes/GCC9

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 5 +++++
 Makefile  | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 2913d39ec8..90403037e6 100644
--- a/Config.in
+++ b/Config.in
@@ -50,6 +50,11 @@ config BR2_HOST_GCC_AT_LEAST_8
 	default y if BR2_HOST_GCC_VERSION = "8"
 	select BR2_HOST_GCC_AT_LEAST_7
 
+config BR2_HOST_GCC_AT_LEAST_9
+	bool
+	default y if BR2_HOST_GCC_VERSION = "9"
+	select BR2_HOST_GCC_AT_LEAST_8
+
 # When adding new entries above, be sure to update
 # the HOSTCC_MAX_VERSION variable in the Makefile.
 
diff --git a/Makefile b/Makefile
index 9e38e2cae3..40e71ffbf4 100644
--- a/Makefile
+++ b/Makefile
@@ -340,7 +340,7 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
 
 # When adding a new host gcc version in Config.in,
 # update the HOSTCC_MAX_VERSION variable:
-HOSTCC_MAX_VERSION := 8
+HOSTCC_MAX_VERSION := 9
 
 HOSTCC_VERSION := $(shell V=$$($(HOSTCC_NOCCACHE) --version | \
 	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p'); \
