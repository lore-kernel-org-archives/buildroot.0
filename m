From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:19:46 +0100
Subject: [Buildroot] [git commit] boost: fixup host variant dependencies
Message-ID: <20131211213614.6725A9A383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b46aa39e3d759db5df553ac591396677afa51d51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Define an empty HOST_BOOST_DEPENDENCIES to avoid inheriting
BOOST_DEPENDENCIES.
Also ditch redundant empty definitions for BOOST_DEPENDENCIES and
BOOST_FLAGS.

Fixes:
http://autobuild.buildroot.net/results/9c6/9c64dd473a8096bb6343d746544997e333053e8b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index b97d12b..d6d10e1 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -13,9 +13,7 @@ BOOST_INSTALL_STAGING = YES
 TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
 HOST_CC_VERSION = $(shell $(HOSTCC) -dumpversion)
 
-BOOST_DEPENDENCIES =
-
-BOOST_FLAGS =
+HOST_BOOST_DEPENDENCIES =
 
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu \
