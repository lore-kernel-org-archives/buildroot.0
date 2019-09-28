From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Sat, 28 Sep 2019 07:36:02 +0000
Subject: [Buildroot] [PATCH 1/1] package/bird: RIP bug is fixed in 2.0.6
Message-ID: <20190928073602.7875-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/bird/Config.in | 5 +++++
 package/bird/bird.mk   | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index 22c39f8488..c2951c74c3 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -67,6 +67,11 @@ config BR2_PACKAGE_BIRD_RADV
 	help
 	  Enable RAdv protocol.
 
+config BR2_PACKAGE_BIRD_RIP
+	bool "rip"
+	help
+	  Enable RIP protocol.
+
 config BR2_PACKAGE_BIRD_STATIC
 	bool "static"
 	help
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 267968afb1..46c868ac30 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -17,9 +17,7 @@ else
 BIRD_CONF_OPTS += --disable-client
 endif
 
-# BUG: RIP is mandatory for now
 BIRD_PROTOCOLS = \
-	rip \
 	$(if $(BR2_PACKAGE_BIRD_BFD),bfd) \
 	$(if $(BR2_PACKAGE_BIRD_BABEL),babel) \
 	$(if $(BR2_PACKAGE_BIRD_BGP),bgp) \
-- 
2.19.1
