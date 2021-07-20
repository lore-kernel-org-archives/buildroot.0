From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Jul 2021 00:02:22 +0200
Subject: [Buildroot] [git commit] package/bird: add SELinux module
Message-ID: <20210720212820.4B034886E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=459d725db02febf10cde1d5cac9485c2fd0cfeec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for bird is added by the services/bird module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bird/bird.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index b711e7de01..4d4dfe1dca 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -9,6 +9,7 @@ BIRD_SITE = ftp://bird.network.cz/pub/bird
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
 BIRD_CPE_ID_VENDOR = nic
+BIRD_SELINUX_MODULES = bird
 BIRD_DEPENDENCIES = host-flex host-bison
 
 ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
