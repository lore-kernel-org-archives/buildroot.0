From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 17:35:06 +0100
Subject: [Buildroot] [git commit] package/poppler: drop cmake workaround
Message-ID: <20210126164409.D266581620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1b3c0d622d0b83be526c84f4bf92490667f052a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poppler/poppler.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index e779a7c9d3..aba8602e06 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -19,9 +19,6 @@ POPPLER_CONF_OPTS = \
 	-DBUILD_CPP_TESTS=OFF \
 	-DENABLE_GTK_DOC=OFF
 
-# cmake older than 3.10 requires this to avoid try_run() in FindThreads
-POPPLER_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
