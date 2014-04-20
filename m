From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 10:54:50 +0200
Subject: [Buildroot] [git commit] jansson: needs math library
Message-ID: <20140420085528.C77B89C8E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbe4b0a71fdac86e6eaf09ee6ed5b8fa313287ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libjansson.so doesn't list libm in its NEEDED header. Fixes the following
nftables config time failure:

.../usr/lib/libjansson.so.4: undefined reference to `__isnan'
.../usr/lib/libjansson.so.4: undefined reference to `__isinf'

Fixes:
http://autobuild.buildroot.net/results/152/1525d7a3e1d1fcf35858962251c0b69a5e1b64db/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jansson/jansson.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 6ead0ec..d51e709 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -9,5 +9,6 @@ JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
 JANSSON_INSTALL_STAGING = YES
+JANSSON_CONF_ENV = LIBS="-lm"
 
 $(eval $(autotools-package))
