From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 18:40:09 +0100
Subject: [Buildroot] [RFC v1 2/6] package/libb2/libb2.mk: fix
 cross-compile/runtime detection
In-Reply-To: <20210213174013.32584-1-ps.report@gmx.net>
References: <20210213174013.32584-1-ps.report@gmx.net>
Message-ID: <20210213174013.32584-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - squash with previous patch and add proper failure/fix description
---
 package/libb2/libb2.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libb2/libb2.mk b/package/libb2/libb2.mk
index 11d7ef3f55..d5963263f4 100644
--- a/package/libb2/libb2.mk
+++ b/package/libb2/libb2.mk
@@ -12,5 +12,7 @@ LIBB2_INSTALL_STAGING = YES
 # From git
 LIBB2_AUTORECONF = YES
 LIBB2_DEPENDENCIES = host-pkgconf
-
+# disable failing cross-compiling/runtime detection
+LIBB2_CONF_ENV = ax_cv_have_ssse3_ex=no
+LIBB2_CONF_OPTS = --enable-fat=no --enable-native=no
 $(eval $(autotools-package))
-- 
2.30.0
