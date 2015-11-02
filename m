From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 20:56:22 +0100
Subject: [Buildroot] [git commit] toolchain: add 4.3.x choice for headers
Message-ID: <20151102195651.A803B81DC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aef2df82e1eace53fef0c998ec360299a5135b9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: "James Knight" <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in          |    5 +++++
 toolchain/toolchain-external/Config.in |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 4e880a2..6871d8b 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -231,10 +231,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 	default "4.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 	default "4.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
 	default "4.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4291394..3f6b8e8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1030,6 +1030,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3
+	bool "4.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_2
 	bool "4.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
