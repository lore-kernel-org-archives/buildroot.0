From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:24:44 +0100
Subject: [Buildroot] [git commit] package/libnet: add LIBNET_CONFIG_SCRIPTS
Message-ID: <20210316200058.18D93802D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ca79b8d1850f19aa83468ada5c3f852d6774185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set LIBNET_CONFIG_SCRIPTS to libnet-config to fix a build failure with
syslog-ng and libnet in version 1.2 due to -L$(libdir) which has been
added with
https://github.com/libnet/libnet/commit/6859d1f198f97aad129c54fcd156700a9178204e

Fixes:
 - http://autobuild.buildroot.org/results/45e517401d14e304e9c6c990f1b4ead92c850ba2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnet/libnet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index da7d5db3ed..a5a814f4d2 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -13,5 +13,6 @@ LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
 LIBNET_LICENSE = BSD-2-Clause, BSD-3-Clause
 LIBNET_LICENSE_FILES = LICENSE
 LIBNET_CPE_ID_VENDOR = libnet_project
+LIBNET_CONFIG_SCRIPTS = libnet-config
 
 $(eval $(autotools-package))
