From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Dec 2020 22:52:34 +0100
Subject: [Buildroot] [git commit] package/s390-tools: also set HAVE_LIBCURL
Message-ID: <20201201214730.B9C09814BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c194d343fb63d79d7fb46cba6079c3ccd458ae53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set HAVE_LIBCURL when libcurl is available to enable genprotimg and
libekmfweb:
https://github.com/ibm-s390-tools/s390-tools/blob/master/README.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/s390-tools/s390-tools.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 34750bea71..535caf208e 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -18,9 +18,13 @@ S390_TOOLS_MAKE_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
-S390_TOOLS_MAKE_OPTS += HAVE_CURL=1
+S390_TOOLS_MAKE_OPTS += \
+	HAVE_CURL=1 \
+	HAVE_LIBCURL=1
 else
-S390_TOOLS_MAKE_OPTS += HAVE_CURL=0
+S390_TOOLS_MAKE_OPTS += \
+	HAVE_CURL=0 \
+	HAVE_LIBCURL=0
 endif
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
