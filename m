From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 13 Aug 2020 10:22:35 +0200
Subject: [Buildroot] [PATCH] package/live555: update licenses
Message-ID: <20200813082235.890148-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The included license files indicate that the project is licensed
under GPL3.0 and LGPL3.0.

Even though the project site [1] only mentions LGPL.

- Add GPL-3.0+
- Bump LGPL License to 3.0+
- add the LGPL license file included in download

[1] http://live555.com/liveMedia/faq.html#copyright-and-license

Fixes:
 - https://bugs.busybox.net/show_bug.cgi?id=13156

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/live555/live555.hash | 1 +
 package/live555/live555.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 867e0befd0..cbe41802a1 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -3,3 +3,4 @@ md5  327bc53f60361c6d703d52e86f476f11  live.2020.06.25.tar.gz
 # Locally generated
 sha256  f206309f10d281990889b7a0c92c26a7fa55ac0e8568bf594b9b27433b4db585  live.2020.06.25.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index b2313886b1..bc48c5f8b3 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -7,8 +7,8 @@
 LIVE555_VERSION = 2020.06.25
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
-LIVE555_LICENSE = LGPL-2.1+
-LIVE555_LICENSE_FILES = COPYING
+LIVE555_LICENSE = LGPL-3.0+ or GPL-3.0+
+LIVE555_LICENSE_FILES = COPYING.LESSER COPYING
 LIVE555_INSTALL_STAGING = YES
 
 LIVE555_CFLAGS = $(TARGET_CFLAGS)
-- 
2.25.1
