From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Sep 2009 17:40:24 +0200
Subject: [Buildroot] [git commit master] Makefile: be more quiet when make
	-s is used
Message-ID: <20090930154438.D23A37779A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=89464a96015e89da07b87d18b31f4b25b4c890ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Somehow got lost in the recent reorganisation.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 3895473..a7f0b88 100644
--- a/Makefile
+++ b/Makefile
@@ -202,6 +202,9 @@ BASE_TARGETS:=uclibc
 endif
 TARGETS:=
 
+# silent mode requested?
+QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)
+
 # Strip off the annoying quoting
 ARCH:=$(call qstrip,$(BR2_ARCH))
 ifeq ($(ARCH),xtensa)
-- 
1.6.3.3
