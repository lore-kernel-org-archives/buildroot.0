From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 19:14:08 +0100
Subject: [Buildroot] [git commit] guile: needs autorecof
Message-ID: <20150108181416.E0F508083E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d67e592ee67c5e27ee39a45c7b67a98aebbef3ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's patching configure.ac and triggering an automatic autoreconf which
doesn't end well. Fixes:
http://autobuild.buildroot.net/results/14f/14f502687f6344a85e67b37efe9b00b8c586a266/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/guile/guile.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index e57c917..fed79a6 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -8,6 +8,8 @@ GUILE_VERSION = 2.0.11
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
+# For 0002-calculate-csqrt_manually.patch
+GUILE_AUTORECONF = YES
 GUILE_LICENSE = LGPLv3+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
 
