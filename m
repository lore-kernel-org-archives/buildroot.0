From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat,  4 Feb 2017 14:42:11 +0100
Subject: [Buildroot] [PATCHv2 07/10] toolchain: copy_toolchain_lib_root:
	remove unused variable LIBDIR
In-Reply-To: <20170204134214.20592-1-patrickdepinguin@gmail.com>
References: <20170204134214.20592-1-patrickdepinguin@gmail.com>
Message-ID: <20170204134214.20592-8-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: new patch

 toolchain/helpers.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 611aaab..dab9cd3 100644
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
