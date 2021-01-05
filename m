From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 23:29:12 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/trace-cmd:
 installs nothing in staging/
Message-ID: <20210108071452.E053C86BE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee84de11dff3561a08953e7334955ac1926f23a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Since its introduction in Buildroot in 2013 with commit 07203d78c24d
(trace-cmd: new package), trace-cmd has declared installing in staging.

But trace-cmd is a generic-package, and has never, ever provided any
commands for staging installation.

Drop this declaration.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 896b93310a2e5f5945f3b792296a05be0373269f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trace-cmd/trace-cmd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index dfca6a170d..09bbf0f2e8 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -7,7 +7,6 @@
 TRACE_CMD_VERSION = trace-cmd-v2.7
 TRACE_CMD_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
-TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
 
