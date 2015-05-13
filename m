From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 09:17:49 +0200
Subject: [Buildroot] [git commit] czmq: needs host-pkgconf
Message-ID: <20150513071940.72AA7818DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=daa8485bc12d44c6bf697f7a1bde488250486ea2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses pkg-config to find zeromq, so ensure it is available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/czmq/czmq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index d25bf01..3d82095 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -10,7 +10,7 @@ CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
 # Autoreconf required as we use the git tree
 CZMQ_AUTORECONF = YES
 CZMQ_INSTALL_STAGING = YES
-CZMQ_DEPENDENCIES = zeromq
+CZMQ_DEPENDENCIES = zeromq host-pkgconf
 CZMQ_LICENSE = MPLv2.0
 CZMQ_LICENSE_FILES = LICENSE
 
