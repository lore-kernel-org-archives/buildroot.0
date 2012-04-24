From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Apr 2012 22:32:55 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: pass --enable-ipv6 to
	autotargets configure when enabled
Message-ID: <20120424203537.83B0396BAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a10c9d0a2aaec7597b53b90fff784dfc691f337
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages don't automatically enable IPv6 support if not configured
with --disable-ipv6, or use AC_TRY_RUN which doesn't work when cross
compiling (like curl), so explicitly configure with --enable-ipv6.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 943017b..655951e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -279,7 +279,9 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 DISABLE_DOCUMENTATION=--disable-gtk-doc
 endif
 
-ifneq ($(BR2_INET_IPV6),y)
+ifeq ($(BR2_INET_IPV6),y)
+DISABLE_IPV6= --enable-ipv6
+else
 DISABLE_IPV6= --disable-ipv6
 endif
 
