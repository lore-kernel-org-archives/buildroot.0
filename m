From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:18:01 +0200
Subject: [Buildroot] [git commit branch/next] network-manager: add optional
	concheck support
Message-ID: <20170511191817.60E1380102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4be3f800dccec67cc873c15f83aeda73c5b1a673
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/network-manager/network-manager.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 1d17ec4..9f4cebe 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -30,8 +30,14 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--with-crypto=gnutls \
 	--with-iptables=/usr/sbin/iptables \
 	--disable-ifupdown \
-	--disable-ifnet \
-	--disable-concheck
+	--disable-ifnet
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+NETWORK_MANAGER_DEPENDENCIES += libcurl
+NETWORK_MANAGER_CONF_OPTS += --enable-concheck
+else
+NETWORK_MANAGER_CONF_OPTS += --disable-concheck
+endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 NETWORK_MANAGER_DEPENDENCIES += newt
