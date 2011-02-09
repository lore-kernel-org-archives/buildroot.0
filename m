From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Feb 2011 10:25:52 -0300
Subject: [Buildroot] [PATCH 4/5] mpd: fix libao support
In-Reply-To: <1297257953-8381-1-git-send-email-gustavo@zacarias.com.ar>
References: <1297257953-8381-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1297257953-8381-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libao output must be explicitly enabled, so fix it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/mpd.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index c60ccc6..971ad67 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -18,8 +18,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MPD_AO),y)
 MPD_DEPENDENCIES += libao
-else
-MPD_CONF_OPT += --disable-ao
+MPD_CONF_OPT += --enable-ao
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
-- 
1.7.3.4
