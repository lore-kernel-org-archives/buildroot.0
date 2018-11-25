From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:20:14 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] trace-cmd: fix site
Message-ID: <20181125221707.5E2DA88417@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbceedcdfa35afa9baa073626a7a9a3929e3de79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Replace $(BR2_KERNEL_MIRROR) by https://git.kernel.org/pub, which
fixes the download of this package:

>>> trace-cmd trace-cmd-v2.6.1 Downloading
Initialized empty Git repository in /home/thomas/dl/trace-cmd/git/.git/
Fetching all references
fatal: repository 'https://cdn.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git/' not found
Detected a corrupted git cache.
Removing it and starting afresh.
Initialized empty Git repository in /home/thomas/dl/trace-cmd/git/.git/
Fetching all references
fatal: repository 'https://cdn.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git/' not found
Detected a corrupted git cache.
This is the second time in a row; bailing out
--2018-11-11 21:08:00--  http://sources.buildroot.net/trace-cmd/trace-cmd-trace-cmd-v2.6.1.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.25.210.19, 104.25.211.19, 2606:4700:20::6819:d313, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.25.210.19|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1859835 (1.8M) [application/x-gtar-compressed]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e311d8387dc829d3f0dfe5508cfabc3458e0fa93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trace-cmd/trace-cmd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 0dc145674f..578e9f124f 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TRACE_CMD_VERSION = trace-cmd-v2.6.1
-TRACE_CMD_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/rostedt/trace-cmd.git
+TRACE_CMD_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
