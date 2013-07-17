From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 22:30:47 +0200
Subject: [Buildroot] [PATCHv3 1/4] toolchain/helpers: don't use the x$(...)
	= x"value" syntax
In-Reply-To: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1374093050-30344-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noted by Yann E. Morin, the x$(...) = x"value" syntax is old and
ugly, and the easier to read "$(...)" = "value" can now be used
without problems.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 95217e7..764c795 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -181,7 +181,7 @@ create_lib64_symlinks = \
 # $2: feature description
 #
 check_glibc_feature = \
-	if [ x$($(1)) != x"y" ] ; then \
+	if [ "$($(1))" != "y" ] ; then \
 		echo "$(2) available in C library, please enable $(1)" ; \
 		exit 1 ; \
 	fi
@@ -236,11 +236,11 @@ check_glibc = \
 #
 check_uclibc_feature = \
 	IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
-	if [ x$($(2)) != x"y" -a x$${IS_IN_LIBC} = x"y" ] ; then \
+	if [ "$($(2))" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
 		echo "$(4) available in C library, please enable $(2)" ; \
 		exit 1 ; \
 	fi ; \
-	if [ x$($(2)) = x"y" -a x$${IS_IN_LIBC} != x"y" ] ; then \
+	if [ "$($(2))" = "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
 		echo "$(4) not available in C library, please disable $(2)" ; \
 		exit 1 ; \
 	fi
-- 
1.8.1.2
