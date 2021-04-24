From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 11:25:31 +0200
Subject: [Buildroot] [git commit] package/cmake: ignore CVE-2016-10642
Message-ID: <20210424090312.9CE5A8393E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ce1e773b94642a034ccb48f22f05b5933b907e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is specific to the npm package that installs cmake, so isn't
relevant to Buildroot.
https://github.com/openembedded/openembedded-core/blob/14241ed09f9ed317045cf75a6d08416d3579bb8d/meta/recipes-devtools/cmake/cmake.inc

https://nvd.nist.gov/vuln/detail/CVE-2016-10642#vulnCurrentDescriptionTitle
 "cmake installs the cmake x86 linux binaries. cmake downloads
 binary resources over HTTP, which leaves it vulnerable to
 MITM attacks. It may be possible to cause remote code
 execution (RCE) by swapping out the requested binary with
 an attacker controlled binary if the attacker is on the
 network or positioned in between the user and the remote server."

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cmake/cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index a3015fabfd..90fe868fa5 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -10,6 +10,8 @@ CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
 CMAKE_CPE_ID_VENDOR = cmake_project
+# Tool download MITM attack warning if using npm package to install cmake
+CMAKE_IGNORE_CVES = CVE-2016-10642
 
 # CMake is a particular package:
 # * CMake can be built using the generic infrastructure or the cmake one.
