From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  4 Feb 2020 10:48:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/jack2: drop dependency on
 host-python
Message-ID: <20200204094842.18729-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python was listed in jack2 dependencies, but is actually
not needed. Also tested with an experimental python3 based
Waf package infrastructure, so we can exclude that jack2
"accidentally" uses the host-python2 pulled in by Waf.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/jack2/jack2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index b08c45cce7..db63b7f4b7 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -7,7 +7,7 @@
 JACK2_VERSION = 1.9.14
 JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
-JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
+JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib
 JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa
-- 
2.24.1
