From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 01 Jun 2017 20:28:50 -0000
Subject: [Buildroot] [git commit] network-manager: add optional ofono support
Message-ID: <20170601202849.E3C518261C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b33b493b7feebfc933873cb34ac70c042e89a1d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
