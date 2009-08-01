From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Aug 2009 11:31:29 +0200
Subject: [Buildroot] [git commit] makefile: don't hardcore install utility
	location
Message-ID: <20090801093432.499EC77804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1a2433b58e841f36790bd4015e1a19e5b9793d9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 3dcdfe1..0829e8f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -181,7 +181,7 @@ ifeq ($(BR2_STRIP_none),y)
 TARGET_STRIP=true -Not_stripping
 STRIPCMD=$(TARGET_STRIP)
 endif
-INSTALL=/usr/bin/install
+INSTALL=$(shell which install || type -p install)
 FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)
 
-- 
1.6.3.3
