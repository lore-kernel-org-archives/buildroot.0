From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Aug 2009 23:21:30 +0200
Subject: [Buildroot] [git commit master] package/Makefile.in: use := for
	INSTALL
Message-ID: <20090826212214.DE0D277714@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=717aaab9e8ced5ee4dd2a2c9cf4af9dcc94d353a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So it doesn't get reevaluated every time and for consistency with FLEX/BISON.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2dbf37f..a67c1ca 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -181,7 +181,7 @@ ifeq ($(BR2_STRIP_none),y)
 TARGET_STRIP=true -Not_stripping
 STRIPCMD=$(TARGET_STRIP)
 endif
-INSTALL=$(shell which install || type -p install)
+INSTALL:=$(shell which install || type -p install)
 FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)
 
-- 
1.6.3.3
