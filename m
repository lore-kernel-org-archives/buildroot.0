From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 15:46:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/safeclib: disable -Werror
Message-ID: <20210612134604.519029-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set WARN_CFLAGS to an empty value to avoid the following build failure
with -DNDEBUG which is raised since commit
5a8c50fe05afacc3cbe8e7347e238da9f242fab0

In file included from ./mem/safe_mem_constraint.h:38,
                 from mem/safe_mem_constraint.c:33:
./safeclib_private.h:38: error: "NDEBUG" redefined [-Werror]

Fixes:
 - http://autobuild.buildroot.org/results/942/942b7e9a56a2eb285a64ac0df4910db70c39b49d/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/safeclib/safeclib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 3af8fbb167..73e0f36bfa 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -11,5 +11,6 @@ SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).0-gad76c7.tar.bz2
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
+SAFECLIB_MAKE_OPTS = WARN_CFLAGS=""
 
 $(eval $(autotools-package))
-- 
2.30.2
