From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:38:52 +0100
Subject: [Buildroot] [git commit] package/libssh: drop cmake workaround
Message-ID: <20210125211911.9E95F83841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed0094a6b24db1ce4f943958b0f79982026eb152
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/libssh.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index c8cb821616..eeb5d8489a 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,9 +17,6 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
-# cmake older than 3.10 require this to avoid try_run() in FindThreads
-LIBSSH_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 ifeq ($(BR2_PACKAGE_LIBSSH_SERVER),y)
 LIBSSH_CONF_OPTS += -DWITH_SERVER=ON
 else
