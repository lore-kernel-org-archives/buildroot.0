From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 30 May 2018 23:27:02 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: depend on host-nfs-utils
Message-ID: <20180530212702.14411-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-nfs-utils provides the host rpcgen utility. This fixes the build on
recent Fedora systems that removed rpcgen from the glibc package.

Fixes:
http://autobuild.buildroot.net/results/e21/e219b8bacb52bb661eb6663b82f549ed941f26fe

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/openvmtools/openvmtools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index cc71324ff0..9501ef3361 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -17,7 +17,7 @@ OPENVMTOOLS_CONF_OPTS = --with-dnet \
 	--without-gtkmm --without-kernel-modules \
 	--disable-deploypkg --without-xerces
 OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS=" "
-OPENVMTOOLS_DEPENDENCIES = libglib2 libdnet
+OPENVMTOOLS_DEPENDENCIES = host-nfs-utils libglib2 libdnet
 
 # When libfuse is available, openvmtools can build vmblock-fuse, so
 # make sure that libfuse gets built first
-- 
2.14.3
