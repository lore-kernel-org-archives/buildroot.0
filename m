From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 23:59:52 +0200
Subject: [Buildroot] [PATCH next 2/4] e2fsprogs: build shared library for
 the host
In-Reply-To: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
References: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180821215954.11971-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, the e2fsprogs package builds and installs only static
libraries, unless --enable-elf-shlibs is passed. For the target
variant, we pass the appropriate
--enable-elf-shlibs/--disable-elf-shlibs options, but not for the host
package, and therefore static e2fsprogs libraries get installed.

However, on the host, our policy is to build shared libraries and not
static libraries, as visible in the default configure options passed
to host package in pkg-autotools.mk (--enable-shared
--disable-static). Let's do the same with e2fsprogs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/e2fsprogs/e2fsprogs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index efc10d0e99..65f9774afb 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -27,7 +27,8 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--disable-libblkid \
 	--disable-libuuid \
 	--enable-symlink-install \
-	--disable-testio-debug
+	--disable-testio-debug \
+	--enable-elf-shlibs
 
 # Set the binary directories to "/bin" and "/sbin", as busybox does,
 # so that we do not end up with two versions of e2fs tools.
-- 
2.14.4
