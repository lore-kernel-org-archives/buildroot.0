From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 21:21:19 +0100
Subject: [Buildroot] [git commit] infozip: fix optimization level in
	Makefile patch
Message-ID: <20140202202242.0FDF49C6D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc95ad82e11e9a97131884574de78afc2918cffc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Noop in Buildroot as we override CFLAGS, but cleaner.

Reported-by: Alexander Lukichev <alexander.lukichev@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../infozip-0001-configure-fix-cross-build.patch   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/infozip/infozip-0001-configure-fix-cross-build.patch b/package/infozip/infozip-0001-configure-fix-cross-build.patch
index 275effd..0b939b3 100644
--- a/package/infozip/infozip-0001-configure-fix-cross-build.patch
+++ b/package/infozip/infozip-0001-configure-fix-cross-build.patch
@@ -31,7 +31,7 @@ index abd0c44..8388c74 100644
  #   LFLAGS2   flags after obj file list (libraries, etc)
  CFLAGS_NOOPT = -I. -DUNIX $(LOCAL_ZIP)
 -CFLAGS = -O2 $(CFLAGS_NOOPT)
-+CFLAGS ?= -02 $(CFLAGS_NOOPT)
++CFLAGS ?= -O2 $(CFLAGS_NOOPT)
  LFLAGS1 =
  LFLAGS2 = -s
  
