From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Nov 2013 16:06:56 +0100
Subject: [Buildroot] [git commit] iptables: bump to version 1.4.21
Message-ID: <20131201201520.34D0D9BE44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8372954b5b15273d95c46eb1aae6ed007ef05644
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptables/iptables-01-fix-static-link.patch |    5 +++--
 package/iptables/iptables.mk                       |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/iptables/iptables-01-fix-static-link.patch b/package/iptables/iptables-01-fix-static-link.patch
index d4bcfa6..ce2ea48 100644
--- a/package/iptables/iptables-01-fix-static-link.patch
+++ b/package/iptables/iptables-01-fix-static-link.patch
@@ -14,6 +14,7 @@ If libnetfilter_conntrack is not found, @libnetfilter_conntrack_CFLAGS@
 and @libnetfilter_conntrack_LIBS@ (and their ${} ones) should be empty,
 therefore producing no harm to include unconditionally.
 
+[Gustavo: update for iptables 1.4.21]
 Reported-and-tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Florian Westphal <fw@strlen.de>
 ---
@@ -25,8 +26,8 @@ index 14e7c57..780e715 100644
  kinclude_CPPFLAGS  = @kinclude_CPPFLAGS@
  
  AM_CFLAGS       = ${regular_CFLAGS}
--AM_CPPFLAGS     = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_builddir} -I${top_srcdir}/include ${kinclude_CPPFLAGS}
-+AM_CPPFLAGS     = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_builddir} -I${top_srcdir}/include ${kinclude_CPPFLAGS} @libnetfilter_conntrack_CFLAGS@
+-AM_CPPFLAGS     = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_builddir} -I${top_srcdir}/include ${kinclude_CPPFLAGS} ${CPPFLAGS}
++AM_CPPFLAGS     = ${regular_CPPFLAGS} -I${top_builddir}/include -I${top_builddir} -I${top_srcdir}/include ${kinclude_CPPFLAGS} ${CPPFLAGS} @libnetfilter_conntrack_CFLAGS@
  AM_DEPFLAGS     = -Wp,-MMD,$(@D)/.$(@F).d,-MT,$@
  AM_LDFLAGS      = @noundef_LDFLAGS@
  
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 6547069..dbd2dc7 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.4.20
+IPTABLES_VERSION = 1.4.21
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
