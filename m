From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2020 22:54:53 +0100
Subject: [Buildroot] [git commit] package/sdbusplus: fix indentation
Message-ID: <20200220214558.8AAEF8E689@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bb9b7c56b08c21efeee58b7177df9c96fd5b94b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a check-package error introduce by 6bf74ce3db (package/sdbusplus:
create m4 directory before autoreconf):

    package/sdbusplus/sdbusplus.mk:29: expected indent with tabs

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: John Faith <jfaith@impinj.com>
Cc: Michael Walle <michael@walle.cc>
---
 package/sdbusplus/sdbusplus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
index b771576a1d..f4e258089b 100644
--- a/package/sdbusplus/sdbusplus.mk
+++ b/package/sdbusplus/sdbusplus.mk
@@ -26,7 +26,7 @@ SDBUSPLUS_LICENSE_FILES = LICENSE
 # iff it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define SDBUSPLUS_CREATE_M4
-       mkdir -p $(@D)/m4
+	mkdir -p $(@D)/m4
 endef
 SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
 HOST_SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
