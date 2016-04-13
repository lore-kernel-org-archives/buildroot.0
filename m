From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Wed, 13 Apr 2016 13:49:25 +0200
Subject: [Buildroot] [PATCH 1/1] rabbitmq-c: bump to version 0.8.0
Message-ID: <1460548165-32602-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Made use of github helper because no official tarball
is released.

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/rabbitmq-c/rabbitmq-c.hash | 2 +-
 package/rabbitmq-c/rabbitmq-c.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
index e767872..45e8cbd 100644
--- a/package/rabbitmq-c/rabbitmq-c.hash
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 23df349a7d157543e756acc67e47b217843ecbdafaefe3e4974073bb99d8a26d rabbitmq-c-0.7.1.tar.gz
+sha256 d8ed9dcb49903d83d79d7b227da35ef68c60e5e0b08d0fc1fb4e4dc577b8802b rabbitmq-c-v0.8.0.tar.gz
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index 42e2548..1ca35ad 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RABBITMQ_C_VERSION = 0.7.1
-RABBITMQ_C_SITE = https://github.com/alanxz/rabbitmq-c/releases/download/v$(RABBITMQ_C_VERSION)
+RABBITMQ_C_VERSION = v0.8.0
+RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
 RABBITMQ_C_INSTALL_STAGING = YES
-- 
1.8.3.1
