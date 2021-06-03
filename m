From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  3 Jun 2021 20:41:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: add SELinux module
Message-ID: <20210603184145.349794-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for bird is added by the services/bird module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bird/bird.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 8f2d030d3a..a8b9b18b50 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -9,6 +9,7 @@ BIRD_SITE = ftp://bird.network.cz/pub/bird
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
 BIRD_CPE_ID_VENDOR = nic
+BIRD_SELINUX_MODULES = bird
 BIRD_DEPENDENCIES = host-flex host-bison
 
 ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
-- 
2.30.2
