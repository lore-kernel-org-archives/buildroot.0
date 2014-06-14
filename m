From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:10:25 +0200
Subject: [Buildroot] [git commit] mkpasswd: change version from 'undefined'
	to 'buildroot-$(BR2_VERSION)'
Message-ID: <20140614171145.B7EB59CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59bde2b4dfdf3f1ad388a64254f70b6a70e08418
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sources of the mkpasswd package are shipped with Buildroot, rather than
downloaded from an external location. As a result, no explicit version is
defined, causing build messages and build directory to show 'undefined' as
version.

This patch sets the version for mkpasswd to 'buildroot-$(BR2_VERSION), which
would for example expand to 'buildroot-2014.05'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mkpasswd/mkpasswd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
index dc6de19..0447ecc 100644
--- a/package/mkpasswd/mkpasswd.mk
+++ b/package/mkpasswd/mkpasswd.mk
@@ -10,6 +10,8 @@
 HOST_MKPASSWD_SOURCE =
 HOST_MKPASSWD_LICENSE = GPLv2+
 
+HOST_MKPASSWD_VERSION = buildroot-$(BR2_VERSION)
+
 define HOST_MKPASSWD_BUILD_CMDS
 	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
 		package/mkpasswd/mkpasswd.c package/mkpasswd/utils.c \
