From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 23:29:48 +0200
Subject: [Buildroot] [git commit] mplayer: Only enable IPv6 if BR2_INET_IPV6
	is set
Message-ID: <20121004213120.607CD997AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ba4eedeee5342799c15207a64fe1a147c2cb020
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes false positive IPv6 detection.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 9967dd9..17680b6 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -153,6 +153,9 @@ define MPLAYER_FIXUP_IPV6_MREQ_DETECTION
 endef
 
 MPLAYER_POST_CONFIGURE_HOOKS += MPLAYER_FIXUP_IPV6_MREQ_DETECTION
+MPLAYER_CONF_OPTS += --disable-inet6
+else
+MPLAYER_CONF_OPTS += --enable-inet6
 endif
 
 define MPLAYER_BUILD_CMDS
