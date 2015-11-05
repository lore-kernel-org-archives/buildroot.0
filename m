From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 21:55:43 +0100
Subject: [Buildroot] [git commit] fastd: needs host-bison and host-pkgconf
Message-ID: <20151105205556.0F30981EB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e389f288dc07c109d4a508b94fbd1affcc1ab02b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (missing host-bison):
http://autobuild.buildroot.net/results/237/2371c98112a416f4d9d32576f207dad8d80ac537

host-pkgconf derived from $(@D)/cmake/deps.cmake

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fastd/fastd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index afaa27b..4c2626f 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -9,7 +9,7 @@ FASTD_SITE = git://git.universe-factory.net/fastd
 FASTD_LICENSE = BSD-2c
 FASTD_LICENSE_FILES = COPYRIGHT
 FASTD_CONF_OPTS = -DENABLE_LIBSODIUM=ON
-FASTD_DEPENDENCIES = libuecc libsodium libcap
+FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium libcap
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 FASTD_CONF_OPTS += -DENABLE_OPENSSL=ON
