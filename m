From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 Feb 2012 14:06:33 +0100
Subject: [Buildroot] [git commit] ipsec-tools: get rid of explicit ipv6
	handling
Message-ID: <20120210130757.43CE190A56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cda6b7fe0f6335d202bc797091c68a78278118f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is taken care of by autotargets.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipsec-tools/ipsec-tools.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index d7f8e35..f24e4a4 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -50,12 +50,6 @@ else
 IPSEC_TOOLS_CONF_OPT+= --disable-stats
 endif
 
-ifeq ($(BR2_INET_IPV6),y)
-IPSEC_TOOLS_CONF_OPT+= --enable-ipv6
-else
-IPSEC_TOOLS_CONF_OPT+= --disable-ipv6
-endif
-
 ifneq ($(BR2_PACKAGE_IPSEC_TOOLS_READLINE), y)
 IPSEC_TOOLS_CONF_OPT+= --without-readline
 else
