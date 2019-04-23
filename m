From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue, 23 Apr 2019 15:01:05 +0200
Subject: [Buildroot] [PATCH] package/libglib2: disable compiler warnings
Message-ID: <1556024465-7928-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag is not set by default which yields in a
compilation error when host-qemu package is enabled.
The build fails at libglib2 package because -Werror
is activated which stops the compilation process.
Adding this flag corrects the issue.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/libglib2/libglib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 63bfec3..5fd0544 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -91,6 +91,7 @@ LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
 HOST_LIBGLIB2_CONF_OPTS = \
+	--disable-compile-warnings \
 	--disable-coverage \
 	--disable-dtrace \
 	--disable-fam \
-- 
2.7.4
