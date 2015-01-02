From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 12:39:18 +0100
Subject: [Buildroot] [git commit] package/keyutils: disable static library
	for shared only build
Message-ID: <20150102113935.CD7E78081C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5dd1134e168fe7cc48a34f412dcb5a920a11867e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/keyutils/keyutils.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 2038c0d..36588e6 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 KEYUTILS_MAKE_PARAMS += NO_SOLIB=1
 endif
 
+ifeq ($(BR2_SHARED_LIBS),y)
+KEYUTILS_MAKE_PARAMS += NO_ARLIB=1
+endif
+
 define KEYUTILS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D)
 endef
