From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Sep 2015 14:38:48 +0300
Subject: [Buildroot] [PATCH 1/2] ltp-testsuite: don't include host headers
Message-ID: <5e7ab0a7bf987fa76a167569b823df89144af045.1443613129.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$SYSROOT defaults to empty, so we must set it to our sysroot.

Fixes:
http://autobuild.buildroot.net/results/812/812986b00786972d4e7fbb0362460a0de8a70472/
http://autobuild.buildroot.net/results/4a3/4a3c7ea4eb08248f2aec45d8efc111087bc1327f/
http://autobuild.buildroot.net/results/8b6/8b6f7adb5546387c25f3a4c9d8e6f72f4b62b9a4/

and more.

Cc: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ltp-testsuite/ltp-testsuite.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 32038a03a917..b23cc05441dc 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -35,6 +35,7 @@ endif
 LTP_TESTSUITE_CONF_ENV += \
 	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
 	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
-	LIBS="$(LTP_TESTSUITE_LIBS)"
+	LIBS="$(LTP_TESTSUITE_LIBS)" \
+	SYSROOT="$(STAGING_DIR)"
 
 $(eval $(autotools-package))
-- 
2.5.3
