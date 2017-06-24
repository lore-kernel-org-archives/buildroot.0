From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 21:23:53 +0200
Subject: [Buildroot] [git commit] core: reverse the argument order in
	check-host-cmake
Message-ID: <20170624193647.8C383818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77a7a15e4c14d2b39e661dca9b7c94e773b00e93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass the minimal version before the program name. In a later change the
script will become able to test a list of candidates.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/check-host-cmake.mk | 2 +-
 support/dependencies/check-host-cmake.sh | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 8002278..914327f 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -12,7 +12,7 @@ BR2_CMAKE_VERSION_MIN = 3.1
 
 BR2_CMAKE ?= cmake
 ifeq ($(call suitable-host-package,cmake,\
-	$(BR2_CMAKE) $(BR2_CMAKE_VERSION_MIN)),)
+	$(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE)),)
 BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
 BR2_CMAKE_HOST_DEPENDENCY = host-cmake
 endif
diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index 9b63b06..73bd4ed 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 
-candidate="${1}"
-version_min="${2}"
+version_min="${1}"
+candidate="${2}"
 
 major_min="${version_min%.*}"
 minor_min="${version_min#*.}"
