From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2019 09:41:52 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/rabbitmq-c:
 security bump to version 0.10.0
Message-ID: <20191206084019.DA57083854@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fc8d57f3494fe43b668b5590ce7bbe3eaf3854f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add additional input validation to prevent integer overflow when parsing
a frame header. This addresses CVE-2019-18609.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 63d0762ab72a3536ea2e07ac75327c7556ed72c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rabbitmq-c/rabbitmq-c.hash | 2 +-
 package/rabbitmq-c/rabbitmq-c.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
index 0af88774e6..eb57626518 100644
--- a/package/rabbitmq-c/rabbitmq-c.hash
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 316c0d156452b488124806911a62e0c2aa8a546d38fc8324719cd29aaa493024 rabbitmq-c-v0.9.0.tar.gz
+sha256 6455efbaebad8891c59f274a852b75b5cc51f4d669dfc78d2ae7e6cc97fcd8c0 rabbitmq-c-0.10.0.tar.gz
 sha256 94a12c906acb31a66c2c8a6c1b6e46cab52bc5694c5ada2a06d86b05d3d3f422 LICENSE-MIT
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index 6385ccb6b6..e059ff706c 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RABBITMQ_C_VERSION = v0.9.0
-RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,$(RABBITMQ_C_VERSION))
+RABBITMQ_C_VERSION = 0.10.0
+RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
 RABBITMQ_C_INSTALL_STAGING = YES
