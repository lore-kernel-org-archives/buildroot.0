From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Mar 2013 10:32:05 -0300
Subject: [Buildroot] [PATCH] packages: re-categorize gmp, mpc and mpfr
In-Reply-To: <buildroot@busybox.net>
References: <buildroot@busybox.net>
Message-ID: <1363699925-12549-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They're not development tools, they're libraries, so place them under
libraries->other.
Also adjust gsl sort order.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6f5d56f..688ef5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -72,15 +72,12 @@ source "package/gawk/Config.in"
 endif
 source "toolchain/gcc/Config.in.2"
 source "package/gettext/Config.in"
-source "package/gmp/Config.in"
 source "package/gperf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/grep/Config.in"
 endif
 source "package/intltool/Config.in"
 source "package/make/Config.in"
-source "package/mpc/Config.in"
-source "package/mpfr/Config.in"
 source "package/libtool/Config.in"
 source "package/m4/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -550,6 +547,8 @@ source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
+source "package/gmp/Config.in"
+source "package/gsl/Config.in"
 source "package/gtest/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
@@ -559,7 +558,6 @@ source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libev/Config.in"
 source "package/libffi/Config.in"
-source "package/gsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
@@ -571,6 +569,8 @@ source "package/libseccomp/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
 source "package/lttng-libust/Config.in"
+source "package/mpc/Config.in"
+source "package/mpfr/Config.in"
 source "package/mtdev2tuio/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
-- 
1.8.1.5
