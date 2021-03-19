From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 21:51:06 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/runc: cleanup the
 CPE_ID variables
Message-ID: <20210319204446.0087986D2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27d933a5ed25221ec1d4344bcfc0498437650a46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The CPE variables are derived from the package upstream values, so they
must be set from the package values, not the other way around.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Christian Stewart <christian@paral.in>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 051ccfbaf1d8f835fe5742ffdda00220873025ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index c0de2783e4..14689bbde1 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-RUNC_VERSION = $(RUNC_CPE_ID_VERSION)-$(RUNC_CPE_ID_UPDATE)
+RUNC_VERSION_MAJOR = 1.0.0
+RUNC_VERSION_MINOR = rc92
+RUNC_VERSION = $(RUNC_VERSION_MAJOR)-$(RUNC_VERSION_MINOR)
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 RUNC_CPE_ID_VENDOR = linuxfoundation
-RUNC_CPE_ID_VERSION = 1.0.0
-RUNC_CPE_ID_UPDATE = rc92
+RUNC_CPE_ID_VERSION = $(RUNC_VERSION_MAJOR)
+RUNC_CPE_ID_UPDATE = $(RUNC_VERSION_MINOR)
 
 RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
