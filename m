From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu,  3 Dec 2015 22:31:57 -0200
Subject: [Buildroot]  [PATCH v2 1/1] fakeroot: build depends on libcap
Message-ID: <1449189117-15523-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
 - Use HOST_FAKEROOT_DEPENDENCIES (suggested by Arnout Vandecappelle)
---
 package/fakeroot/fakeroot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 8bb9294..c7e6956 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -10,4 +10,6 @@ FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
+HOST_FAKEROOT_DEPENDENCIES = host-libcap
+
 $(eval $(host-autotools-package))
-- 
1.9.1
