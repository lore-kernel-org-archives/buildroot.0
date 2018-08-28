From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 17:12:46 +0200
Subject: [Buildroot] [git commit] json-c: needs host-autoconf
Message-ID: <20180828151326.EB8DA814BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a3601fe583f937f433e03f954f1ee93ac01b537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The json-c configure script uses the autoheader utility. Use the
host-autoconf provided autoheader, as this tool is not always installed
on the host.

Fixes:
http://autobuild.buildroot.net/results/030/030fddceda4f5bc6379f7bfcc405e92d2e24184a/
http://autobuild.buildroot.net/results/e48/e482f174b8124ace0690a26bb7daf073fe5fcd75/
http://autobuild.buildroot.net/results/482/4829425c38c58d9844aa07108532a93d47191d23/

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-c/json-c.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 57d8c35dd5..bee57577ce 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -10,5 +10,9 @@ JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
+# configure requires autoheader
+JSON_C_DEPENDENCIES = host-autoconf
+HOST_JSON_C_DEPENDENCIES = host-autoconf
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
