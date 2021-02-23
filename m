From: Andreas Klinger <ak@it-klinger.de>
Date: Tue, 23 Feb 2021 19:04:37 +0100
Subject: [Buildroot] [PATCH] package/ply: build needs flex and bison
Message-ID: <20210223180435.GA30395@arbad>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building needs flex and bison installed on the host system.

Fixes:
http://autobuild.buildroot.net/results/7cfe75725f4746367f2870ee9545f31ba56f6ec1

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 package/ply/ply.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ply/ply.mk b/package/ply/ply.mk
index 0e4141f650..e627a9181f 100644
--- a/package/ply/ply.mk
+++ b/package/ply/ply.mk
@@ -10,5 +10,6 @@ PLY_AUTORECONF = YES
 PLY_LICENSE = GPL-2.0
 PLY_LICENSE_FILES = COPYING
 PLY_INSTALL_STAGING = YES
+PLY_DEPENDENCIES += host-flex host-bison
 
 $(eval $(autotools-package))
-- 
2.20.1
