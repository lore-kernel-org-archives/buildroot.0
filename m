From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Jun 2019 01:44:24 +0200
Subject: [Buildroot] [git commit] package/poppler: use THREAD_PTHREAD_ARG=OFF
Message-ID: <20190608234527.987B48B454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=589bc51d7cfa20af87b8e7bea854ed59a587b309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noted by Fabrice, all other packages that show CMake's FindThreads
issue fix it by setting THREAD_PTHREAD_ARG=OFF instead of setting
THREAD_HAVE_PTHREAD_ARG=ON. So, for consistency, do the same for
poppler.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/poppler/poppler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index ebb918de03..ffa65f68ce 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -21,7 +21,7 @@ POPPLER_CONF_OPTS = \
 	-DENABLE_GTK_DOC=OFF
 
 # cmake older than 3.10 requires this to avoid try_run() in FindThreads
-POPPLER_CONF_OPTS += -DTHREADS_HAVE_PTHREAD_ARG=ON
+POPPLER_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
