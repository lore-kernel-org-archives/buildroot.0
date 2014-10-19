From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 13:01:04 +0200
Subject: [Buildroot] [git commit] avahi: remove useless 'mkdir -p' in
	AVAHI_INSTALL_INIT_SYSTEMD
Message-ID: <20141019111437.ADE7BAF20E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c947771424b139199fc56bb7fff47755a17c6a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In AVAHI_INSTALL_INIT_SYSTEMD, since we're using 'install -D' to
install /usr/lib/tmpfiles.d/avahi.conf in $(TARGET_DIR), there's no
need to have a 'mkdir -p' before that, since 'install -D' creates the
directories as needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index cafb2db..b684ab7 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -172,8 +172,6 @@ define AVAHI_INSTALL_INIT_SYSTEMD
 	ln -fs /lib/systemd/system/avahi-dnsconfd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-dnsconfd.service
 
-	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
-
 	$(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
 endef
