From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:42 -0000
Subject: [Buildroot] [git commit branch/next] avahi: fix systemd service
	file install path
Message-ID: <20150808105631.9DB3A7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea63dc42cdea4640fa427e838a7056248a1b0ce2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas: fix indentation.]

Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 24967f4..9c6b609 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -90,7 +90,10 @@ AVAHI_DEPENDENCIES = \
 
 AVAHI_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),)
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+AVAHI_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+else
+AVAHI_CONF_OPTS += --with-systemdsystemunitdir=no
 AVAHI_CFLAGS += -DDISABLE_SYSTEMD
 endif
 
