From: =?utf-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 8 Jun 2010 23:32:40 +0200
Subject: [Buildroot] [git commit master] cdrkit: fix build by adding zlib as
	dependency
Message-ID: <20100608220139.4A449909FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3b4430c3de11011e8b208273d5effd2e0776946
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cdrkit/cdrkit.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index a6a2e80..f7e21b0 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -2,8 +2,8 @@ CDRKIT_VERSION=1.1.10
 CDRKIT_SOURCE=cdrkit-$(CDRKIT_VERSION).tar.gz
 CDRKIT_SITE=http://www.cdrkit.org/releases/
 
-CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake
-HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2
+CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake zlib
+HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2 host-zlib
 
 ifeq ($(BR2_ENDIAN),"BIG")
 CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
-- 
1.6.3.3
