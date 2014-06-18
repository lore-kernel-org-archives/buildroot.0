From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:55:57 +0200
Subject: [Buildroot] [git commit] vlc: security bump to version 2.1.4
Message-ID: <20140618123419.8EC859CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=162520241bed94a9f5ded3140aa4664e1d4988f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-1684: The ASF_ReadObject_file_properties function in
modules/demux/asf/libasf.c in the ASF Demuxer in VideoLAN VLC Media
Player before 2.1.3 allows remote attackers to cause a denial of service
(divide-by-zero error and crash) via a zero minimum and maximum data
packet size in an ASF file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6eb7eea..6c4677a 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.1.2
+VLC_VERSION = 2.1.4
 VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
