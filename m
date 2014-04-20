From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 20 Apr 2014 10:22:39 +0300
Subject: [Buildroot] [PATCH] jansson: needs math library
Message-ID: <1689aa2a424cf897e59956c16b850971c7a4b514.1397978559.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libjansson.so doesn't list libm in its NEEDED header. Fixes the following
nftables config time failure:

.../usr/lib/libjansson.so.4: undefined reference to `__isnan'
.../usr/lib/libjansson.so.4: undefined reference to `__isinf'

Fixes:
http://autobuild.buildroot.net/results/152/1525d7a3e1d1fcf35858962251c0b69a5e1b64db/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/jansson/jansson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 6ead0ec10c9a..d51e7097cd8c 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -9,5 +9,6 @@ JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
 JANSSON_INSTALL_STAGING = YES
+JANSSON_CONF_ENV = LIBS="-lm"
 
 $(eval $(autotools-package))
-- 
1.9.1
