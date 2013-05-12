From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 20:58:40 +0200
Subject: [Buildroot] [git commit] wvstreams: add missing includes for
	getuid()
Message-ID: <20130512185958.0A5DC9A122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=401a3d98e10f7a35614434758aac3115a30972f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/2ad80b1ae823fbe196f8a65220d5d4a0dd202c4e/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wvstreams/wvstreams-0005-getuid.patch |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/wvstreams/wvstreams-0005-getuid.patch b/package/wvstreams/wvstreams-0005-getuid.patch
new file mode 100644
index 0000000..6015066
--- /dev/null
+++ b/package/wvstreams/wvstreams-0005-getuid.patch
@@ -0,0 +1,25 @@
+[PATCH] wvuid.cc: getuid needs sys/types.h + unistd.h
+
+Otherwise the build fails with:
+
+utils/wvuid.cc: In function 'wvuid_t wvgetuid()':
+utils/wvuid.cc:63:19: error: 'getuid' was not declared in this scope
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ utils/wvuid.cc |    2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: wvstreams-4.6.1/utils/wvuid.cc
+===================================================================
+--- wvstreams-4.6.1.orig/utils/wvuid.cc
++++ wvstreams-4.6.1/utils/wvuid.cc
+@@ -33,6 +33,8 @@
+ 
+ #else // not WIN32
+ 
++#include <unistd.h>
++#include <sys/types.h>
+ 
+ WvString wv_username_from_uid(wvuid_t uid)
+ {
