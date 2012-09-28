From: Valentine Barshak <gvaxon@gmail.com>
Date: Fri, 28 Sep 2012 23:19:48 +0400
Subject: [Buildroot] [PATCH 2/2] mplayer: Only enable IPv6 if BR2_INET_IPV6
	is set
In-Reply-To: <20120928191730.GA9550@gmail.com>
Message-ID: <20120928191948.GA9864@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes false positive IPv6 detection.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/multimedia/mplayer/mplayer.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 788beeb..1a6b14f 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -138,6 +138,9 @@ define MPLAYER_FIXUP_IPV6_MREQ_DETECTION
 endef
 
 MPLAYER_POST_CONFIGURE_HOOKS += MPLAYER_FIXUP_IPV6_MREQ_DETECTION
+MPLAYER_CONF_OPTS += --disable-inet6
+else
+MPLAYER_CONF_OPTS += --enable-inet6
 endif
 
 define MPLAYER_BUILD_CMDS
-- 
1.7.11.4
