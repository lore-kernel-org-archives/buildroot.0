From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Nov 2018 15:02:26 +0100
Subject: [Buildroot] [PATCH 1/3] glibc: ensure BR2_MAKE is also used for
 subdirs
Message-ID: <20181119140228.19937-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script contains logic to figure out what make program to
invoke for subdirectories (trying gnumake, gmake, make).  Explicitly force
it to use our BR2_MAKE to ensure the right make version is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 708c22f723..c15f32aa3e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -34,6 +34,7 @@ GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
 # glibc requires make >= 4.0 since 2.28 release.
 # https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
 GLIBC_MAKE = $(BR2_MAKE)
+GLIBC_CONV_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
 
 GLIBC_SUBDIR = build
 
-- 
2.11.0
