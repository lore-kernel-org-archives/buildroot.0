From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Jan 2021 18:12:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libssh: drop cmake workaround
Message-ID: <20210104171231.1621110-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libssh/libssh.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 67e3ad9f91..15b1302a01 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -16,9 +16,6 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
-# cmake older than 3.10 require this to avoid try_run() in FindThreads
-LIBSSH_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 ifeq ($(BR2_PACKAGE_LIBSSH_SERVER),y)
 LIBSSH_CONF_OPTS += -DWITH_SERVER=ON
 else
-- 
2.29.2
