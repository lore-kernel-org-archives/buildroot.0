From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:02:32 +0200
Subject: [Buildroot] [git commit] orbit: bump to version 2.2.4
Message-ID: <20170902195515.2FA4A8041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd4250d584c8204d8225682b967a5c69ccc68b4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/orbit/Config.in  | 3 ++-
 package/orbit/orbit.hash | 2 +-
 package/orbit/orbit.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/orbit/Config.in b/package/orbit/Config.in
index 556c46e..2953499 100644
--- a/package/orbit/Config.in
+++ b/package/orbit/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_ORBIT
 	bool "orbit"
 	# These are runtime dependencies
-	select BR2_PACKAGE_WSAPI
+	select BR2_PACKAGE_LPEG
 	select BR2_PACKAGE_LUAFILESYSTEM
+	select BR2_PACKAGE_WSAPI_XAVANTE
 	help
 	  An MVC web framework for Lua. The design is inspired by lightweight
 	  Ruby frameworks such as Camping
diff --git a/package/orbit/orbit.hash b/package/orbit/orbit.hash
index 91eba3c..9662a65 100644
--- a/package/orbit/orbit.hash
+++ b/package/orbit/orbit.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	42b0357041b4bdb051cb1a56cf73e3c2b2a2be207d431f70b4955465ad94b6a6  orbit-2.2.3-1.src.rock
+sha256 91e3c514d5b86918db83666c8889635bb2d50c71d1ab3aeb69c6469c9424089b  orbit-2.2.4-1.src.rock
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index fa30f38..3329439 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORBIT_VERSION_UPSTREAM = 2.2.3
+ORBIT_VERSION_UPSTREAM = 2.2.4
 ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-1
 ORBIT_SUBDIR = orbit
 ORBIT_LICENSE = MIT
