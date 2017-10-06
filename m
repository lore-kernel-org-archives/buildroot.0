From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Oct 2017 21:18:10 +0200
Subject: [Buildroot] [git commit] package/freeswitch: install to staging
Message-ID: <20171006191633.DC4388115D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=922e33d046ddb4856ff28c9d7c17c29134ce6959
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for upcoming package freeswitch-mod-bcg729.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout: made comment more explicit]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freeswitch/freeswitch.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e5c8854..ce22ffc 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -7,6 +7,8 @@
 FREESWITCH_VERSION = 1.6.19
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
+# External modules need headers/libs from staging
+FREESWITCH_INSTALL_STAGING = YES
 FREESWITCH_LICENSE = MPL-1.1, \
 	GPL-3.0+ with font exception (fonts), \
 	Apache-2.0 (apr, apr-util), \
