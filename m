From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 21:26:29 +0100
Subject: [Buildroot] [git commit] package/trace-cmd: installs nothing in
 staging/
Message-ID: <20210103200946.C2D7586189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=896b93310a2e5f5945f3b792296a05be0373269f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its introduction in Buildroot in 2013 with commit 07203d78c24d
(trace-cmd: new package), trace-cmd has declared installing in staging.

But trace-cmd is a generic-package, and has never, ever provided any
commands for staging installation.

Drop this declaration.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/trace-cmd/trace-cmd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index ffaf93a7cd..cd3fcb9755 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -7,7 +7,6 @@
 TRACE_CMD_VERSION = trace-cmd-v2.9.1
 TRACE_CMD_SITE = https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
-TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
