From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 23:00:35 +0100
Subject: [Buildroot] [git commit master 1/1] cdrkit: drop host-cmake
	dependencies
Message-ID: <20110202221651.390DA8F33C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fe34e2e06dc57c75a5b29e4acf4df59bbc99709a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that it's been converted to cmaketargets it doesn't need the
host-cmake dependencies since this are fulfilled in the infrastructure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cdrkit/cdrkit.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index ea7f65e..a57a8fd 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -2,8 +2,8 @@ CDRKIT_VERSION=1.1.10
 CDRKIT_SOURCE=cdrkit-$(CDRKIT_VERSION).tar.gz
 CDRKIT_SITE=http://www.cdrkit.org/releases/
 
-CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake zlib
-HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2 host-zlib
+CDRKIT_DEPENDENCIES=libcap bzip2 zlib
+HOST_CDRKIT_DEPENDENCIES=host-libcap host-bzip2 host-zlib
 
 ifeq ($(BR2_ENDIAN),"BIG")
 CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
-- 
1.7.3.4
