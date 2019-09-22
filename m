From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:19 +0200
Subject: [Buildroot] [PATCH 03/30] package/policycoreutils: drop
 host-setools dependency from host-policycoreutils
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no reason for host-policycoreutils to depend on host-setools,
it builds/works fine without it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/policycoreutils/policycoreutils.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 4f7176777c..ff606a7d17 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -60,8 +60,7 @@ define POLICYCOREUTILS_INSTALL_TARGET_CMDS
 	)
 endef
 
-HOST_POLICYCOREUTILS_DEPENDENCIES = \
-	host-libsemanage host-setools
+HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
-- 
2.21.0
