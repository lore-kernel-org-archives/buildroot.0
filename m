From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  5 May 2017 17:30:31 -0300
Subject: [Buildroot] [PATCH 3/3] core: add "cmake3" to the list of cmake
	candidates
In-Reply-To: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
References: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1494016231-50639-4-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is useful on CentOS 7, whose "cmake" utility corresponds to version
2.8.12, which is too old for Buildroot.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 support/dependencies/check-host-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 42aaee4..f2eef8b 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -10,7 +10,7 @@
 #
 BR2_CMAKE_VERSION_MIN = 3.1
 
-BR2_CMAKE_CANDIDATES ?= cmake
+BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
 	$(BR2_CMAKE_CANDIDATES) $(BR2_CMAKE_VERSION_MIN))
 ifeq ($(BR2_CMAKE),)
-- 
1.8.3.1
