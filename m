From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:57:09 +0100
Subject: [Buildroot] [git commit] dhcp: install dhclient to /sbin
Message-ID: <20141201104836.5C5887FCD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38372fbbef3087d0ebf3ccd8ebd332c2565f95c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Debian ifupdown uses an explicit call to /sbin/dhclient.
Busybox ifupdown uses the search path.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/dhcp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 27fb60b..1eb6b32 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -59,7 +59,7 @@ define DHCP_INSTALL_CLIENT
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
 	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient \
-		$(TARGET_DIR)/usr/sbin/dhclient
+		$(TARGET_DIR)/sbin/dhclient
 	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
 		$(TARGET_DIR)/etc/dhcp/dhclient.conf
 	$(INSTALL) -m 0755 -D package/dhcp/dhclient-script \
