From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Oct 2009 22:59:49 +0200
Subject: [Buildroot] [git commit master] honour DISABLE_IPV6
Message-ID: <20091007210623.637B777784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=263c2f83177992b402d48cffda0e97faffe21f1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pass --disable-ipv6 to autoconfig packages if IPv6 support is turned off

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d36c884..c3257cf 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -256,6 +256,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 		$(DISABLE_DOCUMENTATION) \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
+		$(DISABLE_IPV6) \
 		$(QUIET) $($(PKG)_CONF_OPT)
 	$(Q)touch $@
 
-- 
1.6.3.3
