From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 20:40:53 +0200
Subject: [Buildroot] [git commit] radvd: drop autoreconf
Message-ID: <20130414184112.7EB3E9B62E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbf8cfdbb22eb1490ddf78415541e9e710ef44ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're no longer patching Makefile.am since the 1.9.2 bump, so we don't
need to autoreconf anymore.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 9d1d683..6c39fe2 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -7,7 +7,6 @@
 RADVD_VERSION = 1.9.3
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
-RADVD_AUTORECONF = YES
 
 define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
