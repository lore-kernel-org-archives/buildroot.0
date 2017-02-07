From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  7 Feb 2017 22:56:46 +0100
Subject: [Buildroot] [PATCHv3 09/12] toolchain: copy_toolchain_lib_root:
	remove unused variable LIBDIR
In-Reply-To: <20170207215649.364-1-patrickdepinguin@gmail.com>
References: <20170207215649.364-1-patrickdepinguin@gmail.com>
Message-ID: <20170207215649.364-10-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v3: no changes
v2: new patch

 toolchain/helpers.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index fda6146..6b32a25 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -17,7 +17,6 @@ copy_toolchain_lib_root = \
 		mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 		while true ; do \
 			LIBNAME=`basename $${LIBPATH}`; \
-			LIBDIR=`dirname $${LIBPATH}` ; \
 			LINKTARGET=`readlink $${LIBPATH}` ; \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			if test -h $${LIBPATH} ; then \
-- 
2.10.2
