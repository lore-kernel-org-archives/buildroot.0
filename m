From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 21 Apr 2021 15:42:29 -0500
Subject: [Buildroot] [PATCH 04/10] package/cmake: ignore CVE-2016-10642
In-Reply-To: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210421204235.5956-5-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.17.1
