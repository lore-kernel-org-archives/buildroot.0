From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 22 Apr 2016 16:57:06 -0400
Subject: [Buildroot] [PATCH v1 2/4] msgpack: bump to version 1.4.0
In-Reply-To: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <1461358628-9352-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And install in staging dir.
---
 package/msgpack/msgpack.hash |  2 +-
 package/msgpack/msgpack.mk   | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
index 8cd8cb6..0b0d2d1 100644
--- a/package/msgpack/msgpack.hash
+++ b/package/msgpack/msgpack.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  97a371ef950c89f48e8dba6abeccab07f1887e9ba6dab921de0f985c7d5075fe  msgpack-0.5.4.tar.gz
+sha256 2136f71560dc634492095aca5fc6d0fec30ce981b34b9777e03a366fbe3f550b msgpack-1.4.0.tar.gz
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 9e23948..51aef2f 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-MSGPACK_VERSION = 0.5.4
-MSGPACK_SITE = http://downloads.sourceforge.net/project/msgpack/msgpack/cpp
-MSGPACK_LICENSE = Apache-2.0
-MSGPACK_LICENSE_FILES = COPYING
+MSGPACK_VERSION = 1.4.0
+MSGPACK_SOURCE = msgpack-$(MSGPACK_VERSION).tar.gz
+MSGPACK_SITE = https://github.com/msgpack/msgpack-c/releases/download/cpp-$(MSGPACK_VERSION)
+MSGPACK_LICENSE = Boost-1.0
+MSGPACK_LICENSE_FILES = LICENSE_1_0.txt
+MSGPACK_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.9.1
