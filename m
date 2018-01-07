From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:38:54 +0100
Subject: [Buildroot] [git commit] rabbitmq-c: don't pass BUILD_SHARED_LIBS
Message-ID: <20180107224038.EA4A783B9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7022190c4bec602e1ec996cbec92a118010b5b70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BUILD_SHARED_LIBS option is already handled by the cmake-package
infrastructure, so there is no need to pass it at the package level.

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rabbitmq-c/rabbitmq-c.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index eef09ec..d496a4c 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -13,12 +13,13 @@ RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
 	-DBUILD_TOOLS_DOCS=OFF
 
+# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
 ifeq ($(BR2_STATIC_LIBS),y)
-RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON
+RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
 else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON
+RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
 else ifeq ($(BR2_SHARED_LIBS),y)
-RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF
+RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
 endif
 
 # CMake OpenSSL detection is buggy, and doesn't properly use
