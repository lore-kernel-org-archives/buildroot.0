From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Dec 2017 19:56:29 +0100
Subject: [Buildroot] [git commit] json-c: build for host
Message-ID: <20171226185839.8D66183563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bbf9833cc03582366ab522754986a9dbbf4a790
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed for the recent cryptsetup version host build.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-c/json-c.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 7adbcaf..86636d7 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -11,7 +11,9 @@ JSON_C_MAKE = $(MAKE1)
 JSON_C_CONF_OPTS = --disable-oldname-compat
 # AUTORECONF is needed because of Makefile.am.inc patch.
 JSON_C_AUTORECONF = YES
+HOST_JSON_C_AUTORECONF = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
