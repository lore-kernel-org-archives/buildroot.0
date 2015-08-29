From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 20:42:31 +0200
Subject: [Buildroot] [git commit] ibrdtn: fix bogus dependency on zlib
Message-ID: <20150901083108.EC2EC800E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f56de721c4d98e5c064be584e0efbb14f84b0b71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a copy/paste mistake, zlib was being added to
<pkg>_DEPENDENCIES even when not enabled in the configuration. This
commit fixes that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ibrdtn/ibrdtn.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/ibrdtn/ibrdtn.mk b/package/ibrdtn/ibrdtn.mk
index aab27a8..f899843 100644
--- a/package/ibrdtn/ibrdtn.mk
+++ b/package/ibrdtn/ibrdtn.mk
@@ -17,7 +17,6 @@ IBRDTN_CONF_OPTS += --with-compression
 IBRDTN_DEPENDENCIES += zlib
 else
 IBRDTN_CONF_OPTS += --without-compression
-IBRDTN_DEPENDENCIES += zlib
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
