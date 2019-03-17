From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Sun, 17 Mar 2019 17:48:17 +0100
Subject: [Buildroot] [PATCH 1/1] support/cmake: Explicitly set CMAKE_SYSTEM
Message-ID: <20190317164817.13998-1-frank.vanbever@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages test for CMAKE_SYSTEM explicitly.[1]

CMAKE_SYSTEM is comprised of CMAKE_SYSTEM_NAME and CMAKE_SYSTEM_VERSION.
It defaults to CMAKE_SYSTEM_NAME if CMAKE_SYSTEM_VERSION is not set.[2]

At the point CMAKE_SYSTEM_NAME is set to "Linux" CMAKE_SYSTEM is already
constructed. Setting it explicitly ensures that it is the correct value.

[1] Fluidsynth https://github.com/FluidSynth/fluidsynth/blob/0cd44d00e1ec9a905d51163efde7b70ff8ae0ba3/CMakeLists.txt#L80
[2] https://cmake.org/cmake/help/git-master/variable/CMAKE_SYSTEM.html#variable:CMAKE_SYSTEM

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 support/misc/Buildroot.cmake | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/misc/Buildroot.cmake b/support/misc/Buildroot.cmake
index 9f5f565255..761b6d7ae2 100644
--- a/support/misc/Buildroot.cmake
+++ b/support/misc/Buildroot.cmake
@@ -1,5 +1,6 @@
 # Impersonate a Linux system. Afterall, that's what we are...
 set(CMAKE_SYSTEM_NAME Linux)
+set(CMAKE_SYSTEM ${CMAKE_SYSTEM_NAME})
 include(Platform/Linux)
 
 # Override problematic settings, to avoid RPATH against host lib directories.
-- 
2.19.1
