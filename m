From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:26 -0000
Subject: [Buildroot] [git commit] trace-cmd: fix site
Message-ID: <20181202071554.5E8A78A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aff612a0d024bdc7bea37250693a9c4d548b8a6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
