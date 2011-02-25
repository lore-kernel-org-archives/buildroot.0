From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Feb 2011 17:10:06 -0300
Subject: [Buildroot] [PATCH 2/3] mpd: forcibly disable oggflac without flac
In-Reply-To: <1298664607-423-1-git-send-email-gustavo@zacarias.com.ar>
References: <1298664607-423-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1298664607-423-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If flac and libogg were both built but flac isn't selected in mpd it
will be picked up anyway.
Forcibly disable oggflac support if flac support is disabled for
consistency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/mpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 3653152..d6658ae 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -35,7 +35,7 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
 MPD_DEPENDENCIES += flac
 else
-MPD_CONF_OPT += --without-flac
+MPD_CONF_OPT += --without-flac --disable-oggflac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_CURL),y)
-- 
1.7.3.4
