From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Apr 2011 22:56:34 +0200
Subject: [Buildroot] [git commit] ncurses: roll back to version 5.7
Message-ID: <20110424210252.2D45A82A34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7d584285c8b32d8a419f8a5fb40efce66e8e5e24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ncurses 5.8 and 5.9 segfault with some applications so roll back to
version 5.7

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 91ab97a..ae3f3fb 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -23,9 +23,8 @@
 # USA
 
 # TARGETS
-NCURSES_VERSION = 5.8
+NCURSES_VERSION = 5.7
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
-NCURSES_SOURCE = ncurses-$(NCURSES_VERSION).tar.gz
 NCURSES_INSTALL_STAGING = YES
 
 NCURSES_CONF_OPT = \
-- 
1.7.3.4
