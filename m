From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 2 Jan 2014 18:46:12 +0100
Subject: [Buildroot] [PATCH v2 1/1] mpd: Fix broken download URL
Message-ID: <BLU0-SMTP522CB1F0B4D511CB7A3AE9D9CB0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---

Changes v1 -> v2:
- use <PKG>_VERSION_MAJOR ((suggested by Thomas & Jerzy)

 package/mpd/mpd.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index d8f344f..4367cae 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-MPD_VERSION = 0.17.6
+MPD_VERSION_MAJOR = 0.17
+MPD_VERSION = $(MPD_VERSION_MAJOR).6
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
-MPD_SITE = http://www.musicpd.org/download/mpd/stable
+MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf libglib2
 MPD_LICENSE = GPLv2
 MPD_LICENSE_FILES = COPYING
-- 
1.7.9.5
