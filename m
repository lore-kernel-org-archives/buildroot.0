From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 14:56:31 +0200
Subject: [Buildroot] [git commit] package/freeswitch: Fix added license
Message-ID: <20160509130104.2F0A77FD13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9064a26b8ae488df0d2b3503b3d4a18f51892592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Noted by Thomas:
http://lists.busybox.net/pipermail/buildroot/2016-April/158864.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: add comma to separate the licenses.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 71a7add..03ef8bc 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -161,7 +161,7 @@ FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 # mod_isac supports a limited set of archs
 # src/mod/codecs/mod_isac/typedefs.h
 ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_64),y)
-FREESWITCH_LICENSE += BSD-3c (mod_isac)
+FREESWITCH_LICENSE := $(FREESWITCH_LICENSE), BSD-3c (mod_isac)
 FREESWITCH_LICENSE_FILES += src/mod/codecs/mod_isac/LICENSE
 FREESWITCH_ENABLED_MODULES += codecs/mod_isac
 endif
