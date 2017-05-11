From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 May 2017 14:56:38 +0100
Subject: [Buildroot] [PATCH next 2/3] network-manager: add optional concheck
	support
In-Reply-To: <20170511135639.43280-1-Vincent.Riera@imgtec.com>
References: <20170511135639.43280-1-Vincent.Riera@imgtec.com>
Message-ID: <20170511135639.43280-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.10.2
