From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:20:55 +0200
Subject: [Buildroot] [PATCH 02/20] xcb-util: add dependency on host-gperf
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <def6e3fd144a677d0b666a97ebc31a8be21b8ebd.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gperf on the host is needed, since it is used by xcb-util to generate
a perfect hash function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xcb-util/xcb-util.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index 51b753e..b0dabd8 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -7,6 +7,7 @@ XCB_UTIL_VERSION = 0.3.6
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
 XCB_UTIL_LIBTOOL_PATCH = NO
+XCB_UTIL_DEPENDENCIES = host-gperf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xcb-util))
 
-- 
1.7.0.4
