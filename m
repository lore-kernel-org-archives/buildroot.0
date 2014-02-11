From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 10:34:45 +0100
Subject: [Buildroot] [git commit] libsigsegv: disable for ARC
Message-ID: <20140211093849.488FF9C979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff163385ec2a0bf7ab17f37dbdf8241dff240f31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/5cd/5cd051937a9471f7fb47363e868cb4b61d788d75/build-end.log

The ARC uClibc port doesn't provide ucontext_i.sym file required to enable
context manipulation routines that libsigsegv needs.

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigsegv/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index 563ca27..4890552 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSIGSEGV
 	bool "libsigsegv"
 	depends on !BR2_xtensa
+	depends on !BR2_arc # no ucontext_i.sym file
 	help
 	  Library for handling page faults in user mode.
 
