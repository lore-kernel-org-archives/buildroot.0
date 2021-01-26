From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 17:35:04 +0100
Subject: [Buildroot] [git commit] package/rabbitmq-c: drop cmake workaround
Message-ID: <20210126164409.B7A4081620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b8b09503f270e5a5dd8070238983392e0dcdf22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rabbitmq-c/rabbitmq-c.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index e059ff706c..d25673b59b 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -13,11 +13,6 @@ RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
 	-DBUILD_TOOLS_DOCS=OFF
 
-# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
-# disable a try_run() call in the FindThreads tests, which caused a
-# build failure when cross-compiling.
-RABBITMQ_C_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 # BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
