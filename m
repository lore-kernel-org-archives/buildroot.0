From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:39:27 +0200
Subject: [Buildroot] [git commit] uclibc: clean-up test suite build command
Message-ID: <20151018213932.0827981DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b745982ed9a72c34792afbba81d1864716273d6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting from uClibc 0.9.32 "test_compile" target builds tests flawlessly.
For 0.9.31 it lead to build failure, but now when AVR32 support was dropped
I think this change worth applying.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index eaac9dc..7ff98b0 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -398,12 +398,10 @@ endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 define UCLIBC_BUILD_TEST_SUITE
-	$(MAKE1) -C $(@D)/test \
+	$(MAKE1) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
-		ARCH_CFLAGS=-I$(STAGING_DIR)/usr/include \
 		UCLIBC_ONLY=1 \
-		TEST_INSTALLED_UCLIBC=1 \
-		compile
+		test_compile
 endef
 endif
 
