From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 13 May 2013 00:20:57 +0200
Subject: [Buildroot] [PATCH] libsigsegv: fix build on x86_64 (probably
	others too)
Message-ID: <1368397257-3061-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The configure script doesn't detect that the target is posix-compliant
and tries to use a custom version of segfault analysis that actually
doesn't build. Most likely, it's because the configure script doesn't
support linux-3.x. Anyway, we can just tell configure that we're
posix-compliant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsigsegv/libsigsegv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index b8f84da..a1b4f13 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -7,6 +7,7 @@
 LIBSIGSEGV_VERSION = 2.6
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
+LIGSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
 LIBSIGSEGV_LICENSE = GPLv2+
 LIBSIGSEGV_LICENSE_FILES = COPYING
 
-- 
1.8.2.1
