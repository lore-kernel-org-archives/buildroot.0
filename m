From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 07:29:02 +0200
Subject: [Buildroot] [git commit] package/jitterentropy-library: ensure make
 command is continued across new line
Message-ID: <20191026052256.95AA587FAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50647b7af23f23313c0f40b0e446d5ebfaddb3bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The first line of JITTERENTROPY_LIBRARY_BUILD_CMDS must end with "\" to
concatenate the two lines.

Fixes: build error

[...]
/usr/bin/make -j33 -C
/local/users/mmayer/buildroot/output/arm64/build/jitterentropy-library-2.2.0
/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-gcc
-shared -Wl,-soname,libjitterentropy.so.2 -o libjitterentropy.so.2.2.0
jitterentropy-base.o  -Wl,-z,relro,-z,now  -lrt
/local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-ar
rcs libjitterentropy.a jitterentropy-base.o
jitterentropy
/bin/bash: jitterentropy: command not found

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jitterentropy-library/jitterentropy-library.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 75c770f538..3db04b27d3 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -22,7 +22,7 @@ JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-shared
 endif
 
 define JITTERENTROPY_LIBRARY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
 endef
 
