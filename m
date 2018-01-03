From: Jan Heylen <heyleke@gmail.com>
Date: Wed,  3 Jan 2018 22:20:09 +0100
Subject: [Buildroot] [PATCH v5 1/3] rabbitmq-c: BUILD_SHARED_LIBS is handled
 in pkg-cmake.mk
In-Reply-To: <1515014411-3504-1-git-send-email-heyleke@gmail.com>
References: <1515014411-3504-1-git-send-email-heyleke@gmail.com>
Message-ID: <1515014411-3504-2-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
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
-- 
2.7.4
