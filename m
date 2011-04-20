From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Apr 2011 14:41:58 -0300
Subject: [Buildroot] [PATCH 6/7] ncurses: roll back to version 5.7
In-Reply-To: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303321319-16553-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ncurses 5.8 and 5.9 segfault with some applications so roll back to
version 5.7

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
