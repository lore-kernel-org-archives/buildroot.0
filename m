From: hartleys <hartleys@visionengravers.com>
Date: Mon, 7 Jul 2008 13:04:02 -0400
Subject: [Buildroot] Problem with external-toolchain copy_toolchain_lib_root
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909305C1B@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm not sure if this is a problem with the find utility on my system
(Debian etch) or a problem in the ext-tool.mk file. The problem is my
external library files were getting found but not copied to my root
filesystem.

The following change to ext-tool.mk fixed the problem.

Thanks,
Hartley


@@ -18,7 +18,7 @@
 	fi; \
  \
 	LIB="$(strip $1)"; \
-	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name
"$${LIB}*"`; do \
+	for FILE in `find $${LIB_DIR}/ -maxdepth 1 -type l -name
"$${LIB}*"`; do \
 		LIB=`basename $${FILE}`; \
 		while test \! -z "$${LIB}"; do \
 			echo "copy_toolchain_lib_root lib=$${LIB}
dst=$${DST}"; \
