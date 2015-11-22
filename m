From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 14:04:01 +0100
Subject: [Buildroot] [git commit] bullet: disable on microblaze
Message-ID: <20151122130414.A43B681E0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eaa876ad31bc83d6c791ddefcad609a596f5b06e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc doesn't finish compiling btSoftBody.cpp when optimization is
enabled.

Fixes:
http://autobuild.buildroot.net/results/6e4a9ede477b031f47f7e271c38f67f432a3573c
http://autobuild.buildroot.net/results/7dc4ab759dd3b1e3e03fe52c78e31327340bf8c9
http://autobuild.buildroot.net/results/637bae8b2be6c4c64f4f7c661cc8d4606b553538

[Thomas: add reference to gcc bug.]

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bullet/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/bullet/Config.in b/package/bullet/Config.in
index fc285ab..d4d69d2 100644
--- a/package/bullet/Config.in
+++ b/package/bullet/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_BULLET
 	bool "bullet"
 	depends on BR2_INSTALL_LIBSTDCPP
+	# Affected by
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68476
+	depends on !BR2_microblaze
 	help
 	  Bullet is a Collision Detection and Rigid Body Dynamics
 	  Library.
@@ -9,3 +12,4 @@ config BR2_PACKAGE_BULLET
 
 comment "bullet needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_microblaze
