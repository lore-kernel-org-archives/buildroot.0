From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 23:38:19 +0100
Subject: [Buildroot] [git commit] lirc-tools: remove non-existing
	configuration options
Message-ID: <20151028224140.D65C081F00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7af393a30c5ad274243c4f45c91a4d053233b62c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-sandboxed and --with-driver options were used in 0.9.1
From 0.9.2 they are not used anymore.

Signed-off-by: David Kosir <david.kosir@bylapis.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: resend without whitespace errors]
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lirc-tools/lirc-tools.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 2052b72..fbd8aaf 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -11,10 +11,7 @@ LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-pkgconf
 
-LIRC_TOOLS_CONF_OPTS = \
-	--without-x \
-	--enable-sandboxed \
-	--with-driver=userspace
+LIRC_TOOLS_CONF_OPTS = --without-x
 
 define LIRC_TOOLS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd \
