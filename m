From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 May 2013 08:38:17 +0200
Subject: [Buildroot] [git commit] libsigsegv: fix build on x86_64 (probably
	others too)
Message-ID: <20130513063941.8DE7E9A19D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c58258e212c45fadf6d01ea969798210f767557
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script doesn't detect that the target is posix-compliant
and tries to use a custom version of segfault analysis that actually
doesn't build. Most likely, it's because the configure script doesn't
support linux-3.x. Anyway, we can just tell configure that we're
posix-compliant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsigsegv/libsigsegv.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index b8f84da..ac72c6d 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -7,6 +7,7 @@
 LIBSIGSEGV_VERSION = 2.6
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
+LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
 LIBSIGSEGV_LICENSE = GPLv2+
 LIBSIGSEGV_LICENSE_FILES = COPYING
 
