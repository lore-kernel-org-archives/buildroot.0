From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2015 23:09:01 +0100
Subject: [Buildroot] [git commit] ibrdtnd: needs host-pkgconf
Message-ID: <20151113075130.AE41D81F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2156714b99757e82e9e29e62221608c6d8fd846c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script uses pkg-config to find the optional dependencies, so
make sure it is present:

checking pkg-config is at least version 0.9.0... yes

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ibrdtnd/ibrdtnd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ibrdtnd/ibrdtnd.mk b/package/ibrdtnd/ibrdtnd.mk
index e9fa43d..3451bfa 100644
--- a/package/ibrdtnd/ibrdtnd.mk
+++ b/package/ibrdtnd/ibrdtnd.mk
@@ -9,7 +9,7 @@ IBRDTND_SOURCE = ibrdtnd-$(IBRDTND_VERSION).tar.gz
 IBRDTND_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRDTND_LICENSE = Apache-2.0
 IBRDTND_LICENSE_FILES = COPYING
-IBRDTND_DEPENDENCIES = ibrdtn ibrcommon
+IBRDTND_DEPENDENCIES = ibrdtn ibrcommon host-pkgconf
 
 # Disable features that don't have the necessary dependencies in
 # Buildroot
