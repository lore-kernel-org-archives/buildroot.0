From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 16:11:20 +0200
Subject: [Buildroot] [git commit] libunwind: depend on libatomic_ops when
	available
Message-ID: <20140516141217.B98829CC3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34aa3f2354ffcdcf545567d9455ac2e217ca92ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunwind/libunwind.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 48dd0ec..a75a888 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -11,4 +11,8 @@ LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
 LIBUNWIND_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
+LIBUNWIND_DEPENDENCIES = libatomic_ops
+endif
+
 $(eval $(autotools-package))
