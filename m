From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:13 -0000
Subject: [Buildroot] [git commit branch/next] sqlite: Add host build support
Message-ID: <20150808105611.4E6467F9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ab7bf0bf4952be85ac1e64e62d8831798f0a8ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Host sqlite is required by the host build of the setools package which
is required for SELinux support.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 9aac8e6..e4f42af 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -53,3 +53,4 @@ SQLITE_CONF_OPTS += --disable-readline
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
