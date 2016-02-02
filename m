From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Feb 2016 16:31:19 +0100
Subject: [Buildroot] [PATCH v3 01/18] icu: libatomic is only available
	starting from gcc 4.8
In-Reply-To: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1454427096-20967-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/51b060bbdecdcaac89f764026693bf711e7145d5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/icu.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 7bc7f93..b4574e5 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -18,10 +18,10 @@ ICU_CONF_OPTS = \
 	--disable-samples \
 	--disable-tests
 
-# With gcc >= 4.7, icu prefers to use C++11 atomics, which rely on the
+# When available, icu prefers to use C++11 atomics, which rely on the
 # __atomic builtins. On certain architectures, this requires linking
-# with libatomic.
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+# with libatomic starting from gcc 4.8.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
 ICU_CONF_ENV += LIBS="-latomic"
 endif
 
-- 
2.6.4
