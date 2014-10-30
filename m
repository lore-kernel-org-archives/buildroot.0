From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Thu, 30 Oct 2014 10:03:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/shairport-sync: fix avahi dependency
Message-ID: <1414659789-16887-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shairport-syncs avahi (zeroconf) support needs libdns_sd which is only build
when BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY is selected.

Fixes autobuild errors:
  - http://autobuild.buildroot.net/results/a6a/a6ab7641a3cafcdaeffe11f08d5fcacbbb882d8d/
  - http://autobuild.buildroot.net/results/cb4/cb41980f2fb416d627bea0950e1dae727eae0ca6/
  - http://autobuild.buildroot.net/results/009/00929df01474813be576936e80e86374efdbc327/
  - http://autobuild.buildroot.net/results/a40/a40b8cf9aaa4ade4d96524219276cfad2920104c/
  - http://autobuild.buildroot.net/results/03f/03fff2805b3348f2557bbef73a716eadea3add03/

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/shairport-sync/shairport-sync.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 58343f4..53d7895 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -17,7 +17,7 @@ SHAIRPORT_SYNC_AUTORECONF = YES
 SHAIRPORT_SYNC_CONF_OPTS = --with-alsa # required
 
 # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns)
-ifeq ($(BR2_PACKAGE_AVAHI),y)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
 SHAIRPORT_SYNC_DEPENDENCIES += avahi
 SHAIRPORT_SYNC_CONF_OPTS += --with-avahi
 else
-- 
2.1.3
