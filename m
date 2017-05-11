From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 May 2017 14:56:39 +0100
Subject: [Buildroot] [PATCH next 3/3] network-manager: add optional ofono
	support
In-Reply-To: <20170511135639.43280-1-Vincent.Riera@imgtec.com>
References: <20170511135639.43280-1-Vincent.Riera@imgtec.com>
Message-ID: <20170511135639.43280-3-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 9f4cebe..4a05a65 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -32,6 +32,13 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--disable-ifupdown \
 	--disable-ifnet
 
+ifeq ($(BR2_PACKAGE_OFONO),y)
+NETWORK_MANAGER_DEPENDENCIES += ofono
+NETWORK_MANAGER_CONF_OPTS += --with-ofono
+else
+NETWORK_MANAGER_CONF_OPTS += --without-ofono
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 NETWORK_MANAGER_DEPENDENCIES += libcurl
 NETWORK_MANAGER_CONF_OPTS += --enable-concheck
-- 
2.10.2
