From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:50:04 +0100
Subject: [Buildroot] [git commit] mpd: Fix broken download URL
Message-ID: <20140103195018.6F0879C380@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5dccbffd80c681a6aef603714bf61d0fcfc1f8ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
