From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 21:26:20 +0200
Subject: [Buildroot] [git commit] core: add "cmake3" to the list of cmake
	candidates
Message-ID: <20170624193647.B50BF80E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fc47a9f6b796df639a6f4011d7d579fb1a755d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is useful on CentOS 7, whose "cmake" utility corresponds to version
2.8.12, which is too old for Buildroot.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/check-host-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index ef080ff..07b064c 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -10,7 +10,7 @@
 #
 BR2_CMAKE_VERSION_MIN = 3.1
 
-BR2_CMAKE_CANDIDATES ?= cmake
+BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
 	$(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE_CANDIDATES))
 ifeq ($(BR2_CMAKE),)
