From: Stefan Agner <stefan@agner.ch>
Date: Mon, 28 Dec 2020 17:05:31 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/runc: add AppArmor support
Message-ID: <f30d5e4272c5730b4cadbf18517bce865c231040.1609171365.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal Vizeli <pvizeli@syshack.ch>

Signed-off-by: Pascal Vizeli <pvizeli@syshack.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
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
-- 
2.29.2
