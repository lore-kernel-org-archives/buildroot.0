From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 22:48:14 +0100
Subject: [Buildroot] [PATCH 6/9] package/poppler: drop cmake workaround
In-Reply-To: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
References: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125214817.1177142-6-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.29.2
