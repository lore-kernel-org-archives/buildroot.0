From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 21:21:30 +0100
Subject: [Buildroot] [git commit] package/runc: add AppArmor support
Message-ID: <20201228201521.D0A0D83597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d0f08ae43d3f2a464bd14a884d4c87de0b82593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pascal Vizeli <pvizeli@syshack.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/runc/runc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 3d177d23d5..c559244e83 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -12,6 +12,11 @@ RUNC_LICENSE_FILES = LICENSE
 RUNC_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
 
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+RUNC_DEPENDENCIES += libapparmor
+RUNC_TAGS += apparmor
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 RUNC_TAGS += seccomp
 RUNC_DEPENDENCIES += libseccomp host-pkgconf
